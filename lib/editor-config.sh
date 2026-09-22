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

editor_user_directory() {
	local editor="$1"
	local application_support="${VSCODE_LIKE_PRO_APP_SUPPORT_DIR:-$HOME/Library/Application Support}"

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

	mkdir -p "$(dirname "$destination")"
	cp "$source" "$destination"
	printf 'Copied: %s -> %s\n' "$source" "$destination"
}
