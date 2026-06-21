#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$BIN_DIR"

install -m 0755 "$ROOT/bin/wb-ai-text" "$BIN_DIR/wb-ai-text"
install -m 0755 "$ROOT/bin/wb-ai-notify" "$BIN_DIR/wb-ai-notify"
install -m 0755 "$ROOT/bin/wb-ai-action" "$BIN_DIR/wb-ai-action"

echo "Installed scripts to $BIN_DIR"

# Prevent waybar-ai-usage from auto-opening login pages via xdg-open.
patched=0
for f in "$HOME"/.local/share/uv/tools/waybar-ai-usage/lib*/python*/site-packages/common.py; do
  [ -f "$f" ] || continue
  cp -n "$f" "$f.bak-disable-auto-login-open" || true
  sed -i 's/\["xdg-open", url\]/["true"]/g' "$f"
  patched=1
  echo "Patched auto-login opener in $f"
done

if [ "$patched" -eq 0 ]; then
  echo "Note: waybar-ai-usage common.py not found. Install waybar-ai-usage if you want Claude/Codex monitoring."
fi

mkdir -p "$HOME/.config/waybar-ai-usage"

if [ ! -f "$HOME/.config/waybar-ai-usage/zai.conf" ]; then
  cp "$ROOT/examples/zai.conf.example" "$HOME/.config/waybar-ai-usage/zai.conf"
  echo "Created example z.ai config at ~/.config/waybar-ai-usage/zai.conf"
  echo "Edit it and add your real ZAI_TOKEN."
fi

echo
echo "Done."
echo
echo "Next:"
echo "  1. Ensure jq, curl, notify-send, and waybar-ai-usage are installed."
echo "  2. Configure your CustomButton widgets using examples/noctalia-custombutton.md."
echo "  3. Keep middle click empty if you want it to open widget settings."
