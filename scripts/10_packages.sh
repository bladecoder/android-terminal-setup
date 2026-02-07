#!/bin/bash

set -euo pipefail

sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    gh duf bat \
    cmatrix fd-find ripgrep eza zoxide fzf imagemagick gpg jq ffmpeg \
    tmux
