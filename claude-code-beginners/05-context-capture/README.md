# Context Capture: How My Agents Get Smarter Every Week

In Episode 1 I mention that every word I say and every action I take on my computer gets captured into a private database, and my agents learn from it. This folder is the architecture writeup, not the source.

## Why this matters

The "compounding" pillar from the intro: agents that don't compound stay junior forever. The unlock is giving them memory across conversations, projects, and time.

There are a few ways to do this. Here's mine, plus the alternatives.

## My setup (Bavi)

```
MacBook (capture)              Cloud (storage + query)
─────────────────             ──────────────────────────
Screenpipe                    Postgres + pgvector
  ├ screen OCR (3 monitors)     ├ ocr_frames table
  ├ mic + system audio          ├ audio_chunks table
  └ local SQLite                └ embeddings (Voyage-3-large)
        │                              ↑
        └── sync daemon (every 10 min) ┘
                                       │
        Claude Code ←── skill query ───┘
```

- **Screenpipe** captures the screen and audio locally
- A sync daemon ships text+metadata only (no raw images) to a cloud database
- A Claude skill queries the database whenever I ask "what did I say to X" or "what was I working on Tuesday afternoon"

This is overkill for most people. I built it because I do too much across too many projects to remember any of it.

## Alternatives: pick what fits

| Tool | What it is | When to use |
|---|---|---|
| [Granola](https://granola.ai) | Meeting notes that auto-transcribe and summarize | Just want meeting context |
| [Limitless](https://limitless.ai) | Wearable + app that records meetings/conversations | Want the same idea but consumer-grade |
| [Rewind](https://rewind.ai) | Local screen + audio capture, searchable | Want it, don't want to build it |
| Roll your own | Build something like Bavi | You're a builder and want full control |

For 95% of people: Granola or Rewind. They give you 80% of the value with zero infrastructure.

## How the agent uses it

The trick isn't the capture: it's the retrieval. A skill called `bavi` knows how to:
1. Take a question like "what was I told about the Acme deal last week"
2. Hit the database with semantic search
3. Return the matching transcript chunks with timestamps
4. Hand those chunks to Claude as context

Claude then answers from real context, not made-up generalities.

## Source code

The full Bavi codebase isn't open source (it has my personal data flowing through it). The architecture above is enough to build your own, or pick one of the alternatives.

If demand is high enough, a sanitized template repo is on the roadmap: track in [Adam's Builder Club discussion](https://www.skool.com/adams-builder-club).
