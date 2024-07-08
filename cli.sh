#!/bin/bash

# Copy settings.json
echo "Copying settings.json..."
cp ~/Library/Application\ Support/VSCodium/User/settings.json settings.json

# Copy keymap.json
echo "Copying keybindings.json..."
cp ~/Library/Application\ Support/VSCodium/User/keybindings.json keybindings.json

# Copy global-js.code-snippets
echo "Copying global-js.code-snippets ..."
cp ~/Library/Application\ Support/VSCodium/User/snippets/global-js.code-snippets global-js.code-snippets

# Copy ~/.config/nvim/lua/plugins/vscode.lua
echo "Copying vscode.lua..."
cp ~/.config/nvim/lua/plugins/vscode.lua vscode.lua

# Run cli.ts
echo "Running cli.ts..."
bun run cli.ts
