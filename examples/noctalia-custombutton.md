# Noctalia / CustomButton setup

These widgets are designed for any panel or button system that can:

1. run a command for text output
2. parse JSON output
3. run commands for mouse actions
4. show dynamic text tooltips

## Required toggles

For each button:

```text
Parse output as JSON: ON
Show dynamic text tooltips: ON
Show command tooltips: OFF
Refresh interval: 3000
```

The scripts cache network calls, so a 3000 ms UI refresh is safe.

## Claude button

Display command:

```text
~/.local/bin/wb-ai-text claude
```

Left click:

```text
~/.local/bin/wb-ai-action claude notify
```

Right click:

```text
~/.local/bin/wb-ai-action claude cycle-mode
```

Middle click:

```text
Leave empty to preserve Widget settings
```

Scroll wheel:

```text
~/.local/bin/wb-ai-action claude scroll "$delta"
```

## Codex button

Display command:

```text
~/.local/bin/wb-ai-text codex
```

Left click:

```text
~/.local/bin/wb-ai-action codex notify
```

Right click:

```text
~/.local/bin/wb-ai-action codex cycle-mode
```

Middle click:

```text
Leave empty to preserve Widget settings
```

Scroll wheel:

```text
~/.local/bin/wb-ai-action codex scroll "$delta"
```

## z.ai button

Display command:

```text
~/.local/bin/wb-ai-text zai
```

Left click:

```text
~/.local/bin/wb-ai-action zai notify
```

Right click:

```text
~/.local/bin/wb-ai-action zai cycle-mode
```

Middle click:

```text
Leave empty to preserve Widget settings
```

Scroll wheel:

```text
~/.local/bin/wb-ai-action zai scroll "$delta"
```

## Modes

Right click or scroll cycles through:

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
