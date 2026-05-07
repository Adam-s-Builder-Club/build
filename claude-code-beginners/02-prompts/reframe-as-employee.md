# Reframe — AI as Employee, Not Search Engine

If you only remember one thing from Episode 1, it's this.

## The reframe

Stop treating Claude like Google. Treat it like an employee.

A search engine: you ask, it returns results, you do the work.
An employee: you give them context, a workspace, and tools — then you ask for the work.

The reason most people get bad outputs from AI is they're using employee-tier tools with search-engine-tier inputs.

## What an employee needs

| What | Where it lives | Example |
|---|---|---|
| **Context** | `CLAUDE.md` (global + project) | "I'm a non-technical founder. My main project is a portfolio site." |
| **Workspace** | The project folder | The folder you opened in Claude Desktop |
| **Tools** | MCPs and skills | "Connect Google Drive so you can read my work samples" |

Once those three are set, asking for work is the easy part.

## The mental swap

| Old (search engine) | New (employee) |
|---|---|
| "How do I add a contact form to my portfolio?" | "Add a contact form to the portfolio site in this folder. Match the existing styling." |
| "What's the best way to deploy a Next.js app?" | "Deploy this Next.js app to Vercel. I have a Vercel account at [email]." |
| "Write me a cold email" | "Read the company info in `about.md` and write a cold email to founders matching the ICP in `icp.md`." |

The new versions assume Claude has context, a workspace, and the ability to take action. That's the entire shift.

## When to use this prompt

If you find yourself getting generic, useless answers, paste this at the top of your prompt:

```
Treat this like an employee task, not a search query.
You have access to my project folder and the tools I've connected.
Read the relevant files first. Ask me one or two questions if you need them.
Then do the work.
```

Then state what you actually want.

## The compounding angle

Every CLAUDE.md you write, every skill you install, every tool you connect — these are the things you give to the employee once and never again. They compound. After three months, your Claude knows more about how you work than any new hire ever would on day one.

That's the actual unlock.
