# CLAUDE.md: Memory and Modes

Goal of this chapter: Claude remembers how you like to work, in every project, forever.

## What is CLAUDE.md

A plain Markdown file Claude reads at the start of every conversation. Think of it as a permanent system prompt that lives next to your project.

There are two scopes:

| Scope | Path | What goes here |
|---|---|---|
| **Global** | `~/.claude/CLAUDE.md` | Your defaults: tone, style, what to never do, your timezone, your role |
| **Project** | `<project-folder>/CLAUDE.md` | Project-specific facts: architecture, dependencies, deployment URL, env vars |

Claude reads both. Global gets overridden by project when they conflict.

## Quickstart

1. Copy `global-CLAUDE.md.example` to `~/.claude/CLAUDE.md`. Edit to your liking.
2. For each project folder, copy `project-CLAUDE.md.example` to `<project>/CLAUDE.md`. Customize.
3. Restart Claude Desktop (or start a new conversation).

That's it. Claude now knows you.

## Permissions (the second piece)

Claude Code asks permission for actions that touch your computer. Default settings:

- **Read/write inside the project folder** → always grant (otherwise Claude is useless)
- **Run shell commands** → approve case-by-case until you trust the agent for that operation
- **Read environment variables** → never share. Your API keys live there.

You can adjust in Settings → Permissions. Start narrow, widen as you trust.

## Files in this chapter

- `global-CLAUDE.md.example`: drop into `~/.claude/CLAUDE.md`
- `project-CLAUDE.md.example`: drop into any project folder you start
