#!/usr/bin/env bash

if [ -z "${BASH_VERSION:-}" ]; then
	exec bash "$0" "$@"
fi

set -euo pipefail

SCRIPT_PATH="${BASH_SOURCE[0]:-}"
SCRIPT_DIR="$(cd "$(dirname "${SCRIPT_PATH:-.}")" && pwd)"

bootstrap_repository() {
	command -v git >/dev/null 2>&1 || {
		echo "git is required to download vscode-like-pro." >&2
		exit 1
	}

	TEMPORARY_DIRECTORY="$(mktemp -d)"
	trap 'rm -rf "$TEMPORARY_DIRECTORY"' EXIT INT TERM

	echo "Downloading vscode-like-pro..."
	git clone --depth 1 https://github.com/jellydn/vscode-like-pro.git "$TEMPORARY_DIRECTORY"
	bash "$TEMPORARY_DIRECTORY/install.sh" "$@"
}

# A downloaded installer has no repository files, so it first creates the same
# local execution context as a manual clone.
if [[ -z "$SCRIPT_PATH" || ! -f "$SCRIPT_DIR/lib/editor-config.sh" ]]; then
	bootstrap_repository "$@"
	exit 0
fi

source "$SCRIPT_DIR/lib/editor-config.sh"

usage() {
	cat <<EOF
Usage: ./install.sh [--dry-run] [editor]

Install repository configurations into one editor. Without an editor, install
into every detected editor.

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

install_editor() {
	local editor="$1"
	local destination_directory
	local relative_path

	if ! destination_directory="$(editor_user_directory "$editor")"; then
		echo "Unknown editor: $editor" >&2
		return 2
	fi

	if [[ ! -d "$destination_directory" ]]; then
		printf 'Skipped (not installed): %s\n' "$editor"
		return 1
	fi

	printf 'Installing %s configuration...\n' "$editor"
	for relative_path in "${MANAGED_FILES[@]}"; do
		copy_managed_file \
			"$SCRIPT_DIR/$editor/$relative_path" \
			"$destination_directory/$relative_path"
	done
}

install_neovim_configuration() {
	copy_managed_file \
		"$SCRIPT_DIR/vscode.lua" \
		"${VSCODE_LIKE_PRO_NVIM_CONFIG:-$HOME/.config/nvim/lua/plugins/vscode.lua}"
}

if [[ -n "$EDITOR" ]]; then
	install_editor "$EDITOR" || {
		status=$?
		if [[ $status -eq 2 ]]; then
			printf 'Valid editors: '
			print_editor_names
		fi
		exit "$status"
	}
else
	detected_editors=0
	for editor in "${EDITOR_NAMES[@]}"; do
		if install_editor "$editor"; then
			detected_editors=$((detected_editors + 1))
		fi
	done

	if [[ $detected_editors -eq 0 ]]; then
		echo "No supported editors were detected." >&2
		exit 1
	fi
fi

install_neovim_configuration
echo "Installation complete."
