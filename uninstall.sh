#!/usr/bin/env bash
set -euo pipefail

rm -f "$HOME/.local/bin/wb-ai-text"
rm -f "$HOME/.local/bin/wb-ai-notify"
rm -f "$HOME/.local/bin/wb-ai-action"

echo "Removed wb-ai scripts from ~/.local/bin"
echo "Did not remove ~/.config/waybar-ai-usage or cache/state files."
