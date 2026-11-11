#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"
DEST="$HOME/.config/workmux/config.yaml"

if ! command -v workmux >/dev/null 2>&1; then
  echo "  workmux not found. Install it with: brew install workmux"
  exit 1
fi

echo "  Linking workmux config..."
mkdir -p "${DEST:h}"
rm -f "$DEST"
ln -s "$DOTFILES_DIR/config.yaml" "$DEST"
echo "    linked $DEST -> $DOTFILES_DIR/config.yaml"
