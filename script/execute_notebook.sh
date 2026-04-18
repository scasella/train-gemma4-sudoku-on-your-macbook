#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="$ROOT_DIR/.venv"
NOTEBOOK="Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game.ipynb"
OUTPUT_NOTEBOOK="Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game.rerun.ipynb"

if [[ ! -x "$VENV_DIR/bin/python" ]]; then
  echo "Missing virtual environment. Run ./script/setup_workspace_env.sh first." >&2
  exit 1
fi

cd "$ROOT_DIR"
mkdir -p "$ROOT_DIR/outputs"
exec "$VENV_DIR/bin/jupyter" nbconvert \
  --to notebook \
  --execute "$NOTEBOOK" \
  --output "$OUTPUT_NOTEBOOK" \
  --ExecutePreprocessor.timeout=1800
