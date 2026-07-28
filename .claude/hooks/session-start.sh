#!/bin/bash
# Keeps the vendored deal-context commands/agent in sync with their source of
# truth (plugins/deal-context/ in colindubois-byte/claude-code, main branch)
# on every session start. Never blocks session start: network failures are
# logged and the existing local copies are left in place.
set -uo pipefail

REPO_RAW_BASE="https://raw.githubusercontent.com/colindubois-byte/claude-code/main/plugins/deal-context"
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"

sync_file() {
  local src_path="$1"
  local dest_path="$2"
  local url="${REPO_RAW_BASE}/${src_path}"
  local tmp
  tmp="$(mktemp)"

  if curl -fsSL --max-time 10 "$url" -o "$tmp"; then
    mkdir -p "$(dirname "$dest_path")"
    if ! cmp -s "$tmp" "$dest_path" 2>/dev/null; then
      cp "$tmp" "$dest_path"
      echo "deal-context sync: updated ${dest_path#$PROJECT_DIR/}"
    fi
  else
    echo "deal-context sync: could not fetch $url, keeping existing copy" >&2
  fi

  rm -f "$tmp"
}

sync_file "commands/deal-init.md"       "$PROJECT_DIR/.claude/commands/deal-init.md"
sync_file "commands/deal-refresh.md"    "$PROJECT_DIR/.claude/commands/deal-refresh.md"
sync_file "commands/deal-status.md"     "$PROJECT_DIR/.claude/commands/deal-status.md"
sync_file "agents/account-analyst.md"   "$PROJECT_DIR/.claude/agents/account-analyst.md"

exit 0
