# Portfolio Website Demo

The full demo from Chapter 11 of Episode 1. By the end of this folder, you have a portfolio site live on the internet at your own domain.

## The four steps

```
1. Open empty folder · trust it
2. Launch Claude
3. Plan mode → paste the prompt
4. Approve → preview in browser
```

That gets you a local working site. Then:

```
5. Connect Drive (live work samples) and Calendar (book a call)
6. Deploy to Vercel
7. Point your domain at it
```

## Step 1-4: local build

The prompt to paste lives in [`../02-prompts/first-build.md`](../02-prompts/first-build.md). Same prompt I use in the video.

## Step 5: Connect tools (MCPs)

Once the site is working, you can wire it into:
- **Google Drive**: so the "Selected work" section pulls live from a Drive folder
- **Calendar**: so "Book a call" links to a real time-picker

The Drive and Calendar MCPs are covered in Chapter 8. They're a 1-click install in Claude Desktop's Connectors panel.

## Step 6: Deploy to Vercel

```bash
# install vercel CLI (if you don't have it)
brew install vercel-cli

# deploy
cd <your-portfolio-folder>
vercel
```

Vercel will ask a few questions (project name, framework: pick Other for a single HTML file). It deploys to a `*.vercel.app` URL within a minute.

If you don't have a Vercel account, sign up free at https://vercel.com.

## Step 7: Custom domain

In the Vercel dashboard:
1. Go to your project → Settings → Domains
2. Add your domain (e.g. `yourname.com`)
3. Vercel shows you the DNS records to add at your registrar (Namecheap, Cloudflare, Porkbun, etc.)
4. Add the records, wait 5-30 minutes
5. Done: your site is at `yourname.com`

## The point

This isn't really about the portfolio site. It's about going from "watched a video" to "shipped something on the internet" in one sitting. Every future build follows the same shape: prompt → plan → approve → deploy.

Once you've done it once, you've done it forever.
