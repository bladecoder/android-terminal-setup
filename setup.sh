#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
SCRIPTS_DIR="${SCRIPT_DIR}/scripts"

if [ ! -d "${SCRIPTS_DIR}" ]; then
  echo "Scripts directory not found: ${SCRIPTS_DIR}" >&2
  exit 1
fi

if ! command -v bash >/dev/null 2>&1; then
  echo "bash is required but not installed." >&2
  exit 1
fi

cd "${SCRIPT_DIR}"

for script in "${SCRIPTS_DIR}"/*.sh; do
  [ -e "${script}" ] || continue
  echo "Running ${script}"
  bash "${script}"
done
