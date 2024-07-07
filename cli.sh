#!/bin/bash

# Copy settings.json
echo "Copying settings.json..."
cp ~/Library/Application\ Support/VSCodium/User/settings.json settings.json

# Copy keymap.json
echo "Copying keybindings.json..."
cp ~/Library/Application\ Support/VSCodium/User/keybindings.json keybindings.json

# Run cli.ts
echo "Running cli.ts..."
bun run cli.ts
