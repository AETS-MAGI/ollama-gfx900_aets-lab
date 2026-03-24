# 2026-03-25 Ollama UX 還元（one-shot anchor compare）

## 対象範囲

最小導線のみを追加:

- 低レイヤー最適化ロジックは追加しない
- kernel/source patch 提案はしない
- 新しい技術結論は追加しない

## 追加内容

1. `ollama-src` 側の入口スクリプト:
   - `scripts/mi25_anchor_compare.sh`
2. README 更新:
   - `README.md` section 10
   - `README.ja.md` section 10

## 目的

`ollama-src` 起点の運用者でも、既存の `multi_llm-client` wrapper を再利用して
baseline/side 比較を迷わず1コマンドで実行できるようにすること。

内部実行チェーン（委譲）:

- baseline bench -> side bench -> compare -> mode reports

## 証拠解釈のガード（明示維持）

- `gpt-oss` は current direct-dispatch anchor
- `tinyllama/qwen/deepseek` は current GGUF path で indirect が多い
- catalog-read evidence と dispatch evidence は別ゲートとして扱う

## 成果物出力先

生成物は次へ出力:

- `multi_llm-client/worklog/`
