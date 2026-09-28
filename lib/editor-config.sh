#!/usr/bin/env bash

EDITOR_NAMES=(
	"VSCodium"
	"VSCodiumInsider"
	"VSCode"
	"VSCodeInsider"
	"Cursor"
	"Windsurf"
	"Trae"
)

MANAGED_FILES=(
	"settings.json"
	"keybindings.json"
	"snippets/global-js.code-snippets"
)

editor_config_platform() {
	if [[ -n "${VSCODE_LIKE_PRO_PLATFORM:-}" ]]; then
		printf '%s\n' "$VSCODE_LIKE_PRO_PLATFORM"
		return
	fi

	case "$(uname -s)" in
	Darwin) printf 'macos\n' ;;
	Linux) printf 'linux\n' ;;
	MINGW* | MSYS* | CYGWIN*) printf 'windows\n' ;;
	*)
		echo "Unsupported operating system: $(uname -s)" >&2
		return 1
		;;
	esac
}

editor_config_root() {
	if [[ -n "${VSCODE_LIKE_PRO_APP_SUPPORT_DIR:-}" ]]; then
		printf '%s\n' "$VSCODE_LIKE_PRO_APP_SUPPORT_DIR"
		return
	fi

	case "$(editor_config_platform)" in
	macos) printf '%s\n' "$HOME/Library/Application Support" ;;
	linux) printf '%s\n' "${XDG_CONFIG_HOME:-$HOME/.config}" ;;
	windows)
		if [[ -z "${APPDATA:-}" ]]; then
			echo "APPDATA is required on Windows." >&2
			return 1
		fi
		if command -v cygpath >/dev/null 2>&1; then
			cygpath -u "$APPDATA"
		else
			printf '%s\n' "$APPDATA"
		fi
		;;
	esac
}

editor_user_directory() {
	local editor="$1"
	local application_support
	application_support="$(editor_config_root)" || return 1

	case "$editor" in
	VSCodium) printf '%s\n' "$application_support/VSCodium/User" ;;
	VSCodiumInsider) printf '%s\n' "$application_support/VSCodium - Insiders/User" ;;
	VSCode) printf '%s\n' "$application_support/Code/User" ;;
	VSCodeInsider) printf '%s\n' "$application_support/Code - Insiders/User" ;;
	Cursor) printf '%s\n' "$application_support/Cursor/User" ;;
	Windsurf) printf '%s\n' "$application_support/Windsurf/User" ;;
	Trae) printf '%s\n' "$application_support/Trae/User" ;;
	*) return 1 ;;
	esac
}

editor_cli() {
	case "$1" in
	VSCodium) printf 'codium\n' ;;
	VSCodiumInsider) printf 'codium-insiders\n' ;;
	VSCode) printf 'code\n' ;;
	VSCodeInsider) printf 'code-insiders\n' ;;
	Cursor) printf 'cursor\n' ;;
	Windsurf) printf 'windsurf\n' ;;
	Trae) printf 'trae\n' ;;
	*) return 1 ;;
	esac
}

editor_extension_files() {
	local editor="$1"

	printf '%s\n' "$SCRIPT_DIR/extensions.txt"
	case "$editor" in
	VSCode | VSCodeInsider) printf '%s\n' "$SCRIPT_DIR/extensions-vscode-marketplace.txt" ;;
	*) ;;
	esac
}

neovim_config_file() {
	if [[ -n "${VSCODE_LIKE_PRO_NVIM_CONFIG:-}" ]]; then
		printf '%s\n' "$VSCODE_LIKE_PRO_NVIM_CONFIG"
	elif [[ "$(editor_config_platform)" == "windows" ]]; then
		local local_app_data="${LOCALAPPDATA:-${APPDATA:-}}"
		if command -v cygpath >/dev/null 2>&1; then
			local_app_data="$(cygpath -u "$local_app_data")"
		fi
		printf '%s\n' "$local_app_data/nvim/lua/plugins/vscode.lua"
	else
		printf '%s\n' "$HOME/.config/nvim/lua/plugins/vscode.lua"
	fi
}

print_editor_names() {
	local separator=""
	local editor

	for editor in "${EDITOR_NAMES[@]}"; do
		printf '%s%s' "$separator" "$editor"
		separator=", "
	done
	printf '\n'
}

copy_managed_file() {
	local source="$1"
	local destination="$2"

	if [[ ! -f "$source" ]]; then
		printf 'Skipped (not found): %s\n' "$source"
		return 0
	fi

	if [[ "${DRY_RUN:-false}" == "true" ]]; then
		printf 'Would copy: %s -> %s\n' "$source" "$destination"
		return 0
	fi

	mkdir -p "$(dirname "$destination")" || return 1
	cp "$source" "$destination" || return 1
	printf 'Copied: %s -> %s\n' "$source" "$destination"
}
