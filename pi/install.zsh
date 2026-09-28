#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"
PI_AGENT_DIR="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"

source "$DOTFILES_DIR/../zsh/functions.zsh"

echo "Installing Pi configuration..."
link "$DOTFILES_DIR/settings.json" "$PI_AGENT_DIR/settings.json"
echo "Pi configuration installed."
