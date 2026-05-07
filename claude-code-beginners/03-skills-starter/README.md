# Skills Starter Pack

Skills are the compounding move. Each one is a reusable capability you give Claude that persists across every conversation.

## What's a skill, in one paragraph

A skill is a folder containing a `SKILL.md` (instructions) and optional helper files. When you invoke the skill — by typing `/<skill-name>` or by Claude detecting the trigger from your `description` frontmatter — Claude follows those instructions for the current task. Skills install once, work forever.

## The starter pack

Three skills, ready to drop into `~/.claude/skills/`. Each is generic by default and personalized via the **Personalization** section in its `SKILL.md`.

| Skill | What it does | When to use |
|---|---|---|
| [`brainstorm/`](./brainstorm/) | Forces structured idea generation: 5 angles → 3 options each → ranked with tradeoffs | Anytime you'd type "give me ideas for X" |
| [`prep-meeting/`](./prep-meeting/) | Reads your calendar event + attendees + linked docs, writes a 1-page brief with 3 questions to ask | Before any meeting that matters |
| [`weekly-review/`](./weekly-review/) | Pulls 7 days of git commits + calendar + PRs, writes a Sunday retro with patterns and one change | Sunday nights or Monday mornings |

## Install

If you ran `install.sh` from the repo root, all three are already at `~/.claude/skills/`. Skip to "Personalize."

To install one manually:
```bash
cp -r claude-code-beginners/03-skills-starter/brainstorm ~/.claude/skills/
```

Restart Claude Desktop or start a new conversation. Type `/brainstorm` to confirm.

## Personalize

Every skill has a **Personalization** section near the bottom of its `SKILL.md`. Open the file, find that section, edit. The skill respects your edits on the next invocation — no restart needed.

Common edits:
- **Tone** (terse / friendly / formal)
- **Defaults** for repetitive choices ("always rank by speed-to-ship")
- **Sources** the skill should prioritize (Notion, Linear, etc.)
- **Things to skip** (work for ex-employer, certain meeting types)

## Skill anatomy

Every skill is just:
```
my-skill/
├── SKILL.md       # frontmatter + instructions
└── (optional helper scripts)
```

The frontmatter at the top of `SKILL.md` (the `---name:`, `description:` block) tells Claude what the skill does and when to invoke it. Everything below is the actual procedure.

## Building your own

After a few weeks with these three, you'll start spotting patterns. The pattern → a skill. Open one of these as a template, copy it, edit:

```bash
cp -r ~/.claude/skills/brainstorm ~/.claude/skills/my-new-skill
# edit ~/.claude/skills/my-new-skill/SKILL.md
```

The Plus tier in [Adam's Builder Club](https://www.skool.com/adams-builder-club) ships the founder-OS skills I run two SaaS products with — dropped weekly.
