# Prompt Anatomy

Most prompt-engineering courses are 10 hours long. The actual game is two variables.

## The two variables

1. **Specificity**: how much you describe the output you want
2. **Context**: how much Claude knows about your situation

Most "bad outputs" are one of these missing. That's it.

## The four-part structure I use

```
[CONTEXT]     : what's true right now
[GOAL]        : what success looks like
[CONSTRAINTS] : what to avoid or stay inside
[FORMAT]      : how to deliver the answer
```

You don't need all four every time, but if a prompt is failing, check which of these is missing.

## Example: bad prompt

> Write me a cold email.

What's wrong: zero context (cold email to who? selling what?), zero specificity (length? tone?), zero format (subject line included?).

## Example: good prompt

> [CONTEXT] I run a B2B email infrastructure SaaS called Bavlio. It helps founders send cold email at scale without landing in spam.
>
> [GOAL] Write a cold email to founders of Series A SaaS companies who are currently using Outreach or Salesloft and frustrated with deliverability.
>
> [CONSTRAINTS] Under 80 words. No questions in the first sentence. Don't say "I hope this finds you well." End with a single soft ask, not a calendar link.
>
> [FORMAT] Subject line, body, sign-off. Markdown.

The second one will produce something usable on the first try. The first one will produce slop.

## When to skip structure

Quick lookups, debugging, "what does this code do": just ask. Structure pays off when output quality matters or when you'll reuse the prompt.

## Save the ones that work

Every prompt that produces a great output, save in a file. Build your own library. After 3 months you'll have 20-30 personal prompts that are worth more than any paid prompt pack.
