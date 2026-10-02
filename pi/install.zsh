#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"
PI_AGENT_DIR="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"

source "$DOTFILES_DIR/../zsh/functions.zsh"

echo "Installing Pi configuration..."

mcp_files=("$DOTFILES_DIR/mcp"/*.json(N))
if (( ${#mcp_files} > 0 )); then
  jq -s '{ mcpServers: (map(.mcpServers // {}) | add) }' \
    "${mcp_files[@]}" > "$DOTFILES_DIR/mcp.json"
fi

link "$DOTFILES_DIR/settings.json" "$PI_AGENT_DIR/settings.json"
link "$DOTFILES_DIR/extensions" "$PI_AGENT_DIR/extensions"
link "$DOTFILES_DIR/skills" "$PI_AGENT_DIR/skills"
link "$DOTFILES_DIR/prompts" "$PI_AGENT_DIR/prompts"
link "$DOTFILES_DIR/mcp.json" "$PI_AGENT_DIR/mcp.json"

skill_files=("$DOTFILES_DIR"/skills/*/SKILL.md(N))
prompt_files=("$DOTFILES_DIR"/prompts/*.md(N))
extension_files=("$DOTFILES_DIR"/extensions/*.ts(N))

echo "  Built mcp.json from ${#mcp_files} file(s)."
echo "  Added skills/ with ${#skill_files} skill(s)."
echo "  Added prompts/ with ${#prompt_files} prompt(s)."
echo "  Added extensions/ with ${#extension_files} extension(s)."

echo "Pi configuration installed."
