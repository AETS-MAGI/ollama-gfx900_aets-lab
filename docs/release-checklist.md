# Release Checklist — ollama-src (gfx900 fork)

This checklist must be verified before tagging a release or pushing to the public remote.

## Artifact policy

This repository distributes **source code and patches only**.
Pre-built binaries and libraries are distributed via [ollama-gfx900-starter-kit](https://github.com/AETS-MAGI/ollama-gfx900-starter-kit).

## Pre-release checks

### 1. No generated artifacts tracked

```bash
# Must return empty
git ls-files | grep -E '^build-gfx900/|^\.backup/'

# Must return empty (root binary is gitignored, but verify)
git ls-files ollama
```

### 2. Working tree is clean

```bash
git status --short
# Expected: no output (clean tree)
```

### 3. .gitignore covers build outputs

Confirm `.gitignore` includes:
- `build-gfx900/`
- `.backup/`
- `/ollama`
- `build`
- `dist`

### 4. No secrets or local paths committed

```bash
# Spot-check for local paths
git grep -nE '/home/[^/]+/' -- '*.go' '*.md' '*.sh' '*.yaml' '*.yml' '*.json' '*.toml' || true

# Spot-check for likely credential assignments (reduced false positives)
git grep -nEI \
  "(api[_-]?key|secret|access[_-]?key|private[_-]?key|password)[[:space:]]*[:=][[:space:]]*['\"][^'\"]{8,}['\"]" \
  -- '*.go' '*.md' '*.sh' '*.yaml' '*.yml' '*.json' '*.toml' || true
```

Notes:

- Do not use a plain `token` keyword grep; it produces heavy false positives in this codebase.
- If `gitleaks` is available in your environment, run it as an additional pre-release check.

### 5. Version tag is consistent

The tag should match the format `v<upstream-version>-<N>-g<hash>`, e.g. `v0.18.2-20-gd44f21d89`.

```bash
git describe --tags --long
```

### 6. README reflects current patch set

Verify the patch table in `README.md` and `README.ja.md` matches the actual commits on `vega-int8-probe` relative to upstream.

---

## Post-release

- Upload `libggml-hip.so` and companion `.so` files to the starter-kit release assets.
- Update `ollama-gfx900-starter-kit/RELEASE_NOTES.md` and `RELEASE_NOTES.ja.md` with the new tag.
