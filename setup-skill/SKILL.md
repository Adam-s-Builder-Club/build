---
name: setup
description: Personalize a fresh Adam's Builder Club install. Walks the user through their role, tools, tone, and optional add-ons (gstack, compound engineering), then writes a customized ~/.claude/CLAUDE.md. Invoke when a user has just cloned the Adam's Builder Club repo and wants their setup tailored, or when they say "set me up" / "personalize Claude" / "configure my CLAUDE.md".
---

# Setup: Personalize Adam's Builder Club

You are walking the user through their first Adam's Builder Club setup. Your job is to ask focused questions, then write `~/.claude/CLAUDE.md` based on their answers.

## Operating principles

- **Ask one question at a time.** Don't dump all 8 questions at once. Wait for the answer, acknowledge briefly, then ask the next.
- **Show your work.** After each answer, briefly state what you'll do with it ("Got it: I'll add a 'tone: terse' line to your CLAUDE.md").
- **Default to skipping advanced items** unless the user opts in. Most beginners don't need gstack or compound engineering on day one.
- **Never write to `~/.claude/CLAUDE.md` until the user has reviewed the final draft.** Show the full file, ask for any edits, then write.
- **Always back up.** If `~/.claude/CLAUDE.md` exists when you go to write it, copy it to `~/.claude/CLAUDE.md.backup-<timestamp>` first.

## The flow

### 1. Greet + check state

Open with:
> "Welcome to Adam's Builder Club. I'm going to ask you 6-8 questions, then write a personalized `~/.claude/CLAUDE.md` based on your answers. About 3 minutes. Ready?"

Then check the user's environment:
- `ls ~/.claude/`: does the directory exist? (It should, from `install.sh`.)
- Does `~/.claude/CLAUDE.md` already exist? If yes, mention it and confirm we'll back it up before overwriting.

### 2. Ask the questions, in order

Ask each one in plain prose. Don't number them visibly to the user: just ask naturally.

1. **Name**: "What should I call you?"

2. **Role / what they do**: "In one sentence, what do you do? (e.g. 'I run a marketing agency' or 'I'm a non-technical founder building my first SaaS' or 'I'm a designer learning to code with AI'.)"

3. **What they're building**: "What's the main thing you're using Claude for right now? Skip if you're just exploring."

4. **Timezone**: "What timezone are you in? (e.g. America/New_York, Europe/London.)"

5. **Tone preference**: "How do you want me to talk to you? Pick one: terse (just the answer, no preamble) · friendly (warm but efficient) · formal (full sentences, professional). Default is terse."

6. **Tool stack**: "What tools do you use daily? Pick any that apply: GitHub · Vercel · Cursor · Linear · Notion · Slack · Figma · Google Workspace · other (specify)."

7. **Optional: gstack**: "Want me to install gstack? It's a CLI for browser automation, QA testing, and design review workflows. Useful if you're shipping web apps. Skip if you're just starting out. [y/N]"

8. **Optional: compound engineering**: "Want me to install compound engineering? It's a planning + review methodology with workflows for `/plan`, `/work`, and PR review. Recommended if you're doing serious building. [y/N]"

### 3. Generate the CLAUDE.md draft

Use the template below, substituting their answers. Show the user the full draft and ask "Any edits before I write it to `~/.claude/CLAUDE.md`?"

```markdown
# Global Instructions

## Who I am
- Name: {NAME}
- Role: {ROLE}
- Currently building: {BUILDING}
- Timezone: {TIMEZONE}

## How I want you to work
- Tone: {TONE}
- Be direct. {if tone=terse: Skip preambles. State decisions, then explain only if I ask.}
- If you see a better path or a hidden risk, say so before implementing.
- Smallest possible change. One concern at a time.
- Never add comments, docstrings, or type hints unless I asked or you changed the code.

## What to do without asking
- Read files, edit files, run tests, run linters.
- Create new branches and commits when working on a task.

## What to ask before doing
- Anything that pushes to a remote or merges to main.
- Anything destructive: rm -rf, git reset --hard, force push, dropping tables.
- Installing new dependencies or modifying CI.

## Tools I use
{For each tool the user picked, add a one-line entry. e.g.}
- GitHub for version control
- Vercel for deploys
- Linear for issue tracking

## Memory
- At session start, read `.claude/memory.md` in the current repo if it exists.
- After fixing a non-trivial bug, add a one-line entry.
- Keep it under 100 lines.
```

### 4. Write the file (after user approval)

Once approved:
1. If `~/.claude/CLAUDE.md` exists, back it up: `cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup-$(date +%Y%m%d-%H%M%S)`
2. Write the new content to `~/.claude/CLAUDE.md`
3. Confirm: "Written to ~/.claude/CLAUDE.md. Restart Claude Desktop (or start a new conversation) for it to take effect."

### 5. Optional add-ons

If the user said yes to **gstack** (Garry Tan's Claude Code skill collection):

Run:
```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup
```

What this installs: 23 skills covering planning (`/office-hours`, `/plan-ceo-review`), design (`/design-shotgun`, `/design-review`), code review (`/review`, `/codex`), QA (`/qa`, `/browse`), deploy (`/ship`, `/land-and-deploy`), safety (`/careful`, `/freeze`, `/guard`), and utilities (`/retro`, `/learn`, `/autoplan`).

To uninstall later:
```bash
~/.claude/skills/gstack/bin/gstack-uninstall
```

Test by typing `/qa` or `/review` in Claude.

If the user said yes to **compound engineering** (Every Inc.'s plugin):

Run inside Claude Code:
```
/plugin marketplace add EveryInc/compound-engineering-plugin
/plugin install compound-engineering
```

What this installs: 37 skills and 51 agents structured around workflows: `/ce-brainstorm` (explore requirements), `/ce-plan` (structured planning), `/ce-work` (execute plans), `/ce-review` (multi-persona code review), `/ce-compound` (capture solved problems for future sessions).

Test by typing `/ce-plan` in Claude.

### 6. Final summary

End with a short recap:
> "All set. Here's what we did:
> - Wrote `~/.claude/CLAUDE.md` based on your answers
> - {Installed gstack} (if applicable)
> - {Installed compound engineering} (if applicable)
>
> Next: try a small task: open an empty folder in Claude and ask it to build something. The portfolio-site demo at `claude-code-beginners/06-portfolio-website-demo/` is a good first run."

## Common edge cases

- **User skips a question**: just leave that section out of the CLAUDE.md draft, don't make something up.
- **User has an existing CLAUDE.md they want to keep**: offer to merge: read theirs, add the new sections, ask before overwriting.
- **User wants more advanced setup**: point them at the [Skool community](https://www.skool.com/adams-builder-club) where the founder-OS skills live.
- **User asks for help mid-flow**: pause the questionnaire, answer their question, then ask "Want to continue setup, or come back to it later?"

## Don't do

- Don't write to disk without showing the user the full content first.
- Don't install anything that requires sudo without explicit user permission.
- Don't push back if the user wants to skip a question: just skip and move on.
- Don't recommend tools the user didn't ask about (no upsell pressure during setup).
