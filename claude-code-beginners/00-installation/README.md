# Installation

Goal of this chapter: from zero to a working Claude Desktop on your laptop in under 10 minutes.

## Step 1: Download Claude

Go to https://claude.com/download and grab the desktop app for your operating system.

- **Mac**: drag Claude into Applications, open it, sign in.
- **Windows**: run the installer, sign in.

You don't need a terminal. You don't need a code editor. The desktop app has Claude Code built in once you're on a paid plan (see Step 2).

## Step 2: Sign in and pick a plan

Sign in with your Anthropic account. If you don't have one, create one for free.

Important: **Claude Code requires a paid plan.** The free plan gives you the regular Claude chatbot, but the Code tab in the desktop app stays locked until you upgrade.

Plan recommendation:
- **Pro ($20/mo):** The minimum plan needed to use Claude Code. This is enough for everything we build in this video. Start here.
- **Max ($100/mo or $200/mo):** Same Claude Code, but with much higher daily limits and more access to Opus (Anthropic's most capable model). I run Max because I use Claude Code all day. You probably don't need this on day one.

You can upgrade later. Don't overthink this.

Plans and pricing accurate as of May 2026. Check https://claude.com/pricing for current details.

## Step 3: Privacy settings (do this now)

Settings → Privacy & data → **Help improve Claude** → **Off**.

This stops Anthropic from training on your data. Doesn't affect functionality.

## Step 4: Test it

Open Claude. In the input, type:
```
What's 2+2?
```

If it answers, you're done with installation.

## Step 5: Open a project folder

The unlock from chatbot to agent is letting Claude see a folder.

1. Create an empty folder anywhere: e.g. `~/Desktop/my-first-claude-project`
2. In Claude Desktop, click the folder icon (or use the project picker)
3. Select the folder
4. When prompted, **trust** the folder

Now Claude can read and write files in that folder. That's the whole game.

## What's next

Open the next chapter at [`../01-claude-md/`](../01-claude-md/) and set up your global CLAUDE.md so Claude remembers how you like to work across every project.
