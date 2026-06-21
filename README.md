# AI Usage Panel

Stateful desktop panel widgets for monitoring AI coding assistant quota usage.

Built for a Linux desktop command-widget workflow such as Noctalia CustomButton, and usable with any panel that can run commands, parse JSON, and bind mouse actions.

## What it monitors

- Claude usage
- OpenAI Codex usage
- z.ai quota usage

## Features

- Compact panel text
- Rich hover tooltip with quota bars
- Left-click detailed notifications
- Right-click display mode cycling
- Scroll-wheel mode cycling
- Middle-click can remain reserved for widget settings
- Persistent per-service display state
- Local cache for z.ai API calls
- Patches `waybar-ai-usage` to prevent automatic browser tab opening on auth errors

## Display modes

Each service cycles through:

```text
auto -> 5h -> 7d -> dual -> eta -> risk
```

Examples:

```text
45% 1/5
40% 2/7
45/40
1h
OK
```

## Requirements

Runtime tools:

```text
bash
jq
curl
notify-send
```

For Claude and Codex:

```text
waybar-ai-usage
```

The Claude and Codex widgets use your browser cookies through `waybar-ai-usage`. This setup defaults to Firefox because Flatpak browsers can be awkward for cookie extraction.

For z.ai:

```text
~/.config/waybar-ai-usage/zai.conf
```

with:

```text
ZAI_TOKEN=your_token_here
```

Do not commit your real token.

## Installation

Clone the repo:

```bash
git clone https://github.com/YOUR_USERNAME/ai-usage-panel.git
cd ai-usage-panel
./install.sh
```

The installer copies:

```text
bin/wb-ai-text    -> ~/.local/bin/wb-ai-text
bin/wb-ai-notify  -> ~/.local/bin/wb-ai-notify
bin/wb-ai-action  -> ~/.local/bin/wb-ai-action
```

It also patches the local `waybar-ai-usage` install so auth failures do not auto-open browser tabs.

## Noctalia / CustomButton setup

See:

```text
examples/noctalia-custombutton.md
```

Short version for each button:

```text
Display command: ~/.local/bin/wb-ai-text SERVICE
Left click:      ~/.local/bin/wb-ai-action SERVICE notify
Right click:     ~/.local/bin/wb-ai-action SERVICE cycle-mode
Middle click:    leave empty for widget settings
Scroll wheel:    ~/.local/bin/wb-ai-action SERVICE scroll "$delta"
```

Replace `SERVICE` with one of:

```text
claude
codex
zai
```

Recommended widget toggles:

```text
Parse output as JSON: ON
Show dynamic text tooltips: ON
Show command tooltips: OFF
Refresh interval: 3000
```

## Commands

Show current panel JSON:

```bash
wb-ai-text claude
wb-ai-text codex
wb-ai-text zai
```

Show detailed notification:

```bash
wb-ai-action claude notify
wb-ai-action codex notify
wb-ai-action zai notify
```

Cycle display mode:

```bash
wb-ai-action claude cycle-mode
```

Force refresh:

```bash
wb-ai-action claude refresh
```

Open service manually:

```bash
wb-ai-action claude open
wb-ai-action codex open
wb-ai-action zai open
```

## State

Display mode state is stored in:

```text
~/.cache/ai-usage-ui/state.json
```

z.ai raw API cache is stored in:

```text
~/.cache/ai-usage-ui/zai.raw.json
```

## Security notes

- Never commit `~/.config/waybar-ai-usage/zai.conf`.
- The installer creates only an example config.
- The scripts do not store Claude or OpenAI credentials.
- Claude and Codex rely on your browser cookies through `waybar-ai-usage`.
- Browser auto-open behavior is disabled locally by patching `waybar-ai-usage/common.py`.

## Uninstall

```bash
./uninstall.sh
```

This removes the installed scripts from `~/.local/bin`.

It does not remove your configs, state files, or tokens.

## License

MIT
