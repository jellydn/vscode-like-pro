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
		bash "$repository/install.sh" Cursor >/dev/null

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
		bash "$downloaded_directory/install.sh" Cursor >/dev/null

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

bash -n "$ROOT_DIRECTORY/install.sh" "$ROOT_DIRECTORY/generate.sh" "$ROOT_DIRECTORY/lib/editor-config.sh"
test_install
test_generate
test_bootstrap_install
test_invalid_editor

echo "Script tests passed."
