#!/usr/bin/env zsh

DOTFILES_DIR="${0:A:h}"
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"

source "$DOTFILES_DIR/functions.zsh"

echo "  Checking for oh-my-zsh..."
if [[ ! -f "$OH_MY_ZSH_DIR/oh-my-zsh.sh" ]]; then
  echo "  Installing oh-my-zsh to $OH_MY_ZSH_DIR..."
  yes Y | ZSH="$OH_MY_ZSH_DIR" \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "  oh-my-zsh already installed."
fi

SHIFT_SELECT_DIR="$OH_MY_ZSH_DIR/custom/plugins/zsh-shift-select"
if [[ ! -d "$SHIFT_SELECT_DIR" ]]; then
  echo "  Installing zsh-shift-select..."
  git clone --depth 1 https://github.com/jirutka/zsh-shift-select "$SHIFT_SELECT_DIR"
else
  echo "  zsh-shift-select already installed."
fi

echo "  Installing zsh configuration..."

link "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/aliases.zsh" "$HOME/.zsh/aliases.zsh"
link "$DOTFILES_DIR/export.zsh" "$HOME/.zsh/export.zsh"
link "$DOTFILES_DIR/functions.zsh" "$HOME/.zsh/functions.zsh"
link "$DOTFILES_DIR/misc.zsh" "$HOME/.zsh/misc.zsh"

echo "  Zsh configuration installed."