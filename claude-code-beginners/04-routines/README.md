# Routines

A routine is a skill that runs on a schedule. You don't invoke it; the clock does.

## What's covered

| Routine | When | What it does |
|---|---|---|
| [`daily-brief/`](./daily-brief/) | 7am ET, weekdays | Pulls past-24h news from sources you care about (X via Grok, HN, Reddit, RSS), summarizes into a 1-page brief, delivers via email/Slack/file |
| [`morning-prep/`](./morning-prep/) | 8am ET, weekdays | Reads today's calendar, generates a 1-page brief per meeting (attendees + linked docs + 3 questions), highlights inbox, names the one priority |

Both work fine on demand (`/daily-brief`, `/morning-prep`). The unlock is wiring them to a schedule so they run while you sleep.

## How scheduling works in Claude Code

Three tiers — pick one:

1. **`/loop`** — runs in your current Claude Code session. Dies when you close the terminal. Good for "check the deploy every 5 minutes" during a debugging session, not for daily routines.
2. **Desktop Scheduled Tasks** — runs on your laptop on a cron schedule. Best fit for these routines because they need access to your local config files and connected MCPs.
3. **Cloud Routines** — runs on Anthropic's infrastructure even when your laptop is closed. Useful for vacation mode but can't read local files.

Full setup walkthrough: [`setup-routines.md`](./setup-routines.md)

## Install

If you ran `install.sh` from the repo root, both routines are already at `~/.claude/skills/`.

To install manually:
```bash
cp -r claude-code-beginners/04-routines/daily-brief ~/.claude/skills/
cp -r claude-code-beginners/04-routines/morning-prep ~/.claude/skills/
```

Then create the config files (each routine's `SKILL.md` has a config template at the bottom):
```bash
nano ~/.claude/daily-brief.config.md
nano ~/.claude/morning-prep.config.md
```

## Schedule them

Open Claude Desktop → Settings → Routines → New routine. The exact fields and cron expressions are documented in [`setup-routines.md`](./setup-routines.md).

## Test before scheduling

Before you wire either to a cron, run it manually:

```
/daily-brief
/morning-prep
```

If the output is useful, schedule it. If not, fix the config first.

## Personalize

Both routines read from a config file at `~/.claude/<routine-name>.config.md`. The config defines:
- Which topics / sources to track
- Delivery method (email, Slack, file, Notion)
- Tone preferences
- Things to skip

Edit your config any time — changes take effect on the next run.

## Coming in Plus

The founder-OS routines I run for Bavlio and BaviMail every morning ship in [Adam's Builder Club Plus](https://www.skool.com/adams-builder-club) — competitor monitoring, lead-pipeline updates, deliverability watch, etc.
