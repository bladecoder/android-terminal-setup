#!/bin/bash
set -euo pipefail

# Needed for all installers
sudo apt-get update -y
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    curl git unzip wget

# Create local folders
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share/"
mkdir -p "$HOME/.config/"
