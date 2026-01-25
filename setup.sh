#!/usr/bin/env sh
set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
SCRIPTS_DIR="${SCRIPT_DIR}/scripts"

if [ ! -d "${SCRIPTS_DIR}" ]; then
  echo "Scripts directory not found: ${SCRIPTS_DIR}" >&2
  exit 1
fi

for script in "${SCRIPTS_DIR}"/*.sh; do
  [ -e "${script}" ] || continue
  echo "Running ${script}"
  sh "${script}"
done
