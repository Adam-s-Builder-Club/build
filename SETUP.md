# Setup

Three ways to get this on your machine, in order of laziness.

## Option 1 — Paste this into Claude Desktop (easiest)

Open Claude Desktop. Paste this prompt:

```
Set me up using github.com/Adam-s-Builder-Club/build.

Steps:
1. Clone the repo to ~/Documents/GitHub/build (or wherever I keep code)
2. Run ./install.sh from the repo root
3. After install, invoke the /setup skill to walk me through personalization
```

Claude will:
1. Clone the repo
2. Run the installer (it asks before touching anything)
3. Hand off to the `/setup` skill which asks you 6-8 questions and writes a personalized `~/.claude/CLAUDE.md`

Total time: 3-5 minutes including Claude asking you the personalization questions.

## Option 2 — One-line install (terminal)

```bash
git clone https://github.com/Adam-s-Builder-Club/build.git ~/Documents/GitHub/build
cd ~/Documents/GitHub/build
./install.sh
```

Then open Claude Desktop and run `/setup`.

## Option 3 — Manual (if you want to see what's happening)

1. Clone the repo to wherever you keep code
2. Read `install.sh` (it's short, well-commented)
3. Run it
4. Open Claude Desktop, run `/setup` to personalize, OR copy `claude-code-beginners/01-claude-md/global-CLAUDE.md.example` to `~/.claude/CLAUDE.md` and edit by hand

## What gets installed

| Where | What |
|---|---|
| `~/.claude/skills/setup/` | The interactive personalization skill (`/setup`) |
| `~/.claude/skills/<starter-skills>/` | The starter skill pack from this repo |
| `~/.claude/CLAUDE.md` | Personalized global config (only after you run `/setup` and approve) |

## What does NOT get installed automatically

- **gstack** — optional, the `/setup` skill asks before installing
- **compound engineering** — optional, the `/setup` skill asks before installing
- **Any of your secrets** — never. The installer never reads or writes API keys.

## Backup behavior

The installer always backs up an existing `~/.claude/CLAUDE.md` to `~/.claude/CLAUDE.md.backup-<timestamp>` before overwriting. You can roll back any time:

```bash
cp ~/.claude/CLAUDE.md.backup-20260506-091500 ~/.claude/CLAUDE.md
```

## Uninstall

There's no uninstaller — everything lives in `~/.claude/skills/` and `~/.claude/CLAUDE.md`. To remove:

```bash
rm -rf ~/.claude/skills/setup
rm -rf ~/.claude/skills/<other-skills-you-installed>
# restore your previous CLAUDE.md from the backup if you want
```

## Help

Open an issue at https://github.com/Adam-s-Builder-Club/build/issues
or post in the [Adam's Builder Club community](https://www.skool.com/adams-builder-club).
