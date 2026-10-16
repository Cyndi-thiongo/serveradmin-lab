#!/usr/bin/env bash
set -euo pipefail
cd "$HOME/serveradmin-lab"
git fetch origin main
if [[ "$(git rev-parse HEAD)" != "$(git rev-parse origin/main)" ]]; then
  git pull --ff-only origin main
  echo "$(date): updated"
else
  echo "$(date): already up to date"
fi
