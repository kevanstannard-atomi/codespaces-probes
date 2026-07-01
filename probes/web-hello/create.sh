#!/usr/bin/env bash
# Runs on your LAPTOP. Creates a Codespace on this repo using the web-hello
# devcontainer config, and prints the codespace name (feed it to verify.sh).
set -euo pipefail

REPO="kevanstannard-atomi/codespaces-probes"

gh codespace create \
  --repo "$REPO" \
  --devcontainer-path .devcontainer/web-hello/devcontainer.json \
  --machine basicLinux32gb \
  --display-name web-hello \
  --idle-timeout 30m \
  --retention-period 1h
