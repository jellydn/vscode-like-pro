#!/usr/bin/env bash

if [ -z "${BASH_VERSION:-}" ]; then
	exec bash "$0" "$@"
fi

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/editor-config.sh"

usage() {
	cat <<EOF
Usage: ./generate.sh [--dry-run] [editor]

Export configurations from one editor into this repository. Without an editor,
export from every detected editor. Selecting one editor also updates README.md.

Editors: $(print_editor_names)
EOF
}

DRY_RUN=false
EDITOR=""

for argument in "$@"; do
	case "$argument" in
	--dry-run) DRY_RUN=true ;;
	-h | --help)
		usage
		exit 0
		;;
	-*)
		echo "Unknown option: $argument" >&2
		usage >&2
		exit 1
		;;
	*)
		if [[ -n "$EDITOR" ]]; then
			echo "Only one editor can be selected." >&2
			exit 1
		fi
		EDITOR="$argument"
		;;
	esac
done

generate_editor() {
	local editor="$1"
	local source_directory
	local relative_path

	if ! source_directory="$(editor_user_directory "$editor")"; then
		echo "Unknown editor: $editor" >&2
		return 2
	fi

	if [[ ! -d "$source_directory" ]]; then
		printf 'Skipped (not installed): %s\n' "$editor"
		return 1
	fi

	printf 'Exporting %s configuration...\n' "$editor"
	for relative_path in "${MANAGED_FILES[@]}"; do
		copy_managed_file \
			"$source_directory/$relative_path" \
			"$SCRIPT_DIR/$editor/$relative_path"
	done
}

generate_neovim_configuration() {
	copy_managed_file \
		"${VSCODE_LIKE_PRO_NVIM_CONFIG:-$HOME/.config/nvim/lua/plugins/vscode.lua}" \
		"$SCRIPT_DIR/vscode.lua"
}

update_readme() {
	local editor="$1"

	if [[ "$DRY_RUN" == "true" ]]; then
		printf 'Would update README.md with %s configuration.\n' "$editor"
	elif command -v bun >/dev/null 2>&1 && [[ -f "$SCRIPT_DIR/cli.ts" ]]; then
		bun run "$SCRIPT_DIR/cli.ts" "$editor"
	else
		echo "Skipped README.md update because Bun or cli.ts is not available."
	fi
}

if [[ -n "$EDITOR" ]]; then
	generate_editor "$EDITOR" || {
		status=$?
		if [[ $status -eq 2 ]]; then
			printf 'Valid editors: '
			print_editor_names
		fi
		exit "$status"
	}
	generate_neovim_configuration
	update_readme "$EDITOR"
else
	detected_editors=0
	for editor in "${EDITOR_NAMES[@]}"; do
		if generate_editor "$editor"; then
			detected_editors=$((detected_editors + 1))
		fi
	done

	if [[ $detected_editors -eq 0 ]]; then
		echo "No supported editors were detected." >&2
		exit 1
	fi
	generate_neovim_configuration
fi

echo "Generation complete. Review changes with: git diff"
