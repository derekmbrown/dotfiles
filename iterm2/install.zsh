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

echo "  Setting Dotfiles as the default profile..."
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "6B1E2C7A-3D4F-4E8B-9A1C-0D5F7E2B9C41"

echo "  Done. Restart iTerm2 to load the profile."
