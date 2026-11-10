#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"

if ! command -v tmux >/dev/null 2>&1; then
  echo "  tmux not found. Install it with: brew install tmux"
  exit 1
fi

echo "  Linking tmux config..."
rm -f "$HOME/.tmux.conf"
ln -s "$DOTFILES_DIR/tmux.config" "$HOME/.tmux.conf"
echo "    linked ~/.tmux.conf -> $DOTFILES_DIR/tmux.config"

if tmux info >/dev/null 2>&1; then
  tmux source-file "$HOME/.tmux.conf"
  echo "  Reloaded running tmux server."
else
  echo "  No tmux server running; config applies on next start."
fi
