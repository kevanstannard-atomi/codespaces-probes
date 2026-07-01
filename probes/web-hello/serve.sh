#!/usr/bin/env bash
# Runs INSIDE the Codespace. Starts the static file server in the background
# (nohup, so it survives the ssh session that launched it) and returns.
# Port 8080 is declared in devcontainer.json, so GitHub auto-forwards it.
set -euo pipefail

APP_DIR="$(cd "$(dirname "$0")" && pwd)/app"
cd "$APP_DIR"

# don't double-start
if curl -sf http://localhost:8080/ >/dev/null 2>&1; then
  echo "serve: already listening on :8080"
  exit 0
fi

nohup python3 -m http.server 8080 >/tmp/web-hello.log 2>&1 &
echo "serve: python3 -m http.server on :8080 (pid $!), dir $APP_DIR"
