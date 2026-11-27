#!/usr/bin/env bash
# 启动《一副透镜牌》中文版本地服务
# 用法：./serve.sh [端口]   默认 8899
set -euo pipefail
PORT="${1:-8899}"
DIR="$(cd "$(dirname "$0")/docs" && pwd)"
echo "→ http://127.0.0.1:${PORT}/"
echo "   （按 Ctrl+C 停止）"
exec python3 -m http.server "$PORT" --bind 127.0.0.1 --directory "$DIR"
