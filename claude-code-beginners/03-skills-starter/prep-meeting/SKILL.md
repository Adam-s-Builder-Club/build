---
name: prep-meeting
description: Produces a 1-page brief before a meeting. Reads the calendar event, looks up attendees, pulls any linked documents, and generates context + 3 questions to ask. Invoke when the user says "prep me for [meeting name]", "what do I need to know about my next call", or "get me ready for [person]".
---

# Prep Meeting

Walk into every meeting with the context you'd have if you'd spent 30 minutes researching. The skill does it in 30 seconds.

## What it produces

A 1-page brief with:
1. **Meeting basics** — time, attendees, location/link
2. **Context** — why this meeting exists, what's happened before
3. **Attendee notes** — who's in the room, what you should know about each person
4. **Linked materials** — any docs/decks attached to the calendar event, summarized
5. **3 questions to ask** — sharp questions that move the conversation forward
6. **Your goal** — one line on what you want out of the meeting

## The flow

### 1. Identify the meeting

If the user says "prep me for my next call" — read the calendar (via Google Calendar MCP if connected) and grab the next event in their timezone.

If the user names a meeting — search the calendar for matching events in the next 24 hours.

If the user pastes a calendar link or invite — parse it directly.

If you can't find a meeting, ask:
> "Which meeting? Paste the calendar event title or share the invite."

### 2. Gather context

Pull, in this order:
- Calendar event title, description, attendees, location/conference link
- Any documents linked from the event description (Google Docs, Notion, Drive, etc.)
- Recent emails with the attendees (if Gmail is connected) — last 7 days
- Any project context the user has (CLAUDE.md, project notes)

Skip silently if a source isn't connected. Don't ask the user to set up integrations mid-flow.

### 3. Research attendees

For each non-user attendee, look up:
- Their role (from the email signature, LinkedIn if connected, or the user's contacts)
- Last interaction (from email history if available)
- Any context the user has stored about them

If the user doesn't have any record, say so explicitly. Don't fabricate.

### 4. Generate 3 questions

Sharp, specific questions tailored to the meeting purpose. Examples:

For a sales call:
- "What's currently blocking [their key initiative]?"
- "Who else needs to weigh in for this to move forward?"
- "What would success look like 90 days from now?"

For a 1:1 with a team member:
- "What's the single biggest blocker on your plate right now?"
- "What's something we're doing that you'd stop?"
- "Where do you want to be in 6 months?"

Questions should be ones the user wouldn't get from skimming the calendar event.

### 5. Output the brief

Use this template:

```markdown
# Meeting Brief — [Title]

**When:** [time, timezone]
**Where:** [link or location]
**Attendees:** [list]

## Context
[2-3 sentences on why this meeting exists]

## Attendees
- **[Name]** — [role]. [One line of relevant context]
- **[Name]** — [role]. [One line of relevant context]

## Linked materials
- **[Doc title]** — [2-line summary, link]
- **[Doc title]** — [2-line summary, link]

## 3 questions to ask
1. [Question]
2. [Question]
3. [Question]

## Your goal
[One sentence on what success in this meeting looks like]
```

## Personalization

Edit to fit your meeting style:

- **Default attendee research depth** — quick (just role + last contact) or deep (LinkedIn + email history + their company news)
- **Question style** — sales-y, founder-y, manager-y, technical, etc.
- **Source priorities** — if you live in Notion, point this skill at your Notion docs first

## Required integrations

For full power, connect these to Claude:
- **Google Calendar** (or your calendar provider) — to read meeting details
- **Gmail** (optional) — for email history with attendees
- **Google Drive / Notion / etc.** — to read linked documents

The skill works in degraded mode without them — just paste the calendar event manually.

## Don't do

- Don't fabricate attendee context. If you don't know, say "no record found."
- Don't ask the user to wait while you "research" — gather what you can in one pass and ship the brief.
- Don't include 7 questions. Three is the limit.
- Don't editorialize on the attendees. Stick to facts the user can verify.
