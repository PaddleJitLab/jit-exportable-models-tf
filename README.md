# jit-exportable-models-tf

## Prerequisites

- uv
- meowda==0.1.5

## Analyse JIT exportability of various models

```bash
bash start_all.sh >! all-models.log 2>&1
python analysis.py all-models.log
```