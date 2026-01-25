#!/bin/bash

set -eu

DEBIAN_FRONTEND=noninteractive

sudo apt-get install -y gh duf bat \
    cmatrix fd-find ripgrep eza zoxide fzf imagemagick gpg jq ffmpeg \
    tmux

