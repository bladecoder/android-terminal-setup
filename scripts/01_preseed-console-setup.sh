#!/bin/bash
set -euo pipefail

# Preseed keyboard/console packages to avoid interactive debconf screens
# (e.g. console-setup in non-interactive Android Terminal sessions).
if ! command -v debconf-set-selections >/dev/null 2>&1; then
    echo "debconf-set-selections not found, skipping console preseed."
    exit 0
fi

sudo debconf-set-selections <<'EOF'
keyboard-configuration keyboard-configuration/modelcode string pc105
keyboard-configuration keyboard-configuration/layoutcode string us
keyboard-configuration keyboard-configuration/variantcode string
keyboard-configuration keyboard-configuration/optionscode string
keyboard-configuration keyboard-configuration/xkb-keymap select us
console-setup console-setup/charmap47 select UTF-8
console-setup console-setup/codeset47 select Guess optimal character set
console-setup console-setup/fontface47 select Fixed
console-setup console-setup/fontsize-text47 select 16
console-setup console-setup/layoutcode string us
console-setup console-setup/modelcode string pc105
console-setup console-setup/variantcode string
EOF
