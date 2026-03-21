# 開発ガイド

[English](./development.md) | [日本語](./development.ja.md)

> **フォーク注記:** このドキュメントは gfx900/MI25 調査フォークの開発環境構築を説明します。
> 実行時の詳細や検証手順は [gfx900 / MI25 ガイド](./gfx900-mi25.ja.md) を参照してください。

前提ツールをインストールします：

- [Go](https://go.dev/doc/install)
- C/C++ コンパイラ（macOS は Clang、Linux は GCC/Clang）

リポジトリのルートから Ollama をビルド・起動します：

```shell
go run . serve
```

> [!NOTE]
> Ollama はネイティブコードを CGO でコンパイルしています。まれにデータ構造の変化により CGO が同期ずれを起こし、予期しないクラッシュが発生することがあります。その場合は `go clean -cache` を実行してからビルドしてください。

---

## macOS (Apple Silicon)

Metal が Ollama バイナリに内蔵されているため、追加手順は不要です。

---

## macOS (Intel)

前提ツール：

- [CMake](https://cmake.org/download/) または `brew install cmake`

設定とビルド：

```shell
cmake -B build
cmake --build build
```

起動：

```shell
go run . serve
```

---

## Windows

前提ツール：

- [CMake](https://cmake.org/download/)
- [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/)（ネイティブデスクトップワークロードを含む）
- （任意）AMD GPU サポート
    - [ROCm](https://rocm.docs.amd.com/en/latest/)
    - [Ninja](https://github.com/ninja-build/ninja/releases)
- （任意）NVIDIA GPU サポート
    - [CUDA SDK](https://developer.nvidia.com/cuda-downloads?target_os=Windows&target_arch=x86_64&target_version=11&target_type=exe_network)
- （任意）Vulkan GPU サポート
    - [VULKAN SDK](https://vulkan.lunarg.com/sdk/home)
- （任意）MLX エンジンサポート
    - [CUDA 13+ SDK](https://developer.nvidia.com/cuda-downloads)
    - [cuDNN 9+](https://developer.nvidia.com/cudnn)

設定とビルド：

```shell
cmake -B build
cmake --build build --config Release
```

> ROCm 向けビルドには追加フラグが必要です：
> ```shell
> cmake -B build -G Ninja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
> cmake --build build --config Release
> ```

起動：

```shell
go run . serve
```

> **注意:** Windows の HIP ビルドは gfx900 を除外しています（`CMakeLists.txt` の `AMDGPU_TARGETS` フィルタ）。gfx900 サポートは Linux 専用です。

---

## Windows (ARM)

追加のアクセラレーションライブラリは現時点でサポートされていません。CMake は使用せず、`go run` または `go build` を使用してください。

---

## Linux

前提ツール：

- [CMake](https://cmake.org/download/) または `sudo apt install cmake` / `sudo dnf install cmake`
- （任意）AMD GPU サポート
    - [ROCm](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/quick-start.html)
- （任意）NVIDIA GPU サポート
    - [CUDA SDK](https://developer.nvidia.com/cuda-downloads)
- （任意）Vulkan GPU サポート
    - [VULKAN SDK](https://vulkan.lunarg.com/sdk/home)
    - またはパッケージマネージャで：`sudo apt install vulkan-sdk`（Ubuntu/Debian）、`sudo dnf install vulkan-sdk`（Fedora/CentOS）
- （任意）MLX エンジンサポート
    - [CUDA 13+ SDK](https://developer.nvidia.com/cuda-downloads)
    - [cuDNN 9+](https://developer.nvidia.com/cudnn)
    - OpenBLAS/LAPACK：`sudo apt install libopenblas-dev liblapack-dev liblapacke-dev`（Ubuntu/Debian）

> [!IMPORTANT]
> CMake を実行する前に、前提ツールが `PATH` に含まれていることを確認してください。

設定とビルド：

```shell
cmake -B build
cmake --build build
```

起動：

```shell
go run . serve
```

### Linux AMD ROCm（gfx900 / MI25）

> **このフォーク専用です。** upstream Ollama は gfx900 向けのビルドをサポートしていません。

ROCm 6.1 以上と HIP コンパイラが必要です。まずデバイスが認識されているか確認します：

```shell
rocminfo | grep -E "Name|gfx"
```

gfx900 を明示的なターゲットとして指定してビルドします。出力は `build-gfx900/` に配置され、`ml/path.go` により自動的に優先されます：

```shell
cmake -B build-gfx900 \
    -DAMDGPU_TARGETS=gfx900 \
    -DCMAKE_BUILD_TYPE=Release
cmake --build build-gfx900 --parallel $(nproc)
```

実行時に rocBLAS の初期化に失敗する場合（クラッシュや CPU フォールバック）は、関連リポジトリ
[ROCm-MI25-build](https://github.com/AETS-MAGI/ROCm-MI25-build) のスクリプトで gfx900 向け rocBLAS/Tensile をローカルビルドします：

```shell
# ROCm-MI25-build リポジトリのルートから実行
./build-rocblas-gfx900.sh
export ROCBLAS_TENSILE_LIBPATH=/path/to/local/rocblas/library
```

gfx900 ビルドで Ollama を起動します：

```shell
go run . serve
```

詳細な実行時挙動と既知の制限は [gfx900 / MI25 ガイド](./gfx900-mi25.ja.md) を参照してください。

---

## MLX エンジン（任意）

MLX エンジンは safetensor ベースのモデル実行を可能にします。MLX および MLX-C の共有ライブラリを CMake で別途ビルドする必要があります。

### macOS (Apple Silicon)

Metal ツールチェーンが必要です。まず [Xcode](https://developer.apple.com/xcode/) をインストールしてから：

```shell
xcodebuild -downloadComponent MetalToolchain
```

インストール確認（"no input files" と表示されれば正常）：

```shell
xcrun metal
```

ビルド：

```shell
cmake -B build --preset MLX
cmake --build build --preset MLX --parallel
cmake --install build --component MLX
```

### Windows / Linux (CUDA)

CUDA 13+ および [cuDNN](https://developer.nvidia.com/cudnn) 9+ が必要です。

```shell
cmake -B build --preset "MLX CUDA 13"
cmake --build build --target mlx --target mlxc --config Release --parallel
cmake --install build --component MLX --strip
```

---

## Docker

```shell
docker build .
```

### ROCm

```shell
docker build --build-arg FLAVOR=rocm .
```

---

## テストの実行

```shell
go test ./...
```

> [!NOTE]
> まれに Go 1.24 の `synctest` パッケージが関係する変更を行った場合、ローカルではビルド・テストが通っても CI が失敗することがあります。
> CI の失敗を事前に確認したい場合は次のように実行してください：
>
> ```shell
> GOEXPERIMENT=synctest go test ./...
> ```
>
> または永続的に有効化：
>
> ```shell
> go env -w GOEXPERIMENT=synctest
> ```

---

## ライブラリ検索パス

Ollama は `ollama` 実行ファイルからの相対パスでアクセラレーションライブラリを探索します：

* `./lib/ollama`（Windows）
* `../lib/ollama`（Linux）
* `.`（macOS）
* `build/lib/ollama`（開発時）

**このフォーク**では、さらに `build-gfx900/lib/ollama` を `build/lib/ollama` より高い優先度で探索します（`ml/path.go` 参照）。
これにより、開発中に gfx900 ビルドが標準ビルドパスを上書きせずに自動的に選択されます。

ライブラリが見つからない場合、Ollama はアクセラレーションライブラリなしで動作します。
