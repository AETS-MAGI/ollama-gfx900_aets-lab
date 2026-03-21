# ワークログ: vega-int8-probe 経路固定と安全化 (2026-03-22 JST)

## 目的

- fork 後の Ollama で、MI25/gfx900 向けに「正しい成果物を、正しい探索先から確実に読む」状態を先に固める。
- 性能最適化より前に、build/runtime path のブレを減らし、評価可能な土台を作る。

## ラベル

- `[workspace confirmed]`: このワークスペースで直接確認した事実（git 差分、テスト結果）。
- `[inference / unvalidated]`: 実機ランタイムでの再検証が未完了の推定。
- `[main-node confirmed]`: このエントリで新規採取した証拠はなし。

## 作業ブランチ

- `vega-int8-probe` に切り替えて作業を実施。 `[workspace confirmed]`

## 実施内容

### 1) 経路固定パッチ

- `ml/path.go` で `build-gfx900/lib/ollama` を優先探索に追加。 `[workspace confirmed]`
- `ml/backend/ggml/ggml/src/ggml.go` で `OLLAMA_LIBRARY_PATH` 未設定時のフォールバック候補に `build-gfx900` を追加し、存在する候補のみを連結して探索。 `[workspace confirmed]`
- 目的: build 成果物 (`build-gfx900`) と実行時ロード先のズレを抑止。 `[inference / unvalidated]`

### 2) 安全化パッチ (gfx900 条件分岐)

- `ml/device.go` に `IsROCmGFX900()` を追加。 `[workspace confirmed]`
- `FlashAttentionSupported()` で、ROCm 一律許可ではなく `gfx900` を除外。 `[workspace confirmed]`
- `server/sched.go` で `gfx900` 検出時は `num_parallel=1` を強制。 `[workspace confirmed]`
- `server/routes.go` で、`gfx900` 検出時のデフォルト `num_ctx` を最大 `8192` にキャップ。 `[workspace confirmed]`
- 目的: 旧世代で不安定になりやすい経路を避け、保守側へ倒す。 `[inference / unvalidated]`

### 3) ターゲット正式化パッチ

- `CMakePresets.json` の `ROCm 6` / `ROCm 7` に `gfx900` を追加。 `[workspace confirmed]`
- `Dockerfile` の削除対象を `*gfx90[06]*` から `*gfx906*` に変更し、`gfx900` の rocBLAS 資産を残す方針に変更。 `[workspace confirmed]`

### 4) テスト追加

- `ml/device_test.go` を新規追加:
  - `TestDeviceInfoIsROCmGFX900`
  - `TestFlashAttentionSupported`
- `go test ./ml ./server -count=1` を実行し成功。 `[workspace confirmed]`

## 変更ファイル

- `CMakePresets.json`
- `Dockerfile`
- `ml/path.go`
- `ml/backend/ggml/ggml/src/ggml.go`
- `ml/device.go`
- `ml/device_test.go` (new)
- `server/sched.go`
- `server/routes.go`

## この時点の結論

- コード最適化より先に必要だった「経路固定」「安全化」「ターゲット明示化」を、最小差分で反映できた。 `[workspace confirmed]`
- 体感性能や GPU offload の最終評価には、`build-gfx900` 再ビルドと MI25 実機ログ再採取が必要。 `[inference / unvalidated]`

## 次アクション (提案)

1. `build-gfx900` を再ビルドし、生成物配置を確認する。
2. 実行ログで `library=ROCm` / `compute=gfx900` / `GPULayers` を再確認する。
3. 必要なら `ROCBLAS_TENSILE_LIBPATH` を固定した比較実行を行う。

