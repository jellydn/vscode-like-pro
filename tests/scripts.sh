#!/usr/bin/env bash

set -euo pipefail

ROOT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEST_DIRECTORY="$(mktemp -d)"
trap 'rm -rf "$TEST_DIRECTORY"' EXIT INT TERM

fail() {
	echo "FAIL: $1" >&2
	exit 1
}

assert_content() {
	local expected="$1"
	local file="$2"
	local actual

	[[ -f "$file" ]] || fail "Expected file: $file"
	actual="$(cat "$file")"
	[[ "$actual" == "$expected" ]] || fail "Unexpected content in $file"
}

copy_scripts() {
	local repository="$1"

	mkdir -p "$repository"
	cp "$ROOT_DIRECTORY/install.sh" "$ROOT_DIRECTORY/generate.sh" "$repository/"
	cp "$ROOT_DIRECTORY/extensions.txt" "$ROOT_DIRECTORY/extensions-vscode-marketplace.txt" "$repository/"
	cp -R "$ROOT_DIRECTORY/lib" "$repository/"
}

test_install() {
	local repository="$TEST_DIRECTORY/install repository"
	local application_support="$TEST_DIRECTORY/install home/Library/Application Support"
	local editor_directory="$application_support/Cursor/User"
	local nvim_file="$TEST_DIRECTORY/install home/.config/nvim/vscode.lua"

	copy_scripts "$repository"
	mkdir -p "$repository/Cursor" "$editor_directory"
	printf 'repository settings' >"$repository/Cursor/settings.json"
	printf 'repository keys' >"$repository/Cursor/keybindings.json"
	printf 'repository nvim' >"$repository/vscode.lua"

	VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$nvim_file" \
		bash "$repository/install.sh" --skip-extensions Cursor >/dev/null

	assert_content "repository settings" "$editor_directory/settings.json"
	assert_content "repository keys" "$editor_directory/keybindings.json"
	assert_content "repository nvim" "$nvim_file"

	printf 'local settings' >"$editor_directory/settings.json"
	VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$nvim_file" \
		bash "$repository/install.sh" --dry-run Cursor >/dev/null
	assert_content "local settings" "$editor_directory/settings.json"
}

test_generate() {
	local repository="$TEST_DIRECTORY/generate repository"
	local application_support="$TEST_DIRECTORY/generate home/Library/Application Support"
	local editor_directory="$application_support/Code - Insiders/User"
	local nvim_file="$TEST_DIRECTORY/generate home/.config/nvim/vscode.lua"

	copy_scripts "$repository"
	mkdir -p "$editor_directory/snippets" "$(dirname "$nvim_file")"
	printf 'local settings' >"$editor_directory/settings.json"
	printf 'local keys' >"$editor_directory/keybindings.json"
	printf 'local snippet' >"$editor_directory/snippets/global-js.code-snippets"
	printf 'local nvim' >"$nvim_file"

	VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$nvim_file" \
		bash "$repository/generate.sh" VSCodeInsider >/dev/null

	assert_content "local settings" "$repository/VSCodeInsider/settings.json"
	assert_content "local keys" "$repository/VSCodeInsider/keybindings.json"
	assert_content "local snippet" "$repository/VSCodeInsider/snippets/global-js.code-snippets"
	assert_content "local nvim" "$repository/vscode.lua"

	printf 'changed settings' >"$editor_directory/settings.json"
	VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$nvim_file" \
		bash "$repository/generate.sh" --dry-run VSCodeInsider >/dev/null
	assert_content "local settings" "$repository/VSCodeInsider/settings.json"
}

test_bootstrap_install() {
	local downloaded_directory="$TEST_DIRECTORY/downloaded"
	local fixture_repository="$TEST_DIRECTORY/bootstrap fixture"
	local fake_bin="$TEST_DIRECTORY/fake bin"
	local application_support="$TEST_DIRECTORY/bootstrap home/Library/Application Support"
	local editor_directory="$application_support/Cursor/User"

	copy_scripts "$fixture_repository"
	mkdir -p "$downloaded_directory" "$fake_bin" "$fixture_repository/Cursor" "$editor_directory"
	cp "$ROOT_DIRECTORY/install.sh" "$downloaded_directory/install.sh"
	printf 'bootstrap settings' >"$fixture_repository/Cursor/settings.json"
	printf 'bootstrap nvim' >"$fixture_repository/vscode.lua"
	cat >"$fake_bin/git" <<'EOF'
#!/usr/bin/env bash
destination="${@: -1}"
cp -R "$BOOTSTRAP_FIXTURE"/. "$destination/"
EOF
	chmod +x "$fake_bin/git"

	BOOTSTRAP_FIXTURE="$fixture_repository" \
		PATH="$fake_bin:$PATH" \
		VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$TEST_DIRECTORY/bootstrap nvim/vscode.lua" \
		bash "$downloaded_directory/install.sh" --skip-extensions Cursor >/dev/null

	assert_content "bootstrap settings" "$editor_directory/settings.json"
}

test_invalid_editor() {
	local repository="$TEST_DIRECTORY/invalid repository"

	copy_scripts "$repository"
	if VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$TEST_DIRECTORY/empty" \
		bash "$repository/generate.sh" Unsupported >/dev/null 2>&1; then
		fail "generate.sh accepted an unsupported editor"
	fi
}

test_vscode_settings_are_synced() {
	cmp -s "$ROOT_DIRECTORY/VSCode/settings.json" "$ROOT_DIRECTORY/VSCodeInsider/settings.json" ||
		fail "VSCode and VSCodeInsider settings.json files differ"
}

test_which_key_shortcuts() {
	local keybindings

	for keybindings in VSCode/keybindings.json VSCodeInsider/keybindings.json; do
		awk 'BEGIN { RS = "}" } /"key"[[:space:]]*:[[:space:]]*"shift\+space"/ && /"command"[[:space:]]*:[[:space:]]*"whichkey\.show"/ { found = 1 } END { exit !found }' \
			"$ROOT_DIRECTORY/$keybindings" || fail "$keybindings does not bind Shift+Space to whichkey.show"

		if awk 'BEGIN { RS = "}" } /"key"[[:space:]]*:[[:space:]]*"space"/ && /"command"[[:space:]]*:[[:space:]]*"whichkey\.show"/ { found = 1 } END { exit !found }' \
			"$ROOT_DIRECTORY/$keybindings"; then
			fail "$keybindings binds Space to whichkey.show"
		fi
	done
}

test_copy_failure() {
	local source="$TEST_DIRECTORY/copy source"
	local blocked_parent="$TEST_DIRECTORY/blocked parent"

	printf 'source' >"$source"
	printf 'not a directory' >"$blocked_parent"
	if (
		source "$ROOT_DIRECTORY/lib/editor-config.sh"
		DRY_RUN=false
		copy_managed_file "$source" "$blocked_parent/destination" >/dev/null 2>&1
	); then
		fail "copy_managed_file ignored a destination creation failure"
	fi
}

test_platform_paths() {
	(
		source "$ROOT_DIRECTORY/lib/editor-config.sh"
		unset VSCODE_LIKE_PRO_APP_SUPPORT_DIR
		SCRIPT_DIR="$ROOT_DIRECTORY"

		VSCODE_LIKE_PRO_PLATFORM=linux
		XDG_CONFIG_HOME="/tmp/linux config"
		[[ "$(editor_user_directory VSCode)" == "/tmp/linux config/Code/User" ]] ||
			fail "Linux editor path was incorrect"

		VSCODE_LIKE_PRO_PLATFORM=macos
		HOME="/tmp/mac home"
		[[ "$(editor_user_directory Cursor)" == "/tmp/mac home/Library/Application Support/Cursor/User" ]] ||
			fail "macOS editor path was incorrect"

		VSCODE_LIKE_PRO_PLATFORM=windows
		APPDATA="/tmp/windows home/AppData/Roaming"
		LOCALAPPDATA="/tmp/windows home/AppData/Local"
		[[ "$(editor_user_directory VSCodeInsider)" == "/tmp/windows home/AppData/Roaming/Code - Insiders/User" ]] ||
			fail "Windows editor path was incorrect"
		[[ "$(neovim_config_file)" == "/tmp/windows home/AppData/Local/nvim/lua/plugins/vscode.lua" ]] ||
			fail "Windows Neovim path was incorrect"
		[[ "$(editor_extension_files VSCodium)" == "$ROOT_DIRECTORY/extensions.txt" ]] ||
			fail "VSCodium included VS Code Marketplace-only extensions"
		[[ "$(editor_extension_files Cursor)" == "$ROOT_DIRECTORY/extensions.txt" ]] ||
			fail "Cursor included VS Code Marketplace-only extensions"
		[[ "$(editor_extension_files VSCode)" == "$ROOT_DIRECTORY/extensions.txt"$'\n'"$ROOT_DIRECTORY/extensions-vscode-marketplace.txt" ]] ||
			fail "VS Code extension manifests were incorrect"

		if command -v cygpath >/dev/null 2>&1; then
			APPDATA='C:\Users\Test\AppData\Roaming'
			LOCALAPPDATA='C:\Users\Test\AppData\Local'
			[[ "$(editor_user_directory VSCode)" == "$(cygpath -u "$APPDATA")/Code/User" ]] ||
				fail "Git Bash did not convert the Windows APPDATA path"
			[[ "$(neovim_config_file)" == "$(cygpath -u "$LOCALAPPDATA")/nvim/lua/plugins/vscode.lua" ]] ||
				fail "Git Bash did not convert the Windows LOCALAPPDATA path"
		fi
	)
}

test_extension_install() {
	local repository="$TEST_DIRECTORY/extensions repository"
	local application_support="$TEST_DIRECTORY/extensions home/.config"
	local editor_directory="$application_support/Code/User"
	local fake_bin="$TEST_DIRECTORY/extensions fake bin"
	local extension_log="$TEST_DIRECTORY/extensions.log"

	copy_scripts "$repository"
	mkdir -p "$repository/VSCode" "$editor_directory" "$fake_bin"
	printf 'repository settings' >"$repository/VSCode/settings.json"
	printf 'repository nvim' >"$repository/vscode.lua"
	printf '%s\r\n' 'publisher.first' 'publisher.second' >"$repository/extensions.txt"
	printf '%s\n' 'publisher.marketplace' >"$repository/extensions-vscode-marketplace.txt"
	cat >"$fake_bin/code" <<'EOF'
#!/usr/bin/env bash
printf '%s\n' "$*" >>"$EXTENSION_LOG"
EOF
	chmod +x "$fake_bin/code"

	PATH="$fake_bin:$PATH" \
		EXTENSION_LOG="$extension_log" \
		VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$TEST_DIRECTORY/extensions nvim/vscode.lua" \
		bash "$repository/install.sh" VSCode >/dev/null

	assert_content $'--install-extension publisher.first --force\n--install-extension publisher.second --force\n--install-extension publisher.marketplace --force' "$extension_log"

	PATH="$fake_bin:$PATH" \
		EXTENSION_LOG="$extension_log" \
		VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$TEST_DIRECTORY/extensions nvim/vscode.lua" \
		bash "$repository/install.sh" --dry-run VSCode >/dev/null
	assert_content $'--install-extension publisher.first --force\n--install-extension publisher.second --force\n--install-extension publisher.marketplace --force' "$extension_log"
}

test_extension_failure() {
	local repository="$TEST_DIRECTORY/failing extensions repository"
	local application_support="$TEST_DIRECTORY/failing extensions home/.config"
	local editor_directory="$application_support/Cursor/User"
	local fake_bin="$TEST_DIRECTORY/failing extensions fake bin"
	local extension_log="$TEST_DIRECTORY/failing extensions.log"

	copy_scripts "$repository"
	mkdir -p "$repository/Cursor" "$editor_directory" "$fake_bin"
	printf 'repository settings' >"$repository/Cursor/settings.json"
	printf 'repository nvim' >"$repository/vscode.lua"
	printf '%s\n' 'publisher.first' 'publisher.second' >"$repository/extensions.txt"
	cat >"$fake_bin/cursor" <<'EOF'
#!/usr/bin/env bash
printf '%s\n' "$*" >>"$EXTENSION_LOG"
[[ "$*" != *publisher.first* ]]
EOF
	chmod +x "$fake_bin/cursor"
	for command in codium codium-insiders code code-insiders windsurf trae; do
		cat >"$fake_bin/$command" <<'EOF'
#!/usr/bin/env bash
exit 0
EOF
		chmod +x "$fake_bin/$command"
	done

	if PATH="$fake_bin:$PATH" \
		EXTENSION_LOG="$extension_log" \
		VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$TEST_DIRECTORY/failing extensions nvim/vscode.lua" \
		bash "$repository/install.sh" Cursor >/dev/null 2>&1; then
		fail "install.sh ignored an extension installation failure"
	fi
	assert_content '--install-extension publisher.first --force' "$extension_log"

	: >"$extension_log"
	if PATH="$fake_bin:$PATH" \
		EXTENSION_LOG="$extension_log" \
		VSCODE_LIKE_PRO_APP_SUPPORT_DIR="$application_support" \
		VSCODE_LIKE_PRO_NVIM_CONFIG="$TEST_DIRECTORY/failing extensions nvim/vscode.lua" \
		bash "$repository/install.sh" >/dev/null 2>&1; then
		fail "all-editor install ignored an extension installation failure"
	fi
	assert_content '--install-extension publisher.first --force' "$extension_log"
}

bash -n "$ROOT_DIRECTORY/install.sh" "$ROOT_DIRECTORY/generate.sh" "$ROOT_DIRECTORY/lib/editor-config.sh"
test_install
test_generate
test_bootstrap_install
test_invalid_editor
test_vscode_settings_are_synced
test_which_key_shortcuts
test_copy_failure
test_platform_paths
test_extension_install
test_extension_failure

echo "Script tests passed."
