#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "${ROOT}/.." && pwd)"
CLIENT_ROOT="${MI25_CLIENT_ROOT:-${PROJECT_ROOT}/multi_llm-client}"
WRAPPER="${CLIENT_ROOT}/scripts/anchor_compare.sh"

usage() {
  cat <<'USAGE'
Usage:
  scripts/mi25_anchor_compare.sh [anchor_compare.sh options...]

Purpose:
  ollama-src side entrypoint for one-shot baseline/side comparison.
  This script forwards all options to multi_llm-client/scripts/anchor_compare.sh.

Examples:
  scripts/mi25_anchor_compare.sh --repeat 1 --predict-values 64,128 --report-format all
  scripts/mi25_anchor_compare.sh --model tinyllama:latest --repeat 1 --predict-values 32

Environment:
  MI25_CLIENT_ROOT  override multi_llm-client root path
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ ! -x "${WRAPPER}" ]]; then
  echo "[error] wrapper not found or not executable: ${WRAPPER}" >&2
  echo "[hint] set MI25_CLIENT_ROOT or ensure multi_llm-client/scripts/anchor_compare.sh exists" >&2
  exit 1
fi

if ! curl -fsS "http://127.0.0.1:11434/api/tags" >/dev/null 2>&1; then
  echo "[warn] Ollama endpoint not reachable at http://127.0.0.1:11434 (continuing anyway)" >&2
fi

echo "[info] delegating to: ${WRAPPER}" >&2
exec "${WRAPPER}" "$@"
