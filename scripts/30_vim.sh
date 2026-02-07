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

sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    vim

sync_file "./configs/vimrc" "$HOME/.vimrc"

# Install vim-plug if not already installed
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install plugins
if [ -t 0 ] && [ -t 1 ]; then
    vim +PlugInstall +qall
else
    echo "Skipping Vim plugin install (non-interactive session). Run: vim +PlugInstall +qall"
fi
