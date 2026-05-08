# Setup: Scheduling Routines in Claude Desktop

Routines are Claude Code's name for scheduled tasks. The skills in this folder (`daily-brief`, `morning-prep`) are designed to be invoked on a schedule: they work fine on demand, but the value lands when they run while you sleep.

Claude Code offers three scheduling tiers. Most beginners want **Desktop Scheduled Tasks**.

## The three tiers

| Tier | Runs on | Machine awake? | Best for |
|---|---|---|---|
| **`/loop`** | Your machine, current session | Yes, session open | Quick polling during a conversation ("check the deploy every 5 min") |
| **Desktop Scheduled Tasks** | Your machine | Yes (any time the task fires) | Daily routines like daily-brief and morning-prep |
| **Cloud Routines** | Anthropic's infrastructure | No | Tasks that should run even if your laptop is closed |

For daily-brief and morning-prep, **Desktop Scheduled Tasks** is the right tier: they need access to your local config files and connected MCPs.

## Requirements

- Claude Code v2.1.72 or later (`claude --version` to check)
- Claude Pro, Max, Team, or Enterprise plan
- The skill installed at `~/.claude/skills/<skill-name>/`

## Step-by-step: schedule a Desktop task

### 1. Install the skill

Either run the Adam's Builder Club `install.sh`, or copy the skill folder manually:

```bash
cp -r 04-routines/daily-brief ~/.claude/skills/
cp -r 04-routines/morning-prep ~/.claude/skills/
```

### 2. Create the config file

Each routine reads its config from `~/.claude/<routine-name>.config.md`. Open the SKILL.md inside the routine folder: there's a config template near the bottom. Copy it, fill in your details, save it at the path it specifies.

Example for daily-brief:
```bash
mkdir -p ~/.claude
nano ~/.claude/daily-brief.config.md
# (paste the template from daily-brief/SKILL.md, edit, save)
```

### 3. Open Claude Desktop's scheduling UI

In Claude Desktop:
1. Click your profile / settings icon
2. Find **Scheduled Tasks** (this is the Desktop feature for runs that fire on your laptop)
3. Click **New** (or **+**)

Heads up: Don't confuse Desktop **Scheduled Tasks** with Cloud **Routines** at claude.ai/code. They're two different features. Scheduled Tasks runs on your laptop and can read your local files. Routines runs on Anthropic's servers and cannot. We're using Scheduled Tasks here.

### 4. Configure the task

| Field | Value for daily-brief | Value for morning-prep |
|---|---|---|
| **Name** | `Daily brief` | `Morning prep` |
| **Prompt** | `Run my daily brief` | `Run my morning prep` |
| **Schedule (cron)** | `0 7 * * 1-5` | `0 8 * * 1-5` |
| **Timezone** | Your local TZ (e.g. America/New_York) | Same |
| **Allowed tools** | WebFetch, WebSearch, Gmail (if used), xAI/Grok (if used for X) | Google Calendar, Gmail (if used) |

The cron expression `0 7 * * 1-5` means "at 07:00 every weekday." Customize:

| Schedule | Meaning |
|---|---|
| `0 7 * * 1-5` | Weekdays at 7am |
| `0 8 * * *` | Every day at 8am |
| `30 7 * * 1-6` | Mon-Sat at 7:30am |
| `0 9 * * 1` | Mondays only at 9am |

### 5. Test before scheduling

Before relying on the schedule, run the skill manually first:

```
/daily-brief
```

If it produces a usable brief, schedule it. If not, fix the config first.

### 6. Watch for failures

Scheduled tasks can fail silently if:
- A connector token expired (Gmail, Calendar)
- A source rate-limited (X firehose via Grok, Reddit API)
- Your laptop was asleep at fire time

Check `~/.claude/daily-briefs/` or `~/.claude/morning-prep/` once a week to make sure files are landing. If a day is missing, run manually and check the logs.

## Cloud Routines (for the truly hands-off)

If you want these to run even when your laptop is closed (e.g. on vacation), use Cloud Routines instead:

1. Go to https://claude.ai/code
2. Create a new routine
3. Paste the same prompt and schedule
4. Connect the same MCPs (they're configured per-routine in cloud)

Caveats:
- Cloud routines can't read your local config files. You'll need to bake config into the prompt directly.
- Minimum interval is 1 hour (vs. 1 minute for Desktop).
- Cloud routines work on a fresh clone of any repo you connect: they don't have access to `~/.claude/`.

For most daily routines on a laptop you actually use, Desktop is simpler.

## Reference

- [Claude Code Scheduled Tasks docs](https://code.claude.com/docs/en/scheduled-tasks)
- [Routines (cloud) docs](https://code.claude.com/docs/en/routines)
- [Desktop Scheduled Tasks docs](https://code.claude.com/docs/en/desktop-scheduled-tasks)

## Don't do

- Don't schedule a routine before you've run it manually at least once.
- Don't run it more often than once a day unless the source actually changes that fast.
- Don't put secrets in the routine prompt: secrets belong in `~/.local-secrets/` or the connector itself.
