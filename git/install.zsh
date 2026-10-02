#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"

source "$DOTFILES_DIR/../zsh/functions.zsh"

echo "Installing git configuration..."

link "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

if [[ ! -f "$HOME/.gitconfig.local" ]]; then
  touch "$HOME/.gitconfig.local"
fi

echo "To set your local Git email, run:"
echo "  git config --file ~/.gitconfig.local user.email \"you@example.com\""
echo "Git configuration installed."
