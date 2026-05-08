# Plan Mode

Two keystrokes. Biggest jump in output quality you'll get all day.

## What it is

Press **Shift+Tab** twice (or type `/plan`) before you send a prompt. Claude switches into Plan mode:
1. It drafts a plan instead of writing code immediately
2. It asks 1-5 clarifying questions
3. You approve, edit, or reject the plan
4. Only after approval does it actually write code or take actions

## Why it matters

Without plan mode, Claude does the first thing that comes to mind. With plan mode, it commits to a strategy *before* spending tokens on the wrong thing.

The difference:
- Without plan mode: 60% of the time the output is wrong, you re-prompt, repeat
- With plan mode: 90% of the time the output is right on the first try

## When to use it

| Use plan mode | Skip plan mode |
|---|---|
| Building anything multi-file | Single-file edits |
| Refactoring | "What does this code do?" |
| Adding a feature | Quick lookups |
| Anything you'd want a junior dev to plan first | One-line tweaks |

Default: use plan mode for anything that takes more than 30 seconds of Claude's time.

## How to read a plan

When Claude shows you a plan, scan for:
1. **Did it understand the goal?** First bullet usually tells you.
2. **Are the steps in the right order?** Check if it's planning to test before deploying, etc.
3. **Did it miss something?** If it's not asking about a constraint you care about, add it before approving.
4. **Is it doing too much?** Cut scope if the plan ballooned.

You can edit the plan inline. Add/remove steps. Then approve.

## When plan mode goes wrong

If the plan is bad: reject it, restate your goal more clearly, try again. Don't approve a bad plan and try to course-correct mid-build: you'll waste more tokens.
