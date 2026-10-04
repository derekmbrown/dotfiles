#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="${0:A:h}"
PI_AGENT_DIR="${HOME}/.pi/agent"

source "$DOTFILES_DIR/../zsh/functions.zsh"

echo "  Installing Pi configuration..."

mcp_files=("$DOTFILES_DIR/mcp"/*.json(N))
if (( ${#mcp_files} > 0 )); then
  jq -s '{ autoEnableCodemode: true, mcpServers: (map(.mcpServers // {}) | add) }' \
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
package_count=$(jq '(.packages // []) | length' "$DOTFILES_DIR/settings.json")

mcp_server_count=0
if [[ -f "$DOTFILES_DIR/mcp.json" ]]; then
  mcp_server_count=$(jq '.mcpServers | length' "$DOTFILES_DIR/mcp.json")
fi

echo "    Added ${#skill_files} skill(s)."
echo "    Added ${#prompt_files} prompt(s)."
echo "    Added $mcp_server_count mcp server(s)."
echo "    Added ${#extension_files} extension(s)."
echo "    Added $package_count package(s)."

echo "  Pi configuration installed."
