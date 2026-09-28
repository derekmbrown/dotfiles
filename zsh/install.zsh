#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"
OH_MY_ZSH_DIR="${ZSH:-$HOME/.oh-my-zsh}"

echo "Checking for oh-my-zsh..."
if [[ ! -f "$OH_MY_ZSH_DIR/oh-my-zsh.sh" ]]; then
  echo "Installing oh-my-zsh to $OH_MY_ZSH_DIR..."
  yes Y | ZSH="$OH_MY_ZSH_DIR" \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh already installed."
fi

link() {
  local src="$1"
  local dest="$2"

  mkdir -p "${dest:h}"
  rm -rf "$dest"
  ln -s "$src" "$dest"
}

link "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/aliases.zsh" "$HOME/.zsh/aliases.zsh"
link "$DOTFILES_DIR/export.zsh" "$HOME/.zsh/export.zsh"
link "$DOTFILES_DIR/functions.zsh" "$HOME/.zsh/functions.zsh"
link "$DOTFILES_DIR/misc.zsh" "$HOME/.zsh/misc.zsh"