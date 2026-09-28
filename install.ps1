[CmdletBinding()]
param(
	[switch]$DryRun,
	[switch]$SkipExtensions,
	[Alias("Editor")]
	[string]$SelectedEditor
)

$ErrorActionPreference = "Stop"
$scriptDirectory = $PSScriptRoot
$validEditors = @("VSCodium", "VSCodiumInsider", "VSCode", "VSCodeInsider", "Cursor", "Windsurf", "Trae")

if ($SelectedEditor -and $SelectedEditor -notin $validEditors) {
	throw "Unknown editor: $SelectedEditor. Valid editors: $($validEditors -join ', ')"
}

if (-not $scriptDirectory -or -not (Test-Path (Join-Path $scriptDirectory "lib/editor-config.ps1"))) {
	if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
		throw "git is required to download vscode-like-pro."
	}

	$temporaryDirectory = Join-Path ([System.IO.Path]::GetTempPath()) "vscode-like-pro-$([guid]::NewGuid())"
	try {
		Write-Host "Downloading vscode-like-pro..."
		git clone --depth 1 https://github.com/jellydn/vscode-like-pro.git $temporaryDirectory
		if ($LASTEXITCODE -ne 0) {
			throw "Could not clone vscode-like-pro."
		}
		& (Join-Path $temporaryDirectory "install.ps1") @PSBoundParameters
	}
	finally {
		Remove-Item -LiteralPath $temporaryDirectory -Recurse -Force -ErrorAction SilentlyContinue
	}
	return
}

. (Join-Path $scriptDirectory "lib/editor-config.ps1")

function Install-EditorExtensions {
	param(
		[Parameter(Mandatory)][string]$EditorName,
		[Parameter(Mandatory)][string]$Command
	)

	if ($SkipExtensions) {
		Write-Host "Skipped extensions: $EditorName"
		return
	}

	$editorCommand = Get-Command $Command -CommandType Application -TotalCount 1 -ErrorAction SilentlyContinue
	if (-not $editorCommand) {
		Write-Host "Skipped extensions (CLI not found: $Command): $EditorName"
		return
	}

	foreach ($extensionsFile in Get-EditorExtensionFiles -Editor $EditorName -Repository $scriptDirectory) {
		foreach ($extension in Get-Content -LiteralPath $extensionsFile) {
			$extension = $extension.Trim()
			if (-not $extension -or $extension.StartsWith("#")) {
				continue
			}
			if ($DryRun) {
				Write-Host "Would run: $Command --install-extension $extension --force"
			}
			else {
				& $editorCommand.Source --install-extension $extension --force | Out-Host
				if ($LASTEXITCODE -ne 0) {
					throw "$Command could not install extension: $extension"
				}
			}
		}
	}
}

function Install-Editor {
	param([Parameter(Mandatory)][string]$EditorName)

	$destinationDirectory = Get-EditorUserDirectory $EditorName
	$command = Get-EditorCommand $EditorName
	$editorCommand = Get-Command $command -CommandType Application -TotalCount 1 -ErrorAction SilentlyContinue
	if (-not (Test-Path -LiteralPath $destinationDirectory -PathType Container) -and -not $editorCommand) {
		Write-Host "Skipped (not installed): $EditorName"
		return $false
	}

	Write-Host "Installing $EditorName configuration..."
	foreach ($relativePath in $ManagedFiles) {
		Copy-ManagedFile `
			-Source (Join-Path (Join-Path $scriptDirectory $EditorName) $relativePath) `
			-Destination (Join-Path $destinationDirectory $relativePath) `
			-DryRun $DryRun
	}
	Install-EditorExtensions -EditorName $EditorName -Command $command
	return $true
}

if ($SelectedEditor) {
	if (-not (Install-Editor $SelectedEditor)) {
		exit 1
	}
}
else {
	$detectedEditors = 0
	foreach ($editorName in $EditorNames) {
		if (Install-Editor $editorName) {
			$detectedEditors++
		}
	}
	if ($detectedEditors -eq 0) {
		throw "No supported editors were detected."
	}
}

Copy-ManagedFile `
	-Source (Join-Path $scriptDirectory "vscode.lua") `
	-Destination (Get-NeovimConfigFile) `
	-DryRun $DryRun

Write-Host "Installation complete."
