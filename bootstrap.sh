#!/usr/bin/env sh
set -eu

REPO_URL="https://github.com/bladecoder/android-terminal-setup.git"
WORKDIR="${TMPDIR:-/tmp}/android-terminal-setup"

command -v git >/dev/null 2>&1 || {
  echo "git is required but not installed" >&2
  exit 1
}

rm -rf "${WORKDIR}"
git clone --depth 1 "${REPO_URL}" "${WORKDIR}"

cd "${WORKDIR}"
sh ./setup.sh
