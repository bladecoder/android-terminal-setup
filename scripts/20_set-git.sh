#!/bin/bash
set -euo pipefail

# Ensure git settings live under $HOME/.config
mkdir -p "$HOME/.config/git"
touch "$HOME/.config/git/config"

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.pushf "push --force-with-lease"
git config --global alias.l "log --oneline"
git config --global alias.last "log -1 HEAD --stat"
git config --global alias.change-commits '!f() { var="$1"; old="$2"; new="$3"; shift 3; FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch --env-filter "current=$(eval echo \$$var); if [ \"$current\" = \"$old\" ]; then export $var=\"$new\"; fi" "$@"; }; f'


git config --global push.autoSetupRemote true
git config --global push.default current
git config --global init.defaultBranch main
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${SETUP_USER_NAME:-}" && -n "${SETUP_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "${SETUP_USER_NAME}"
fi

if [[ -n "${SETUP_USER_EMAIL:-}" && -n "${SETUP_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "${SETUP_USER_EMAIL}"
fi
