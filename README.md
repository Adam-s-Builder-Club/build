# Adam's Builder Club — `build`

The companion repo for [Adam's Builder Club](https://www.skool.com/adams-builder-club) and the [Claude Code Beginners YouTube series](https://youtube.com/@adambadar).

Everything I show in the videos lives here — prompts, CLAUDE.md templates, starter skills, demo projects.

---

## Quickstart — paste this into Claude Desktop

```
Set me up using github.com/Adam-s-Builder-Club/build.

Steps:
1. Clone the repo to ~/Documents/GitHub/build
2. Run ./install.sh from the repo root
3. After install, invoke the /setup skill to walk me through personalization
```

Claude clones the repo, runs the installer, then hands off to the interactive `/setup` skill which asks you 6-8 questions (your role, tools, tone, optional add-ons) and writes a personalized `~/.claude/CLAUDE.md` based on your answers.

Total time: ~5 minutes. The installer never overwrites anything without backing it up first.

> Prefer to do it manually? See [`SETUP.md`](./SETUP.md) for the terminal one-liner and the full step-by-step.

---

## What's inside

```
build/
├── install.sh                       Idempotent installer
├── SETUP.md                         Three install paths (Claude / terminal / manual)
├── setup-skill/                     The interactive /setup skill
└── claude-code-beginners/
    ├── 00-installation/             Mac + Windows Claude Desktop setup
    ├── 01-claude-md/                Global + project CLAUDE.md templates
    ├── 02-prompts/                  Every prompt I use in the video
    ├── 03-skills-starter/           Starter skills (drop into ~/.claude/skills/)
    ├── 04-routines/                 Scheduled tasks (/daily-brief, /morning-prep)
    ├── 05-context-capture/          How my agents get smarter every week (architecture)
    ├── 06-portfolio-website-demo/   The portfolio site demo project
    └── tools-i-use.md               My current toolchain
```

## Watch the video

[Claude Code Beginners — Episode 1](https://youtube.com/@adambadar) on YouTube.

## Join the community

[skool.com/adams-builder-club](https://www.skool.com/adams-builder-club)

- **Free** — Video 1 companion course, prompt library, GitHub starter pack, community discussion
- **$9/mo** — premium prompts (weekly drops), all Build Night replays, member-only skills
- **$29/mo** *(soon)* — monthly office hours, Founder OS skills

## License

MIT — use anything in here for any purpose, no attribution required (but appreciated).

## Built by

[Adam Badar](https://adambadar.com) · [@adam_badar_ on X](https://x.com/adam_badar_) · founder of [Bavlio](https://bavlio.com), [BaviMail](https://bavimail.com), and [SapienEx](https://sapienex.com).

---

## Contributing

Found a typo? Built a skill that should be in here? Open a PR. The repo is meant to be a living artifact — every contribution makes the next person's first day easier.
