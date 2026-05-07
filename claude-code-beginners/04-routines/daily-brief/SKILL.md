---
name: daily-brief
description: Pulls the past 24h of news from public sources the user cares about, summarizes into a 1-page brief, and delivers it (email, Slack, Notion page, or saved file). Designed to run as a Claude Desktop Scheduled Task at 7am ET on weekdays. Invoke manually with "run my daily brief" or "give me today's brief".
---

# Daily Brief

Wake up to a 1-page summary of what changed in the world overnight, scoped to what you actually care about. No general news slop — only sources you've named.

## What it produces

A 1-page brief with:
1. **Top 3 stories** — what changed in the user's named topics, ranked by relevance
2. **By topic** — short bullet under each tracked topic
3. **In your industry** — competitor moves, funding, launches
4. **Your social feed** — top X/HN/Reddit items in the user's chosen subs
5. **Quick reads** — 5-10 links worth opening, sorted by importance

## The flow

### 1. Read the user's topic config

The user's tracked topics live in `~/.claude/daily-brief.config.md`. If it doesn't exist, prompt them to create it with the template at the bottom of this file.

Example config:
```markdown
# Daily Brief Config

## Topics I care about
- AI coding tools (Claude Code, Cursor, Cowork, Codex)
- Cold email deliverability and B2B outbound
- YC + early-stage startup news

## Sources
- X: [@simonw, @swyx, @adam_badar_, @nataliedeering]
- Subreddits: [/r/MachineLearning, /r/coldemail, /r/ycombinator]
- HN: front page filtered by my topics
- RSS: [list of feeds]

## Delivery
- Method: email
- To: me@example.com
- Time: 7:00 AM America/New_York
- Days: weekdays
```

### 2. Pull the past 24 hours

Use the calendar-day window: from yesterday 00:00 in user's timezone to today's run time.

| Source | How to pull |
|---|---|
| X / Twitter | Use Grok via xAI API (the X firehose is a native Grok tool) — query for posts from the user's followed accounts on their topics |
| HN | Fetch front page via the HN API, filter by topics |
| Reddit | Pull top posts from subs in config (RSS or Reddit API) |
| RSS | Fetch each feed in config |
| Industry news | Web search for `[topic] last 24 hours` per topic |

Skip a source silently if its credential isn't available.

### 3. Rank by importance

For each story, score on:
- **Relevance** to the user's topics (0-3)
- **Recency** (how fresh)
- **Magnitude** (one-time launch vs. routine update vs. news already-known)

Drop anything below a relevance score of 2. The user doesn't want to know about the 50th LinkedIn post from a tangential source.

### 4. Write the brief

Use this template:

```markdown
# Daily Brief — [date], [day of week]

## Top 3
1. **[Headline]** — [2-line summary, why it matters to user] [link]
2. **[Headline]** — [2-line summary] [link]
3. **[Headline]** — [2-line summary] [link]

## By topic
**[Topic 1]:** [bullet summary across the topic, 2-3 lines]
**[Topic 2]:** [...]

## Industry pulse
- [Competitor / adjacent move 1]
- [Competitor / adjacent move 2]
- [Funding / launch / pivot]

## Social feed
- **X:** [top 3 posts from followed list, ranked]
- **HN:** [top 3 stories matching topics]
- **Reddit:** [top 3 posts from tracked subs]

## Quick reads
- [link 1] — [one-line summary]
- [link 2] — [one-line summary]
- ...
```

### 5. Deliver

Method depends on user config:
- **Email** — send via Gmail MCP (or SES if user has it configured) to the address in config
- **File** — write to `~/.claude/daily-briefs/<YYYY-MM-DD>.md`
- **Slack** — post to the configured channel
- **Notion** — append to the configured page

Always also save a copy to `~/.claude/daily-briefs/<YYYY-MM-DD>.md` for archive + tomorrow's "what's changed since yesterday" diff.

### 6. Diff against yesterday (optional)

If yesterday's brief exists at `~/.claude/daily-briefs/<yesterday>.md`, add a "Changes since yesterday" section flagging stories that resolved or progressed.

## Personalization

The whole skill is driven by `~/.claude/daily-brief.config.md`. Edit that file to:
- Add or remove topics
- Switch sources on/off
- Change delivery method
- Change tone (terse vs. narrative)

If your config has a `## Tone` section, follow it. Default is terse.

## Setup as a scheduled task

This is a routine — meant to run on a schedule, not on demand. To wire it up:

1. Open Claude Desktop → Settings → Routines (or "Scheduled Tasks")
2. Create a new task:
   - **Prompt:** `Run my daily brief`
   - **Schedule:** `0 7 * * 1-5` (weekdays at 7am, in your local timezone)
   - **Allow tools:** WebFetch, WebSearch, the MCPs your config uses (Gmail, Slack, etc.)
3. Save. Test by triggering it manually first.

See `../setup-routines.md` for the full Claude Desktop scheduling walkthrough.

## Don't do

- Don't include a story without a link.
- Don't summarize beyond 2 lines per story.
- Don't include sources the user didn't list in their config.
- Don't skip the diff if yesterday's brief exists.
- Don't fabricate news. If a source returned nothing, say so.
