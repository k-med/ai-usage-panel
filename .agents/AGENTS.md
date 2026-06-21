# AGENTS.md — HOT memory (always read first, every session)

> Durable, slow-changing project rules. Keep this SMALL (<150 lines) — every agent
> loads it on every launch, and long context degrades focus ("lost in the middle").
> This is the place for conventions and constraints, NOT current task state (that
> lives in HANDOFF.md) and NOT history (that lives in log/).

## What this project is
<!-- One paragraph: what the repo does, its main components. -->

## Conventions (non-negotiable)
<!-- Languages/versions, style, how to run tests, how to build, branch model. -->
- Branch model: work on `main` unless told otherwise.
- COMMIT your work (git add -A && git commit) at natural pauses — commits are how
  state is preserved. But do NOT attempt `git push`: pushing is done from the lab
  control plane on the host (`lab <proj> <target> push`), which holds the scoped
  per-repo deploy keys. In-container push will fail by design — that's expected, not
  an error to fix. Just commit; the human pushes.

## Where things live (capabilities, not file paths — paths drift)
<!-- Describe by capability: "auth logic", "the dashboard", etc. Avoid exact paths. -->

## Commands
<!-- The handful of commands an agent needs: test, build, run, lint. -->

## Constraints / gotchas
<!-- Things that have bitten us before. Keep current; delete stale entries. -->

## Handoff discipline (read this)
- You are usually RESUMING. Reconstruct state from `git log`/`git diff` and the
  WARM file `.agents/HANDOFF.md` (if present) before acting.
- If you do substantial work and reach a natural pause, update `.agents/HANDOFF.md`
  (current state + next step) and append one line to `.agents/log/HISTORY.md`.
- Commit your work locally; do not push (the lab host pushes — see Conventions).
