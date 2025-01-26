# Usage: sh cli.sh [environment]
# This script copies the settings, keybindings, snippets, and vscode.lua files from the specified environment (or all environments if none specified) to the current directory.
# Valid environment names are: VSCodium, VSCodiumInsider, VSCode, VSCodeInsider, Cursor, Windsurf

# Define the base path
basePath="$HOME/Library/Application Support"

# Define the paths for the different environments
VSCodium="$basePath/VSCodium/User"
VSCodiumInsider="$basePath/VSCodium - Insiders/User"
VSCode="$basePath/Code/User"
VSCodeInsider="$basePath/Code - Insiders/User"
Cursor="$basePath/Cursor/User"
Windsurf="$basePath/Windsurf/User"
Trae="$basePath/Trae/User"

# Define the files to copy
files=("settings.json" "keybindings.json" "snippets/global-js.code-snippets")

# Check if an environment was specified
if [ -z "$1" ]; then
  echo "No specific editor provided. Copying configurations from all supported editors..."
  editors=("VSCodium" "VSCodiumInsider" "VSCode" "VSCodeInsider" "Cursor" "Windsurf" "Trae")

  # Process each editor
  for editor in "${editors[@]}"; do
    case $editor in
    "VSCodium") envPath=$VSCodium ;;
    "VSCodiumInsider") envPath=$VSCodiumInsider ;;
    "VSCode") envPath=$VSCode ;;
    "VSCodeInsider") envPath=$VSCodeInsider ;;
    "Cursor") envPath=$Cursor ;;
    "Windsurf") envPath=$Windsurf ;;
    "Trae") envPath=$Trae ;;
    esac

    if [ -d "$envPath" ]; then
      echo "Processing $editor configurations..."
      # Create editor-specific directory
      editorDir="$editor"
      mkdir -p "$editorDir"

      # Copy the files
      for file in "${files[@]}"; do
        if [ -f "$envPath/$file" ]; then
          echo "Copying $file from $editor..."
          mkdir -p "$(dirname "$editorDir/$file")"
          cp "$envPath/$file" "$editorDir/$file"
        fi
      done
    else
      echo "$editor not installed, skipping..."
    fi
  done

  # Copy vscode.lua
  vscodeLuaPath="$HOME/.config/nvim/lua/plugins/vscode.lua"
  if [ -f "$vscodeLuaPath" ]; then
    echo "Copying vscode.lua..."
    cp "$vscodeLuaPath" "vscode.lua"
  else
    echo "vscode.lua not found. Skipping..."
  fi

  echo "All configurations have been copied to the current directory"
  exit 0
fi

# If a specific editor was provided, continue with original logic
case $1 in
"VSCodium") envPath=$VSCodium ;;
"VSCodiumInsider") envPath=$VSCodiumInsider ;;
"VSCode") envPath=$VSCode ;;
"VSCodeInsider") envPath=$VSCodeInsider ;;
"Cursor") envPath=$Cursor ;;
"Windsurf") envPath=$Windsurf ;;
    "Trae") envPath=$Trae ;;
*)
  echo "Invalid environment name. Please use one of the following: VSCodium, VSCodiumInsider, VSCode, VSCodeInsider, Cursor, Windsurf"
  exit 1
  ;;
esac

# Check if the chosen environment is installed
echo "Checking $envPath folder..."
if [ ! -d "$envPath" ]; then
  echo "$1 not found. Please install it or choose a different environment."
  exit 1
fi

# Create editor-specific directory
editorDir="$1"
mkdir -p "$editorDir"

# Copy the files
for file in "${files[@]}"; do
  if [ -f "$envPath/$file" ]; then
    echo "Copying $file..."
    mkdir -p "$(dirname "$editorDir/$file")"
    cp "$envPath/$file" "$editorDir/$file"
  else
    echo "$file not found in $envPath. Skipping..."
  fi
done

# Copy vscode.lua
vscodeLuaPath="$HOME/.config/nvim/lua/plugins/vscode.lua"
if [ -f "$vscodeLuaPath" ]; then
  echo "Copying vscode.lua..."
  cp "$vscodeLuaPath" "vscode.lua"
else
  echo "vscode.lua not found. Skipping..."
fi

# Check if bun is installed and cli.ts exists before running it
if command -v bun >/dev/null 2>&1 && [ -f "cli.ts" ]; then
  echo "Running cli.ts..."
  bun run cli.ts "$1"
else
  echo "bun command not found or cli.ts does not exist. Skipping..."
fi
