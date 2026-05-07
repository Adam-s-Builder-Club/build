---
name: brainstorm
description: Forces structured idea generation when you'd otherwise type "give me ideas for X". Generates 5 angles, 3 options per angle, ranked with explicit tradeoffs. Invoke whenever the user asks for ideas, options, possibilities, names, or approaches to a problem — anytime they're in divergent-thinking mode and would benefit from breadth before depth.
---

# Brainstorm

The default failure mode of "give me ideas for X" is 5 generic options that all feel the same. This skill forces angle diversity before generating any specific ideas, then ranks them with honest tradeoffs.

## Operating principles

- **Diverge before converge.** Always generate angles first, then options inside each angle. Don't jump to specific ideas without choosing angles.
- **Honest tradeoffs.** Every option needs a one-line "best for" and a one-line "downside." If you can't name a downside, the option isn't real.
- **Don't stack-rank without context.** Ask the user what matters (cost? speed? differentiation? defensibility?) before ranking.
- **Limit to 5 angles, 3 options each.** More than that and the user can't hold it in their head.
- **Push back on vague prompts.** If the user says "give me marketing ideas," ask "for what audience, what budget, what timeline?" before generating anything.

## The flow

### 1. Clarify (only if needed)

If the prompt is vague — "give me ideas for X" with no context — ask 1-2 sharp questions:
- Who is this for?
- What does success look like?
- Any constraints (budget, time, tools, audience)?

Skip this step if the user already gave enough context.

### 2. Generate 5 angles

Angles are *frames*, not ideas. Each angle is a different lens on the problem. Examples:

For "ideas to grow my newsletter":
- Angle 1: Distribution (where new readers come from)
- Angle 2: Content (what's in each issue)
- Angle 3: Format (what the issue looks like)
- Angle 4: Frequency (how often you ship)
- Angle 5: Monetization (how it pays for itself)

State the 5 angles explicitly. Don't move on until they're listed.

### 3. Generate 3 options per angle

For each angle, give 3 specific, concrete options. Each option gets:
- One-line description
- "Best for: [specific situation]"
- "Downside: [honest cost or risk]"

15 options total. No more.

### 4. Rank with the user's criteria

Ask: "What matters most — cost, speed, differentiation, defensibility, something else?"

Rank the top 5 options against that criterion. Show your reasoning in one sentence per ranking.

### 5. Recommend one

End with a single recommendation and a reason. Not "any of these would work" — a real pick.

## Output template

```markdown
# Brainstorm: [topic]

## Angles
1. [Angle 1 — one-line frame]
2. [Angle 2 — one-line frame]
3. [Angle 3 — one-line frame]
4. [Angle 4 — one-line frame]
5. [Angle 5 — one-line frame]

## Options

### Angle 1: [name]
- **Option A** — [description]. Best for: [X]. Downside: [Y].
- **Option B** — [description]. Best for: [X]. Downside: [Y].
- **Option C** — [description]. Best for: [X]. Downside: [Y].

### Angle 2: [name]
[same pattern]

[... through Angle 5 ...]

## Top 5 ranked by [criterion]
1. [Option] — [one-line reason]
2. [Option] — [one-line reason]
3. [Option] — [one-line reason]
4. [Option] — [one-line reason]
5. [Option] — [one-line reason]

## My pick
**[Option name]** — because [one-paragraph reason].
```

## Personalization

Edit this skill to match your domain:

- **Replace the angle prompts** with angle types relevant to your work (e.g. for product: features, monetization, distribution, retention, defensibility)
- **Set defaults for your criteria** (e.g. always rank by "fastest to ship" if you're a solo founder under deadline pressure)
- **Add your taste** — if you hate certain types of ideas (e.g. "anything that requires paid ads"), state that here so the skill skips them by default

## Don't do

- Don't generate ideas without angles first
- Don't give 10+ options (the user will glaze over)
- Don't rank without asking what matters
- Don't recommend "any of these would work" — pick one
- Don't pretend an option has no downsides
