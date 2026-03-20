<p align="center">
  <a href="https://ollama.com">
    <img src="https://github.com/ollama/ollama/assets/3325447/0d0b44e2-8f4a-4e99-9b52-a5c1c741c8f7" alt="ollama" width="200"/>
  </a>
</p>

# Ollama

[English](README.md) | [日本語](README.ja.md)

## 1. Overview

This fork is used for experimental investigation and validation of Ollama + ROCm behavior on AMD Vega / gfx900 / Radeon Instinct MI25 class hardware.

This repository is not an official support statement for MI25/gfx900.

## 2. Why this fork exists

- Upstream ROCm package combinations can differ in whether gfx900-specific runtime assets are present.
- We need a reproducible place to test local rocBLAS/Tensile handling for gfx900.
- We need clear evidence trails (logs, scripts, worklogs) for what is verified vs. what is still under investigation.

## 3. Current verified status

Verified in the investigation environment:

- MI25/gfx900 is recognized by ROCm at `rocminfo` level.
- Local rocBLAS/Tensile(gfx900) build artifacts were produced and used for testing.
- GPU discovery has progressed from earlier immediate CPU fallback behavior.
- Ollama discovery logs reported ROCm/gfx900 device selection for MI25 after local rocBLAS path injection.

## 4. What is still unconfirmed

- Reproducibility across multiple models and sustained long-running inference sessions.
- Stability boundaries (memory pressure, model size, concurrent requests).
- Portability of this exact setup to other machines without additional tuning.

End-to-end success should only be claimed when directly verified for the target model/workload.

## 5. Differences from upstream

- This fork is used as an experiment/validation branch for MI25/gfx900.
- Local rocBLAS/Tensile(gfx900) override workflow is part of validation.
- Additional investigation-oriented scripts and notes are used alongside source changes.

## 6. gfx900 / MI25 notes

- ROCm visibility (`rocminfo`) and actual inference execution are separate checkpoints.
- Passing GPU discovery does not automatically prove all inference paths are stable.
- Local library path handling (especially rocBLAS/Tensile assets) can materially change runtime behavior.

## 7. Related files

Related scripts and investigation documents (file names only):

- build-ollama-gfx900.sh
- build-rocblas-gfx900.sh
- ollama-setup.sh
- MI25_environment-setup.md
- MI25_environment-setup-worklog.md
- MI25_build-dependencies-map.md

Related repository:

- ROCm-MI25-build: https://github.com/AETS-MAGI/ROCm-MI25-build

## 8. Quick usage notes

- Build Ollama with gfx900 target settings.
- Build rocBLAS/Tensile(gfx900) locally when required by validation.
- Inject local rocBLAS library path for service runtime tests.
- Capture journal + GPU telemetry for every validation run.

## 9. Disclaimer

This fork is for investigation and validation. It is not an official compatibility promise, product commitment, or support guarantee for Vega/gfx900/MI25.

---

The upstream README content is intentionally not duplicated in this fork.

## Upstream project

This repository is a research/validation fork of the upstream Ollama project.

For the standard upstream installation and general usage instructions, see:
- Upstream repository: `ollama/ollama`
- Official install/documentation pages from the upstream project

This fork README focuses on gfx900 / MI25 / ROCm validation-specific behavior and local verification notes.
