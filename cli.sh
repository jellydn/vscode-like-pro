# Usage: sh cli.sh <environment>
# This script copies the settings, keybindings, snippets, and vscode.lua files from the specified environment to the current directory.
# Valid environment names are: VSCodium, VSCodiumInsider, VSCode, VSCodeInsider, Cursor

# Define the base path
basePath="$HOME/Library/Application Support"

# Define the paths for the different environments
VSCodium="$basePath/VSCodium/User"
VSCodiumInsider="$basePath/VSCodium - Insiders/User"
VSCode="$basePath/Code/User"
VSCodeInsider="$basePath/Code - Insiders/User"
Cursor="$basePath/Cursor/User"

# Check the input parameter
case $1 in
"VSCodium") envPath=$VSCodium ;;
"VSCodiumInsider") envPath=$VSCodiumInsider ;;
"VSCode") envPath=$VSCode ;;
"VSCodeInsider") envPath=$VSCodeInsider ;;
"Cursor") envPath=$Cursor ;;
*)
  echo "Invalid environment name. Please use one of the following: VSCodium, VSCodiumInsider, VSCode, VSCodeInsider, Cursor"
  exit 1
  ;;
esac

# Check if the chosen environment is installed
echo "Checking $envPath folder..."
if [ ! -d "$envPath" ]; then
  echo "$1 not found. Please install it or choose a different environment."
  exit 1
fi

# Define the files to copy
files=("settings.json" "keybindings.json" "snippets/global-js.code-snippets")

# Copy the files
for file in "${files[@]}"; do
  if [ -f "$envPath/$file" ]; then
    echo "Copying $file..."
    cp "$envPath/$file" .
  else
    echo "$file not found in $envPath. Skipping..."
  fi
done

# Copy vscode.lua
vscodeLuaPath="$HOME/.config/nvim/lua/plugins/vscode.lua"
if [ -f "$vscodeLuaPath" ]; then
  echo "Copying vscode.lua..."
  cp "$vscodeLuaPath" .
else
  echo "vscode.lua not found. Skipping..."
fi

# Check if bun is installed and cli.ts exists before running it
if command -v bun >/dev/null 2>&1 && [ -f "cli.ts" ]; then
  echo "Running cli.ts..."
  bun run cli.ts
else
  echo "bun command not found or cli.ts does not exist. Skipping..."
fi
