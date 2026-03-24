# 2026-03-25 ollama UX handoff (one-shot anchor compare)

## Scope

Minimal UX handoff only:

- no new low-level tuning logic
- no kernel/source patch proposal
- no new technical conclusion

## What was added

1. Script entry in `ollama-src`:
   - `scripts/mi25_anchor_compare.sh`
2. README updates:
   - `README.md` section 10
   - `README.ja.md` section 10

## Intent

Provide a one-command entrypoint for operators who start from `ollama-src`,
while reusing the existing `multi_llm-client` wrapper flow.

Execution chain (delegated):

- baseline bench -> side bench -> compare -> mode reports

## Evidence wording guard (kept explicit)

- `gpt-oss` is the current direct-dispatch anchor.
- `tinyllama/qwen/deepseek` are often indirect on current GGUF path.
- catalog-read evidence and dispatch evidence are separate gates.

## Output location

Artifacts are generated under:

- `multi_llm-client/worklog/`
