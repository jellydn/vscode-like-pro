$ErrorActionPreference = "Stop"
$rootDirectory = Split-Path -Parent $PSScriptRoot
$testDirectory = Join-Path ([System.IO.Path]::GetTempPath()) "vscode-like-pro-tests-$([guid]::NewGuid())"
$runningOnWindows = [System.Environment]::OSVersion.Platform -eq [System.PlatformID]::Win32NT

function Assert-Equal {
	param(
		[Parameter(Mandatory)]$Expected,
		[Parameter(Mandatory)]$Actual,
		[Parameter(Mandatory)][string]$Message
	)

	if ($Expected -ne $Actual) {
		throw "$Message`nExpected: $Expected`nActual: $Actual"
	}
}

try {
	$repository = Join-Path $testDirectory "repository with spaces"
	$fakeBin = Join-Path $testDirectory "fake bin"
	$secondFakeBin = Join-Path $testDirectory "second fake bin"
	$appData = Join-Path $testDirectory "AppData/Roaming"
	$localAppData = Join-Path $testDirectory "AppData/Local"
	$vscodeDirectory = Join-Path $appData "Code/User"
	$extensionLog = Join-Path $testDirectory "extensions.log"
	$secondExtensionLog = Join-Path $testDirectory "second-extensions.log"

	New-Item -ItemType Directory -Path (Join-Path $repository "lib"), (Join-Path $repository "VSCode"), $fakeBin, $secondFakeBin, $vscodeDirectory -Force | Out-Null
	Copy-Item (Join-Path $rootDirectory "install.ps1") $repository
	Copy-Item (Join-Path $rootDirectory "lib/editor-config.ps1") (Join-Path $repository "lib")
	Set-Content -LiteralPath (Join-Path $repository "extensions.txt") -Value @("publisher.first", "publisher.second")
	Set-Content -LiteralPath (Join-Path $repository "extensions-vscode-marketplace.txt") -Value "publisher.marketplace"
	Set-Content -LiteralPath (Join-Path $repository "VSCode/settings.json") -Value "repository settings" -NoNewline
	Set-Content -LiteralPath (Join-Path $repository "vscode.lua") -Value "repository nvim" -NoNewline
	. (Join-Path $repository "lib/editor-config.ps1")
	Assert-Equal 1 @(Get-EditorExtensionFiles -Editor VSCodium -Repository $repository).Count "VSCodium included VS Code Marketplace-only extensions."
	Assert-Equal 1 @(Get-EditorExtensionFiles -Editor Cursor -Repository $repository).Count "Cursor included VS Code Marketplace-only extensions."
	Assert-Equal 2 @(Get-EditorExtensionFiles -Editor VSCode -Repository $repository).Count "VS Code extension manifests were incorrect."
	if ($runningOnWindows) {
		Set-Content -LiteralPath (Join-Path $fakeBin "code.cmd") -Value "@echo off`r`necho %*>>`"%EXTENSION_LOG%`"" -NoNewline
		Set-Content -LiteralPath (Join-Path $secondFakeBin "code.cmd") -Value "@echo off`r`necho %*>>`"%SECOND_EXTENSION_LOG%`"" -NoNewline
	}
	else {
		$fakeCommand = Join-Path $fakeBin "code"
		$secondFakeCommand = Join-Path $secondFakeBin "code"
		$fakeCommandContent = @'
#!/usr/bin/env bash
printf '%s\n' "$*" >>"$EXTENSION_LOG"
'@
		$secondFakeCommandContent = @'
#!/usr/bin/env bash
printf '%s\n' "$*" >>"$SECOND_EXTENSION_LOG"
'@
		Set-Content -LiteralPath $fakeCommand -Value $fakeCommandContent -NoNewline
		Set-Content -LiteralPath $secondFakeCommand -Value $secondFakeCommandContent -NoNewline
		chmod +x $fakeCommand $secondFakeCommand
	}

	$oldPath = $env:PATH
	$env:PATH = "$fakeBin$([System.IO.Path]::PathSeparator)$secondFakeBin$([System.IO.Path]::PathSeparator)$oldPath"
	$env:APPDATA = $appData
	$env:LOCALAPPDATA = $localAppData
	$env:EXTENSION_LOG = $extensionLog
	$env:SECOND_EXTENSION_LOG = $secondExtensionLog
	Remove-Item Env:VSCODE_LIKE_PRO_APP_SUPPORT_DIR -ErrorAction SilentlyContinue
	Remove-Item Env:VSCODE_LIKE_PRO_NVIM_CONFIG -ErrorAction SilentlyContinue

	& (Join-Path $repository "install.ps1") -Editor VSCode | Out-Null

	Assert-Equal "repository settings" (Get-Content -LiteralPath (Join-Path $vscodeDirectory "settings.json") -Raw) "Windows settings path was incorrect."
	Assert-Equal "repository nvim" (Get-Content -LiteralPath (Join-Path $localAppData "nvim/lua/plugins/vscode.lua") -Raw) "Windows Neovim path was incorrect."
	$extensionCalls = (Get-Content -LiteralPath $extensionLog) -join "`n"
	Assert-Equal "--install-extension publisher.first --force`n--install-extension publisher.second --force`n--install-extension publisher.marketplace --force" $extensionCalls "Extension CLI arguments were incorrect."
	Assert-Equal $false (Test-Path -LiteralPath $secondExtensionLog) "PowerShell invoked more than the first editor command on PATH."

	$beforeDryRun = Get-Content -LiteralPath $extensionLog -Raw
	Set-Content -LiteralPath (Join-Path $vscodeDirectory "settings.json") -Value "local settings" -NoNewline
	& (Join-Path $repository "install.ps1") -Editor VSCode -DryRun | Out-Null
	Assert-Equal $beforeDryRun (Get-Content -LiteralPath $extensionLog -Raw) "Dry run invoked the editor CLI."
	Assert-Equal "local settings" (Get-Content -LiteralPath (Join-Path $vscodeDirectory "settings.json") -Raw) "Dry run copied editor settings."

	$downloadedDirectory = Join-Path $testDirectory "downloaded"
	New-Item -ItemType Directory -Path $downloadedDirectory -Force | Out-Null
	Copy-Item (Join-Path $rootDirectory "install.ps1") $downloadedDirectory
	Set-Content -LiteralPath (Join-Path $repository "VSCode/settings.json") -Value "bootstrap settings" -NoNewline
	$env:BOOTSTRAP_FIXTURE = $repository
	if ($runningOnWindows) {
		Set-Content -LiteralPath (Join-Path $fakeBin "git.cmd") -Value "@echo off`r`nxcopy /E /I /Q /Y `"%BOOTSTRAP_FIXTURE%\*`" `"%~5`" >nul" -NoNewline
	}
	else {
		$fakeGit = Join-Path $fakeBin "git"
		$fakeGitContent = @'
#!/usr/bin/env bash
destination="${@: -1}"
cp -R "$BOOTSTRAP_FIXTURE"/. "$destination/"
'@
		Set-Content -LiteralPath $fakeGit -Value $fakeGitContent -NoNewline
		chmod +x $fakeGit
	}

	& (Join-Path $downloadedDirectory "install.ps1") -Editor VSCode -SkipExtensions | Out-Null
	Assert-Equal "bootstrap settings" (Get-Content -LiteralPath (Join-Path $vscodeDirectory "settings.json") -Raw) "Downloaded Windows installer did not bootstrap the repository."
	Assert-Equal $beforeDryRun (Get-Content -LiteralPath $extensionLog -Raw) "SkipExtensions invoked the editor CLI."

	Write-Host "PowerShell script tests passed."
}
finally {
	$env:PATH = $oldPath
	Remove-Item -LiteralPath $testDirectory -Recurse -Force -ErrorAction SilentlyContinue
}
