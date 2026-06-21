# .agents/ — optional, passive project notes (NOT essential infrastructure)

**This folder is safe to ignore or delete.** It is not part of any build, and
nothing reads it automatically.

## What this is

A place for optional, human-and-agent-readable project notes. Lab creates it once
per repo as empty templates. That's all it does.

## What this is NOT

- **NOT auto-loaded into agent context.** The old launch preamble that force-read
  these files was removed. An agent (glm/cdx/clc) only sees a file here if you
  explicitly tell it to ("read .agents/AGENTS.md first"). On its own it reads
  nothing here.
- **NOT a build/config dependency.** No lab command depends on these files'
  contents. Deleting the folder breaks nothing.
- **NOT how Pi or Claude Code do native memory.** Claude Code reads `CLAUDE.md`/
  `AGENTS.md` at the *repo root*, not here. These files don't collide with or
  override any native behavior.

## So why does it exist?

As a *dormant context booster*: if you ever want to hand an agent durable project
context, fill in `AGENTS.md` and point the agent at it. Until then it sits inert.

## Files

| file | purpose | git |
|------|---------|-----|
| `AGENTS.md` | durable project conventions (fill in if useful) | tracked |
| `HANDOFF.md` | scratch "current state" note | ignored |
| `log/HISTORY.md` | append-only one-line trail | ignored |

Note: HANDOFF.md and HISTORY.md are git-ignored, so they do **not** survive
`git push`/`pull` to other clones — they're local scratch only. Don't rely on them
for cross-machine continuity (use the agents' native `--resume`/`--continue` for
that).
