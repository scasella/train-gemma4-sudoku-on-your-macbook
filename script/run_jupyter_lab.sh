#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="$ROOT_DIR/.venv"
PORT="${1:-8888}"

if [[ ! -x "$VENV_DIR/bin/python" ]]; then
  echo "Missing virtual environment. Run ./script/setup_workspace_env.sh first." >&2
  exit 1
fi

cd "$ROOT_DIR"
exec "$VENV_DIR/bin/python" -m jupyterlab \
  --no-browser \
  --ServerApp.token='' \
  --ServerApp.password='' \
  --ServerApp.port="$PORT"
