#!/bin/bash

set -euo pipefail

sync_file() {
    local src="$1"
    local dst="$2"

    if [ -f "$dst" ] && cmp -s "$src" "$dst"; then
        return 0
    fi

    if [ -f "$dst" ]; then
        mv "$dst" "${dst}.bak.$(date +%Y%m%d%H%M%S)"
    fi

    cp "$src" "$dst"
}

# Configure the bash shell using defaults (only if not already installed)
if [ ! -d "$HOME/.local/share/bash/" ]; then
    sync_file "./configs/bashrc" "$HOME/.bashrc"
else
    echo "Bash configuration already exists, skipping .bashrc (user customizations preserved)..."
fi

# Configure the inputrc using defaults (always update)
sync_file "./configs/inputrc" "$HOME/.inputrc"

# Copy bash configs to local share (always update)
mkdir -p "$HOME/.local/share/bash"
cp ./configs/bash/* "$HOME/.local/share/bash/"

## make the user shell bash if not already
BASH_PATH="$(command -v bash)"
if [ "${SHELL:-}" != "${BASH_PATH}" ]; then
    if [ -t 0 ] && [ -t 1 ]; then
        chsh -s "${BASH_PATH}"
    else
        echo "Skipping chsh (non-interactive session). Run: chsh -s ${BASH_PATH}"
    fi
fi
