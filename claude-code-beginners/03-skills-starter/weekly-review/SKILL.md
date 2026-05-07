---
name: weekly-review
description: Runs a Sunday-night retro. Pulls the past 7 days of git commits, calendar events, and any tracked outputs (newsletters, posts, shipped PRs), then writes a 1-page review covering what shipped, what slipped, what to keep doing, and what to change. Invoke as "weekly review", "Sunday retro", or "what did I ship this week".
---

# Weekly Review

Most people don't know what they did last week. The ones who do, compound. This skill runs in 60 seconds and produces a review you'll actually re-read.

## What it produces

A 1-page review with:
1. **Shipped** — what actually went out the door
2. **In flight** — work that progressed but didn't ship
3. **Slipped** — what didn't move
4. **Patterns** — what's working / what's not
5. **One change for next week** — a single, specific intention

## The flow

### 1. Define the window

Default: last 7 calendar days, ending today. The user can override ("last 14 days," "since Monday").

Convert to the user's timezone (read from their CLAUDE.md). Always work in calendar-day boundaries — not 7×24h elapsed.

### 2. Pull data, in order

For each source, gather and summarize. Skip silently if not connected.

| Source | What to pull | How |
|---|---|---|
| Git | Commits across all repos in `~/Documents/GitHub/` (or user's path) | `git log --since="7 days ago" --pretty=format:"%h %s" -- across each repo` |
| Calendar | Events from the past 7 days (excluding focus blocks) | Google Calendar MCP or equivalent |
| GitHub | PRs merged + opened in the past 7 days | `gh search prs --author=@me --created="<dates>"` |
| Linear / Issues | Tickets closed in the past 7 days | Linear MCP if connected |
| Newsletter / Posts | Anything published in the past 7 days | Source-dependent — check user's CLAUDE.md for tracked outputs |

### 3. Categorize

For each item, classify:
- **Shipped** — visible to others (PR merged, post published, deal closed, ticket resolved)
- **In flight** — meaningful progress, not yet visible (PR opened, draft started, meeting that moved a deal)
- **Slipped** — items that were on the list at the start of the week and didn't move

How do you know what was "on the list"? Check:
- The previous week's review (if one exists at `~/.claude/weekly-reviews/<last-week-date>.md`)
- Calendar items labeled as work blocks
- Any GitHub issues assigned to the user that didn't get touched

If you can't determine it, say so.

### 4. Identify patterns

Two-line section. Read the data and call out:
- One thing the user is doing well that they should keep doing
- One thing that's not working (a recurring slip, a context-switch pattern, a meeting that keeps producing nothing)

Be honest, not flattering. Calling out a real pattern is the entire value here.

### 5. Recommend one change

Single sentence. Specific. Actionable.

Bad: "Focus more on shipping."
Good: "Stop scheduling 30-min meetings before noon — they kill the morning deep-work block where you actually ship."

### 6. Output

```markdown
# Weekly Review — [date range]

## Shipped
- [item] — [one-line context]
- [item] — [one-line context]

## In flight
- [item] — [status]
- [item] — [status]

## Slipped
- [item] — [why it didn't move]

## Patterns
**What's working:** [one line]
**What's not:** [one line]

## One change for next week
[Single specific intention.]
```

### 7. Save

Write the review to `~/.claude/weekly-reviews/<YYYY-MM-DD>.md` so next week's skill can read it. Create the directory if needed.

## Personalization

- **Source priorities** — edit the table above to add Notion, Slack, Substack, Beehiiv, etc.
- **Window** — change the default if you do bi-weekly reviews
- **Tone** — Sunday-night reflective vs. Monday-morning operator. Adjust the output template accordingly.
- **Tracked outputs** — list the things you ship publicly (newsletter, podcast, etc.) so the skill specifically pulls them

## Don't do

- Don't pad the "shipped" section. If nothing shipped, write "Nothing shipped this week" and move on.
- Don't soften the "what's not working" pattern. The whole point is honesty.
- Don't recommend more than one change. One is the limit.
- Don't include items the user told the skill to ignore (e.g. work for a former employer, side projects on pause).
