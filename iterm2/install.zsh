#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"
DYNAMIC_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

echo "  Installing iTerm2 dynamic profiles..."
mkdir -p "$DYNAMIC_DIR"
for profile in "$DOTFILES_DIR"/DynamicProfiles/*.json(N); do
  dest="$DYNAMIC_DIR/${profile:t}"
  rm -f "$dest"
  ln -s "$profile" "$dest"
  echo "    linked ${profile:t}"
done

echo "  Done. Restart iTerm2 and pick the profile in Settings > Profiles."
