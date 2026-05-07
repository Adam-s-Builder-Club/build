#!/usr/bin/env bash
# Adam's Builder Club — installer
#
# What this does:
#   1. Detects your OS (Mac or Linux/WSL)
#   2. Creates ~/.claude/ if it doesn't exist
#   3. Backs up any existing ~/.claude/CLAUDE.md
#   4. Installs the starter skills from this repo into ~/.claude/skills/
#   5. Installs the setup-skill so Claude can walk you through personalization
#
# What this does NOT do:
#   - Overwrite a working setup without backing it up first
#   - Install gstack or compound engineering (those are optional, handled by the setup skill)
#   - Send anything anywhere — runs entirely on your machine
#
# Usage (run from the repo root):
#   ./install.sh
#
# Or one-liner from anywhere (after you've cloned the repo):
#   curl -fsSL https://raw.githubusercontent.com/Adam-s-Builder-Club/build/main/install.sh | bash

set -euo pipefail

# Resolve repo root (where this script lives)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"
SKILLS_DIR="${CLAUDE_DIR}/skills"

# Colors
BOLD='\033[1m'; DIM='\033[2m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; RESET='\033[0m'

say()  { printf "${BOLD}%s${RESET}\n" "$*"; }
ok()   { printf "  ${GREEN}✓${RESET} %s\n" "$*"; }
warn() { printf "  ${YELLOW}!${RESET} %s\n" "$*"; }
fail() { printf "  ${RED}✗${RESET} %s\n" "$*"; exit 1; }
note() { printf "  ${DIM}%s${RESET}\n" "$*"; }

say ""
say "Adam's Builder Club installer"
say "──────────────────────────────"
note "Repo: $REPO_ROOT"
note "Target: $CLAUDE_DIR"
note ""

# Step 1 — OS check
case "$(uname -s)" in
  Darwin) OS="mac"; ok "Detected macOS" ;;
  Linux)  OS="linux"; ok "Detected Linux/WSL" ;;
  *)      fail "Unsupported OS: $(uname -s). This installer supports macOS and Linux/WSL." ;;
esac

# Step 2 — ensure ~/.claude exists
if [ ! -d "$CLAUDE_DIR" ]; then
  warn "$CLAUDE_DIR does not exist."
  note "Make sure you've installed Claude Desktop and signed in at least once."
  note "Download: https://claude.com/download"
  read -r -p "  Create ${CLAUDE_DIR} now and continue? [y/N] " yn
  case "$yn" in
    [yY]*) mkdir -p "$CLAUDE_DIR" && ok "Created $CLAUDE_DIR" ;;
    *) fail "Aborted. Install Claude Desktop and re-run." ;;
  esac
else
  ok "Found $CLAUDE_DIR"
fi

mkdir -p "$SKILLS_DIR"

# Step 3 — back up existing CLAUDE.md if present
if [ -f "${CLAUDE_DIR}/CLAUDE.md" ]; then
  STAMP=$(date +%Y%m%d-%H%M%S)
  BACKUP="${CLAUDE_DIR}/CLAUDE.md.backup-${STAMP}"
  cp "${CLAUDE_DIR}/CLAUDE.md" "$BACKUP"
  ok "Backed up existing CLAUDE.md → $(basename "$BACKUP")"
else
  note "No existing CLAUDE.md found (clean install)"
fi

# Step 4 — copy starter skills + routines from this repo
COPIED=0
for src_dir in \
  "${REPO_ROOT}/claude-code-beginners/03-skills-starter" \
  "${REPO_ROOT}/claude-code-beginners/04-routines"; do
  [ -d "$src_dir" ] || continue
  for skill in "$src_dir"/*/; do
    [ -d "$skill" ] || continue
    name=$(basename "$skill")
    # Only copy if it has a SKILL.md (skip plain README folders)
    [ -f "${skill}SKILL.md" ] || continue
    if [ -d "${SKILLS_DIR}/${name}" ]; then
      warn "Skill ${name} already exists in ~/.claude/skills/ — skipping (delete it first to reinstall)"
    else
      cp -r "$skill" "${SKILLS_DIR}/${name}"
      ok "Installed skill: ${name}"
      COPIED=$((COPIED+1))
    fi
  done
done
[ "$COPIED" -eq 0 ] && note "No new skills installed (already present)"

# Step 5 — install the setup-skill itself
SETUP_SRC="${REPO_ROOT}/setup-skill"
SETUP_DEST="${SKILLS_DIR}/setup"
if [ -d "$SETUP_SRC" ]; then
  if [ -d "$SETUP_DEST" ]; then
    rm -rf "$SETUP_DEST"
    note "Refreshing existing setup skill"
  fi
  cp -r "$SETUP_SRC" "$SETUP_DEST"
  ok "Installed setup skill at ~/.claude/skills/setup/"
else
  fail "setup-skill/ not found at $SETUP_SRC. Did you run this from the repo root?"
fi

# Step 6 — final instructions
say ""
say "Done."
say "──────────────────────────────"
note ""
say "Next: open Claude Desktop and run:"
printf "    ${BOLD}/setup${RESET}\n"
note ""
note "The setup skill will ask you a few questions (name, role, tools, tone)"
note "and write a personalized ~/.claude/CLAUDE.md based on your answers."
note ""
note "Optional add-ons (the setup skill will offer these):"
note "  - gstack (browser automation + QA tools)"
note "  - compound-engineering (planning + review workflow)"
note ""
say "Welcome to Adam's Builder Club."
note "Community: https://www.skool.com/adams-builder-club"
note "Docs: https://github.com/Adam-s-Builder-Club/build"
say ""
