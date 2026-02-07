#!/usr/bin/env sh
set -eu

REPO_URL="https://github.com/bladecoder/android-terminal-setup.git"
WORKDIR="${TMPDIR:-/tmp}/android-terminal-setup"

if ! command -v git >/dev/null 2>&1; then
  echo "Installing git..."
  if command -v apt-get >/dev/null 2>&1; then
    if command -v sudo >/dev/null 2>&1; then
      sudo apt-get update -y
      sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y \
        -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" \
        git
    else
      apt-get update -y
      env DEBIAN_FRONTEND=noninteractive apt-get install -y \
        -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" \
        git
    fi
  elif command -v pkg >/dev/null 2>&1; then
    pkg install -y git
  else
    echo "git is required but not installed; please install git and re-run." >&2
    exit 1
  fi
fi

rm -rf "${WORKDIR}"
git clone --depth 1 "${REPO_URL}" "${WORKDIR}"

cd "${WORKDIR}"
sh ./setup.sh
