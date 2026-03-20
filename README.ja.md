# Ollama (MI25/gfx900 調査フォーク)

[English](README.md) | [日本語](README.ja.md)

## 1. 概要

このフォークは、AMD Vega / gfx900 / Radeon Instinct MI25 クラスのハードウェア上で、Ollama + ROCm の挙動を実験的に調査・検証するために使用します。

このリポジトリは、MI25/gfx900 の公式サポート表明ではありません。

## 2. このフォークの目的

- upstream の ROCm パッケージ構成によっては、gfx900 向けランタイム資産の有無が異なるため
- gfx900 向け local rocBLAS/Tensile の取り扱いを再現可能な形で検証するため
- 検証済み事項と未確定事項を、ログ・スクリプト・作業記録として明確に分離するため

## 3. 現時点で検証済みの事項

調査環境で確認できている内容:

- `rocminfo` レベルで MI25/gfx900 が認識される
- local rocBLAS/Tensile(gfx900) のビルド成果物を生成し、検証に使用した
- 以前の即時 CPU fallback 状態から、GPU discovery が前進した
- local rocBLAS パス注入後、Ollama discovery ログで ROCm/gfx900 のデバイス選択が確認できた

## 4. まだ未確認の事項

- 複数モデルおよび長時間推論での再現性
- 安定性の境界条件（メモリ圧、モデルサイズ、同時リクエスト）
- 追加チューニングなしで他マシンへ同手順を移植できるか

最終的なエンドツーエンド成功は、対象モデル・対象ワークロードでの直接検証をもって判断してください。

## 5. upstream との差分

- 本フォークは MI25/gfx900 向けの実験・検証ブランチとして運用
- local rocBLAS/Tensile(gfx900) override 手順を検証フローに含む
- ソース変更に加え、調査用スクリプト/記録を併用

## 6. gfx900 / MI25 運用メモ

- ROCm 可視化（`rocminfo`）と実推論成功は別チェックポイント
- GPU discovery 通過だけでは、全推論経路の安定性は保証されない
- とくに rocBLAS/Tensile 資産のライブラリパス取り扱いが実行挙動に影響しうる

## 7. 関連ファイル

関連スクリプト・調査文書（ファイル名のみ）:

- build-ollama-gfx900.sh
- build-rocblas-gfx900.sh
- ollama-setup.sh
- MI25_environment-setup.md
- MI25_environment-setup-worklog.md
- MI25_build-dependencies-map.md
- AGENTS.md

## 8. クイック運用メモ

- gfx900 ターゲット設定で Ollama をビルド
- 必要に応じて local rocBLAS/Tensile(gfx900) をビルド
- service 実行時に local rocBLAS ライブラリパスを注入
- 検証実行ごとに journal と GPU テレメトリを採取

## 9. 免責

このフォークは調査・検証用途です。Vega/gfx900/MI25 に対する公式な互換性保証、製品コミットメント、サポート保証を意味しません。

---

一般的なインストール手順、API 利用方法、コミュニティ情報などは英語版 [README.md](README.md) を参照してください。
