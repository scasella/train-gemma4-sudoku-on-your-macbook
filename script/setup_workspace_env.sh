#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="$ROOT_DIR/.venv"
REQ_FILE="$ROOT_DIR/requirements.txt"

if [[ ! -d "$VENV_DIR" ]]; then
  python3 -m venv "$VENV_DIR"
fi

"$VENV_DIR/bin/python" -m pip install --upgrade pip
"$VENV_DIR/bin/python" -m pip install -r "$REQ_FILE"

echo
echo "Workspace environment ready:"
echo "  $VENV_DIR"
if [[ ! -d "$ROOT_DIR/models" ]]; then
  echo
  echo "First notebook run will download and convert Gemma 4 into:"
  echo "  $ROOT_DIR/models"
  echo "Set HF_TOKEN in the environment first if the model is gated."
fi
