#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"
VSCODE_USER_DIR="${HOME}/Library/Application Support/Code/User"

source "$DOTFILES_DIR/../zsh/functions.zsh"

echo "Installing VS Code configuration..."

link "$DOTFILES_DIR/settings.json" "$VSCODE_USER_DIR/settings.json"
link "$DOTFILES_DIR/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"

echo "VS Code configuration installed."
