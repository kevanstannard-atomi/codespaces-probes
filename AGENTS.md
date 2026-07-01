# codespaces-probes — Agent Instructions

Code-only repo of small probes exploring GitHub Codespaces. Each probe is the
simplest thing that visibly demonstrates one Codespaces capability.

## Where things live

- **This repo = code only:** devcontainer configs, probe scripts, app code.
- **Research, planning, findings, session notes = the Obsidian vault project**
  `Projects/background/99-github-codespaces/` in the user's Obsidian vault. Put
  durable discoveries there (with the vault's `add-context`/handover flow), never
  in this repo. This repo's READMEs describe *how to run* a probe, not what we learned.

## Structure convention

One shared repo, many probes. A probe is:

- `.devcontainer/<name>/devcontainer.json` — the config Codespaces reads. The set
  of folders under `.devcontainer/` is the catalogue of probes.
- `probes/<name>/` — everything else for that probe: scripts, app code, README.

Select a probe at create time with `--devcontainer-path .devcontainer/<name>/devcontainer.json`.
Do **not** create a new GitHub repo per probe unless a probe genuinely needs
different repo-level content.

## Script convention (per probe)

- Scripts that run **inside the codespace** (`postCreate.sh`, `serve.sh`, …) use
  paths under `/workspaces/codespaces-probes`.
- Scripts that run **on the laptop** (`create.sh`, `verify.sh`, `teardown.sh`)
  drive the `gh codespace` CLI. `create.sh` prints the codespace name; pass it to
  the others.
- `verify.sh` must print a clear `PASS`/`FAIL` and exit non-zero on failure.
- Always provide `teardown.sh` — Codespaces consume account quota while they exist.

## Adding a probe

1. `mkdir .devcontainer/<name> probes/<name>` (+ `app/` if needed).
2. Write `.devcontainer/<name>/devcontainer.json`.
3. Write the inside-codespace and laptop scripts + a `README.md`.
4. Add it to the "Probes" list in the repo `README.md`.

## Prerequisites

- `gh` CLI authenticated with the `codespace` scope:
  `gh auth refresh -h github.com -s codespace`.
