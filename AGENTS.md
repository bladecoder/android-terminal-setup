# Repository Guidelines

## Project Structure & Module Organization
This repository is a script-based Android Terminal bootstrap.

- `bootstrap.sh`: remote-friendly installer (clone + run setup).
- `setup.sh`: local entrypoint; executes all `scripts/*.sh` in filename order.
- `scripts/`: modular install/config steps.
- `scripts/optional/`: opt-in scripts you run manually (for example `source scripts/optional/app-codex.sh`).
- `scripts/disabled/`: parked scripts not part of default setup.
- `configs/`: dotfiles and tool configs copied into `$HOME`.

Keep new setup phases in `scripts/` with numeric prefixes (for example `40_tooling.sh`) so execution order remains explicit.

## Build, Test, and Development Commands
There is no compile step; execution is shell-driven.

- `./setup.sh`: run full local setup sequence.
- `sh ./bootstrap.sh`: simulate bootstrap flow from a cloned repo.
- `bash scripts/10_packages.sh`: run one module in isolation while developing.
- `source scripts/optional/app-opencode.sh`: enable an optional component.

When editing scripts, validate syntax before committing:

- `bash -n setup.sh`
- `bash -n scripts/*.sh`

## Coding Style & Naming Conventions
Use POSIX `sh` only when needed; otherwise use `bash` and follow existing style:

- 4-space indentation.
- Quote variable expansions (`"$HOME"`).
- Use `set -eu` in non-trivial scripts.
- Keep steps short and idempotent when possible.

Name scripts as `<order>_<action>.sh` (example: `30_dev-languages.sh`).

## Testing Guidelines
This repo currently has no automated test suite. Use execution checks:

- Syntax check changed scripts with `bash -n`.
- Run modified module(s) directly.
- Re-run `./setup.sh` to verify idempotency and safe re-execution.

Document manual verification steps in your PR when behavior changes.

## Commit & Pull Request Guidelines
Use Conventional Commit style (as in current history), for example:

- `feat(termux): add optional android sdk installer`
- `fix(bash): quote HOME paths in installer`

For PRs, include:

- What changed and why.
- Which scripts were executed for validation.
- User-impacting changes (new packages, shell defaults, overwritten files).

## Security & Configuration Tips
Do not commit secrets or machine-specific credentials. Keep sensitive values out of tracked `configs/` files. Review `curl | sh` and remote downloads carefully, and pin versions when practical.
