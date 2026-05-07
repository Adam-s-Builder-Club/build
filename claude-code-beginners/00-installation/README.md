# Installation

Goal of this chapter: from zero to a working Claude Desktop on your laptop in under 10 minutes.

## Step 1 — Download Claude

Go to https://claude.com/download and grab the desktop app for your operating system.

- **Mac**: drag Claude into Applications, open it, sign in.
- **Windows**: run the installer, sign in.

You don't need a terminal. You don't need a code editor. The desktop app has Claude Code built in.

## Step 2 — Sign in and pick a plan

Sign in with your Anthropic account. If you don't have one, create one — free.

Plan recommendation:
- **Just trying it out:** Free is fine for the first few days.
- **Doing the demos in this video:** **Pro ($20/mo)** is the floor. You'll hit usage limits on free.
- **Power user / building a SaaS:** **Max ($100/mo or $200/mo)** — Opus access + much higher limits. This is what I run.

You can upgrade later. Don't optimize this on day one.

## Step 3 — Privacy settings (do this now)

Settings → Privacy & data → **Help improve Claude** → **Off**.

This stops Anthropic from training on your data. Doesn't affect functionality.

## Step 4 — Test it

Open Claude. In the input, type:
```
What's 2+2?
```

If it answers, you're done with installation.

## Step 5 — Open a project folder

The unlock from chatbot to agent is letting Claude see a folder.

1. Create an empty folder anywhere — e.g. `~/Desktop/my-first-claude-project`
2. In Claude Desktop, click the folder icon (or use the project picker)
3. Select the folder
4. When prompted, **trust** the folder

Now Claude can read and write files in that folder. That's the whole game.

## What's next

Open the next chapter: [`../01-claude-md/`](../01-claude-md/) — set up your global CLAUDE.md so Claude remembers how you like to work across every project.
