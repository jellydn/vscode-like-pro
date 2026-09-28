$EditorNames = @(
	"VSCodium",
	"VSCodiumInsider",
	"VSCode",
	"VSCodeInsider",
	"Cursor",
	"Windsurf",
	"Trae"
)

$ManagedFiles = @(
	"settings.json",
	"keybindings.json",
	"snippets/global-js.code-snippets"
)

$EditorDirectories = @{
	VSCodium        = "VSCodium/User"
	VSCodiumInsider = "VSCodium - Insiders/User"
	VSCode          = "Code/User"
	VSCodeInsider   = "Code - Insiders/User"
	Cursor           = "Cursor/User"
	Windsurf         = "Windsurf/User"
	Trae             = "Trae/User"
}

$EditorCommands = @{
	VSCodium        = "codium"
	VSCodiumInsider = "codium-insiders"
	VSCode          = "code"
	VSCodeInsider   = "code-insiders"
	Cursor           = "cursor"
	Windsurf         = "windsurf"
	Trae             = "trae"
}

function Get-EditorUserDirectory {
	param([Parameter(Mandatory)][string]$Editor)

	if (-not $EditorDirectories.ContainsKey($Editor)) {
		throw "Unknown editor: $Editor"
	}

	$root = $env:VSCODE_LIKE_PRO_APP_SUPPORT_DIR
	if (-not $root) {
		$root = $env:APPDATA
	}
	if (-not $root) {
		throw "APPDATA is required on Windows."
	}

	Join-Path $root $EditorDirectories[$Editor]
}

function Get-EditorCommand {
	param([Parameter(Mandatory)][string]$Editor)

	if (-not $EditorCommands.ContainsKey($Editor)) {
		throw "Unknown editor: $Editor"
	}

	$EditorCommands[$Editor]
}

function Get-EditorExtensionFiles {
	param(
		[Parameter(Mandatory)][string]$Editor,
		[Parameter(Mandatory)][string]$Repository
	)

	Join-Path $Repository "extensions.txt"
	if ($Editor -in @("VSCode", "VSCodeInsider")) {
		Join-Path $Repository "extensions-vscode-marketplace.txt"
	}
}

function Get-NeovimConfigFile {
	if ($env:VSCODE_LIKE_PRO_NVIM_CONFIG) {
		return $env:VSCODE_LIKE_PRO_NVIM_CONFIG
	}

	$root = if ($env:LOCALAPPDATA) { $env:LOCALAPPDATA } else { $env:APPDATA }
	if (-not $root) {
		throw "LOCALAPPDATA or APPDATA is required on Windows."
	}
	Join-Path $root "nvim/lua/plugins/vscode.lua"
}

function Copy-ManagedFile {
	param(
		[Parameter(Mandatory)][string]$Source,
		[Parameter(Mandatory)][string]$Destination,
		[Parameter(Mandatory)][bool]$DryRun
	)

	if (-not (Test-Path -LiteralPath $Source -PathType Leaf)) {
		Write-Host "Skipped (not found): $Source"
		return
	}
	if ($DryRun) {
		Write-Host "Would copy: $Source -> $Destination"
		return
	}

	$parent = Split-Path -Parent $Destination
	New-Item -ItemType Directory -Path $parent -Force | Out-Null
	Copy-Item -LiteralPath $Source -Destination $Destination -Force
	Write-Host "Copied: $Source -> $Destination"
}
