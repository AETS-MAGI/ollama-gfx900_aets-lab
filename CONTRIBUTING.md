# Contributing to ollama-src (gfx900 / MI25 fork)

Thank you for contributing. This repository is a research and validation fork focused on AMD Vega / gfx900 / MI25 behavior with ROCm.

## Scope of this fork

This fork prioritizes:

- gfx900/MI25 runtime fixes and stability work
- ROCm path handling and fallback behavior
- reproducible validation workflows and evidence capture
- documentation and operational hardening for this fork

Out-of-scope for this fork by default:

- broad upstream feature expansion unrelated to gfx900/MI25
- API-surface growth that is not required for this hardware target
- large refactors without direct validation value

## Where to open issues and PRs

Open issues and PRs against this fork repository, not upstream `ollama/ollama`.

If a change should also be proposed upstream, do that as a separate follow-up with a clearly scoped patch.

## Before you start

Read these documents first:

- [README.md](./README.md)
- [development docs](./docs/development.md)
- [gfx900 / MI25 guide](./docs/gfx900-mi25.md)
- [release checklist](./docs/release-checklist.md)

## Proposing non-trivial changes

For non-trivial changes, open an issue first and include:

- problem statement
- why it matters for gfx900/MI25
- expected behavior change
- validation plan and rollback plan

## Pull request expectations

### 1. Keep repository role split intact

This repository is source-of-truth for code and docs. Prebuilt artifacts belong in `ollama-gfx900-starter-kit` releases.

Do not introduce tracked build artifacts such as:

- `build-gfx900/`
- `.backup/`
- root `ollama` binary

Quick checks before pushing:

```bash
git ls-files | grep -E '^build-gfx900/|^\.backup/' && echo "unexpected tracked artifacts"
git ls-files ollama && echo "unexpected tracked root binary"
```

### 2. Provide validation evidence

When behavior changes on gfx900/MI25, include evidence in the PR description:

- hardware and ROCm version
- command(s) used
- key logs proving expected path selection
- regression checks for CPU fallback and startup behavior

### 3. Update docs with behavior changes

If runtime behavior, setup flow, or policy changes, update docs in the same PR.

For user-facing guidance, update both:

- English docs (`*.md`)
- Japanese docs (`*.ja.md`) where applicable

### 4. Keep commit messages clear

Use:

```text
<package-or-area>: <short description>
```

Examples:

- `ml/path: prioritize build-gfx900 runtime path for local validation`
- `docs/development: add hip_DIR fallback for ROCm cmake configure`

### 5. Tests and dependencies

- Add tests when practical, focusing on behavior.
- Keep new dependencies minimal and justify them in the PR.

## Security

Follow [SECURITY.md](./SECURITY.md). Do not disclose vulnerabilities publicly before responsible disclosure.
