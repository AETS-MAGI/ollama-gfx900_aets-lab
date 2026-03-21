# Worklog: vega-int8-probe Path Hardening and Safety Pass (2026-03-22 JST)

## Objective

- In this forked Ollama workspace, stabilize MI25/gfx900 behavior by ensuring we build the right artifacts and load them from the right runtime paths first.
- Prioritize build/runtime path determinism before deeper performance tuning.

## Labels

- `[workspace confirmed]`: Verified directly in this workspace (git diffs, test results).
- `[inference / unvalidated]`: Expected effect not yet revalidated with fresh hardware runtime logs.
- `[main-node confirmed]`: No newly captured evidence in this entry.

## Working Branch

- Switched to `vega-int8-probe` and performed all changes there. `[workspace confirmed]`

## Changes Implemented

### 1) Path-hardening patch

- Updated `ml/path.go` to prioritize `build-gfx900/lib/ollama` in dev-time library lookup. `[workspace confirmed]`
- Updated `ml/backend/ggml/ggml/src/ggml.go` so that when `OLLAMA_LIBRARY_PATH` is unset, fallback candidates include `build-gfx900`, and only existing paths are joined into the search list. `[workspace confirmed]`
- Intent: reduce mismatch between build outputs (`build-gfx900`) and runtime-loaded libraries. `[inference / unvalidated]`

### 2) Safety patch (gfx900-gated behavior)

- Added `IsROCmGFX900()` in `ml/device.go`. `[workspace confirmed]`
- Changed `FlashAttentionSupported()` so ROCm is no longer treated as universally eligible; `gfx900` is explicitly excluded. `[workspace confirmed]`
- In `server/sched.go`, force `num_parallel=1` when `gfx900` is detected. `[workspace confirmed]`
- In `server/routes.go`, cap default `num_ctx` to `8192` for `gfx900`. `[workspace confirmed]`
- Intent: prefer safer legacy-compatible execution paths on older architecture. `[inference / unvalidated]`

### 3) Target formalization patch

- Added `gfx900` to `ROCm 6` and `ROCm 7` in `CMakePresets.json`. `[workspace confirmed]`
- In `Dockerfile`, narrowed rocBLAS cleanup from `*gfx90[06]*` to `*gfx906*`, preserving `gfx900` assets. `[workspace confirmed]`

### 4) Test additions

- Added `ml/device_test.go`:
  - `TestDeviceInfoIsROCmGFX900`
  - `TestFlashAttentionSupported`
- Ran `go test ./ml ./server -count=1`, passed. `[workspace confirmed]`

## Files Changed

- `CMakePresets.json`
- `Dockerfile`
- `ml/path.go`
- `ml/backend/ggml/ggml/src/ggml.go`
- `ml/device.go`
- `ml/device_test.go` (new)
- `server/sched.go`
- `server/routes.go`

## Current Conclusion

- We completed the foundational sequence first: path hardening, safety gating, and explicit gfx900 targeting. `[workspace confirmed]`
- Final runtime/perf impact still requires fresh MI25 validation logs after rebuild. `[inference / unvalidated]`

## Proposed Next Steps

1. Rebuild `build-gfx900` and confirm backend artifact placement.
2. Re-run inference checks and confirm `library=ROCm`, `compute=gfx900`, and `GPULayers` in logs.
3. If needed, run controlled comparison with explicit `ROCBLAS_TENSILE_LIBPATH`.

