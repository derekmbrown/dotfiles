#!/usr/bin/env zsh

REPO_DIR="${0:A:h:h}"

source "$REPO_DIR/zsh/functions.zsh"

link "$REPO_DIR/zsh/zshrc" "$HOME/.zshrc"
link "$REPO_DIR/zsh/aliases.zsh" "$HOME/.zsh/aliases.zsh"
link "$REPO_DIR/zsh/export.zsh" "$HOME/.zsh/export.zsh"
link "$REPO_DIR/zsh/functions.zsh" "$HOME/.zsh/functions.zsh"
link "$REPO_DIR/zsh/misc.zsh" "$HOME/.zsh/misc.zsh"
link "$REPO_DIR/tmux/tmux.config" "$HOME/.tmux.conf"
link "$REPO_DIR/workmux/config.yaml" "$HOME/.config/workmux/config.yaml"
link "$REPO_DIR/iterm2/profile.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/profile.json"

echo "Configs linked."