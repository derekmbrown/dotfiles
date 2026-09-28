#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"

source "$DOTFILES_DIR/../zsh/functions.zsh"

echo "Installing agent skills..."
link "$DOTFILES_DIR/skills" "$HOME/.agents/skills"
echo "Agent skills installed."
