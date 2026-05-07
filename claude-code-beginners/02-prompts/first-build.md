# First Build — Personal Portfolio Site

This is the prompt I paste in the first real demo of Episode 1. By the time it finishes, you have a working portfolio website on your laptop.

## Before you paste

1. Open Claude Desktop
2. Open an empty folder (e.g. `~/Desktop/my-portfolio`)
3. Trust the folder when prompted
4. Press **Shift+Tab+Tab** to enter **Plan mode** (Claude will draft a plan before writing code)

## The prompt

```
Build me a one-page personal portfolio site as a single index.html file.

Sections, in order:
1. Hero — name, one-line tagline, two CTAs (LinkedIn + Email)
2. About — three short paragraphs
3. Services — three cards: name, one-line description, "Learn more" button (no-op for now)
4. Selected work — three project cards with title, one-paragraph description, and "View project" link (no-op)
5. Contact — email and a working contact form (HTML only, no backend yet)

Style: clean, modern, monospace headers, sans-serif body. Dark mode by default.
No external dependencies — single file, inline CSS, no JavaScript frameworks.

When done, give me the command to open it in my browser.
```

## What happens next

Claude will draft a plan, ask 1-3 clarifying questions, then build. You approve, edit, or reject the plan. Once you approve, Claude writes `index.html` into your folder.

Open it with:
```bash
open index.html       # Mac
start index.html      # Windows
```

## When you're ready to deploy

Chapter 11 walks you through Vercel + your own domain. For now: get the local version looking how you want.

## Iterate from here

Once it's running, ask Claude:
- "Make the hero gradient subtler"
- "Add a small footer with my LinkedIn icon"
- "Replace the placeholder project cards with these three: [paste]"

Each one is a one-line follow-up. That's the workflow.
