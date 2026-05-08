---
name: morning-prep
description: Reads today's calendar, generates a 1-page meeting brief for each event with attendees, linked docs, and 3 questions to ask. Designed to run as a Claude Desktop Scheduled Task at 8am ET on weekdays. Invoke manually with "prep my day" or "what does today look like".
---

# Morning Prep

Wake up to a 1-page brief for every meeting on today's calendar. By 8am, you know what's coming, what to ask, and what success looks like in each room.

## What it produces

A daily preview document with:
1. **Today at a glance**: meeting count, total time in meetings, focus blocks, the one thing that matters most today
2. **Per-meeting brief**: for each meeting, attendees + context + 3 questions
3. **Inbox highlights**: top 3 unread emails that need attention before the first meeting
4. **One thing to do today**: single most important non-meeting task

## The flow

### 1. Pull today's calendar

Read calendar events for today in the user's timezone (from CLAUDE.md). Skip:
- All-day events
- Focus / DND blocks
- Events the user has marked "ignore" in their config

If a calendar isn't connected, exit gracefully:
> "No calendar connected. Connect Google Calendar in Claude Settings → Connectors and re-run."

### 2. For each meeting, generate a brief

Reuse the logic in the `prep-meeting` skill (in `../03-skills-starter/prep-meeting/`):
- Pull attendees from the calendar event
- Read any linked documents from the event description
- Look up recent email history with attendees (if Gmail is connected)
- Generate 3 questions tailored to the meeting purpose

Skip the per-meeting "your goal" line: at 8am the user doesn't need that level of depth across 8 meetings.

### 3. Pull inbox highlights

If Gmail (or equivalent) is connected, pull the top 3 unread items by:
- Sender importance (people the user replies to within 24h)
- Subject signals (RFP, contract, urgent, etc.)
- Thread depth (long unread threads outrank one-off promo)

If inbox isn't connected, skip the section silently.

### 4. Identify the one thing

Ask: of all today's open work (meetings, calendar todos, recent commitments from yesterday's brief, slipped items from the weekly review), what's the single most important non-meeting task?

The answer should be one sentence. If you can't answer in one sentence, the day has no priority and you should say so:
> "No clear priority: multiple competing tasks. Pick one in your first 10 minutes."

### 5. Output

```markdown
# Today: [date], [day of week]

## At a glance
- **Meetings:** [count] · **Total in-meeting time:** [hours]
- **Focus blocks:** [count + duration]
- **The one thing:** [single sentence]

---

## Inbox highlights
1. **[Sender]: [subject]**: [one-line context]
2. **[Sender]: [subject]**: [one-line context]
3. **[Sender]: [subject]**: [one-line context]

---

## Meeting briefs

### [Time]: [Meeting title]
**Attendees:** [list]
**Context:** [2 lines]
**Linked materials:** [doc summaries, if any]
**3 questions:**
1. [Q]
2. [Q]
3. [Q]

### [Time]: [Meeting title]
[same pattern]

[... through last meeting ...]
```

### 6. Deliver

Same as `daily-brief`:
- Default: save to `~/.claude/morning-prep/<YYYY-MM-DD>.md`
- If user config specifies email/Slack/Notion delivery, also send there

## Personalization

The skill reads `~/.claude/morning-prep.config.md`:

```markdown
# Morning Prep Config

## Calendar source
Google Calendar (default) | Outlook | Apple Calendar (via Bavi/Granola)

## Skip events matching
- Title contains: "Focus", "DND", "Lunch", "Block"
- Attendee count: just me (solo holds aren't briefed)

## Delivery
- Method: email
- To: me@example.com
- Time: 8:00 AM America/New_York
- Days: weekdays
```

## Setup as a scheduled task

1. Open Claude Desktop → Settings → Routines
2. Create a new task:
   - **Prompt:** `Run my morning prep`
   - **Schedule:** `0 8 * * 1-5` (weekdays at 8am local)
   - **Allow tools:** WebFetch, Google Calendar MCP, Gmail MCP (if used)
3. Save and test manually.

See `../setup-routines.md` for the full scheduling walkthrough.

## Don't do

- Don't generate briefs for events the user marked ignore.
- Don't include >3 questions per meeting (keeps the doc scannable).
- Don't fabricate context for attendees you don't have records on. Say "no record found."
- Don't skip the "one thing." That's the most valuable line in the document.
