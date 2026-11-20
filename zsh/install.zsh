#!/usr/bin/env zsh

REPO_DIR="${0:A:h:h}"

source "$REPO_DIR/zsh/functions.zsh"

#zsh config
link "$REPO_DIR/zsh/zshrc" "$HOME/.zshrc"
link "$REPO_DIR/zsh/aliases.zsh" "$HOME/.zsh/aliases.zsh"
link "$REPO_DIR/zsh/export.zsh" "$HOME/.zsh/export.zsh"
link "$REPO_DIR/zsh/functions.zsh" "$HOME/.zsh/functions.zsh"
link "$REPO_DIR/zsh/misc.zsh" "$HOME/.zsh/misc.zsh"

#tmux config
link "$REPO_DIR/tmux/tmux.config" "$HOME/.tmux.conf"

#workmux config
link "$REPO_DIR/workmux/config.yaml" "$HOME/.config/workmux/config.yaml"

#iterm2 config
link "$REPO_DIR/iterm2/profile.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/profile.json"

#pi config
link "$REPO_DIR/pi/skills" "$HOME/.pi/agent/skills"
link "$REPO_DIR/pi/extensions" "$HOME/.pi/agent/extensions"
link "$REPO_DIR/pi/settings.json" "$HOME/.pi/agent/settings.json"

echo "Configs linked."