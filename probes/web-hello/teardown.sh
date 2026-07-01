#!/usr/bin/env bash
# Runs on your LAPTOP. Deletes the Codespace to stop consuming quota.
# Usage: teardown.sh <codespace-name>
set -euo pipefail

CS="${1:?usage: teardown.sh <codespace-name>}"
gh codespace delete -c "$CS" --force
echo "deleted $CS"
