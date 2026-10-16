#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="$HOME/serveradmin-lab"
BRANCH="main"
MSG="${1:-Auto-update from $(hostname) at $(date '+%Y-%m-%d %H:%M:%S')}"
cd "$REPO_DIR"
if [[ -n "$(git status --porcelain)" ]]; then
  git add -A
  git commit -m "$MSG"
else
  echo "Nothing to commit."
fi
git pull --rebase origin "$BRANCH"
git push origin "$BRANCH"
echo "Pushed at $(date)"
