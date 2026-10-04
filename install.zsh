#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"

installers=(
  "$DOTFILES_DIR/brew/install.zsh"
  "$DOTFILES_DIR/git/install.zsh"
  "$DOTFILES_DIR/pi/install.zsh"
  "$DOTFILES_DIR/vscode/install.zsh"
  "$DOTFILES_DIR/zsh/install.zsh"
)

for installer in "${installers[@]}"; do
  echo "Running ${installer#$DOTFILES_DIR/}..."
  "$installer"
done

echo "Dotfiles installation complete."
