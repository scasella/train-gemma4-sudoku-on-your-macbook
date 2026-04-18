# Train Gemma 4 to Solve Sudoku on Your MacBook using Reinforcement Learning

A single-notebook, Apple Silicon-friendly reinforcement learning demo for people who want to see a real LLM training loop locally without setting up a large codebase first.

## What You Get

- One main notebook that already has outputs: [Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game.ipynb](./Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game.ipynb)
- One clean notebook with the same content but without baked-in outputs: [Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game_clean.ipynb](./Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game_clean.ipynb)
- Local Apple Silicon execution with `mlx` and `mlx-lm`
- A fully inline Sudoku environment, reward function definition, code-sandboxing logic, LoRA setup, and GRPO-style training loop
- A minimal setup path: create a venv, install dependencies, open JupyterLab, run the notebook
- No helper Python package, no local training framework, and no pre-existing checkpoint required

## Minimal Setup and Resource Footprint

This repo is optimized for the smallest practical setup surface:

- one notebook as the main artifact
- one `requirements.txt`
- three tiny helper scripts
- no Docker
- no CUDA
- no extra local package to install from this repo

Typical first-run local artifacts are modest for a real Gemma 4 example:

- Python environment: roughly `0.5 GB`
- Converted MLX model: roughly `2.5 GB`
- Notebook files and repo content: well under `1 MB`

The notebook was verified on an Apple Silicon MacBook Pro with `24 GB` unified memory, and the setup path is intentionally kept small and direct.

## Fast Setup

If Gemma 4 access requires authentication, export `HF_TOKEN` first.

```bash
git clone <your-repo-url>
cd train-gemma4-sudoku-on-your-macbook
./script/setup_workspace_env.sh
./script/run_jupyter_lab.sh
```

Then open:

`http://127.0.0.1:8888/lab`

If `8888` is busy:

```bash
./script/run_jupyter_lab.sh 8890
```

## Fastest Path

Open the default notebook:

- [Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game.ipynb](./Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game.ipynb)

Why this is the default:

- it already contains executed outputs
- newcomers can see the whole flow before they run anything
- the filename stays clean for sharing, linking, and GitHub previews
- it gives the fastest path from clone to understanding

If you want the exact same notebook without stored outputs, use:

- [Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game_clean.ipynb](./Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game_clean.ipynb)

## What Happens on First Run

- Python packages are installed into `.venv/`
- the notebook downloads and converts Gemma 4 into `models/`
- training outputs are written under `outputs/`

Nothing in this repo depends on a local helper package or a pre-existing checkpoint.

## Headless Check

```bash
./script/setup_workspace_env.sh
./script/execute_notebook.sh
```

This writes:

- `Gemma4_(E2B)_Reinforcement_Learning_Sudoku_Game.rerun.ipynb`

## What To Expect

- The notebook defines the reward functions inline.
- The notebook trains locally with LoRA adapters on MLX.
- The default run is tuned to stay practical on a laptop.
- The final saved policy is selected conservatively so a tiny RL run does not silently end worse than its warm start.
- The repo is meant to be discoverable, approachable, and fast to try.

## Publish Notes

Suggested GitHub metadata is in [GITHUB_METADATA.md](./GITHUB_METADATA.md).
