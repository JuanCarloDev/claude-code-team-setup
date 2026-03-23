# Penguin Team — Claude Code & Development Onboarding

> Everything you need to know to start working with VS Code, GitHub, Git, and Claude Code on Penguin projects. Based on the CTO training session (March 2026).

---

## Table of Contents

1. [What is What?](#1-what-is-what)
2. [VS Code Setup (Critical)](#2-vs-code-setup-critical)
3. [Git Workflow](#3-git-workflow)
4. [Commit vs Deploy](#4-commit-vs-deploy)
5. [Branch Strategy](#5-branch-strategy)
6. [Claude Code Best Practices](#6-claude-code-best-practices)
7. [Building Your CLAUDE.md](#7-building-your-claudemd)
8. [Session Management](#8-session-management)
9. [Folder Organization](#9-folder-organization)
10. [Shopify Theme Management](#10-shopify-theme-management)
11. [Common Mistakes to Avoid](#11-common-mistakes-to-avoid)
12. [Quick Reference Card](#12-quick-reference-card)

---

## 1. What is What?

| Tool | What it is | Analogy |
|------|-----------|---------|
| **GitHub** | Source code control — stores all our code in the cloud | Google Drive for code |
| **Repository (repo)** | A folder with files (TypeScript, markdown, etc.) | A project folder |
| **VS Code** | Text editor to view and edit files | A smart notepad |
| **Claude Code** | AI assistant inside VS Code that reads/writes code | A developer sitting next to you |
| **Claude Bot** (web/app) | General AI chat — NO access to your files | A consultant you can ask questions |
| **Git** | Version control system that tracks all changes | Track changes in Word |
| **Terminal** | Command line to run scripts and commands | The backstage control panel |

**Key difference:** Claude Code (in VS Code) can read your files, edit code, run commands, and interact with GitHub. Claude Bot (web/app) can only answer questions and generate text — it has no access to your code.

---

## 2. VS Code Setup (Critical)

### The #1 Rule

**ALWAYS open ONE specific project folder per VS Code window.**

```
WRONG:  Open ~/code/penguin/          (parent folder with everything)
RIGHT:  Open ~/code/penguin/penguin-quiz/   (one specific project)
```

**Why this matters:** Claude Code uses the open folder as its context. If you open the parent directory, Claude Code doesn't know which project you're working on and will get confused — it might edit the wrong files or mix up projects.

### How to open correctly

1. Open VS Code
2. `File > Open Folder`
3. Navigate to the **specific project folder** (e.g., `penguin-quiz`)
4. Click "Open"

If you need to work on another project, open a **new VS Code window** (`File > New Window`), don't add folders to the same window.

### Source Control Panel

The **third icon** on the left sidebar (branch icon) shows your Git changes:
- Modified files appear here
- You can see what changed before committing
- Click the refresh icon to update

---

## 3. Git Workflow

### First Time: Clone a Repository

```bash
# In VS Code terminal or regular terminal:
git clone https://github.com/JuanCarloDev/penguin-quiz.git
```

This downloads the entire project to your computer. Then open that folder in VS Code.

### Daily Workflow

```
1. Open project folder in VS Code
2. Pull latest changes:     git pull
3. Make your edits (or ask Claude Code)
4. Stage changes:           git add <files>
5. Commit with message:     git commit -m "feat: description of what changed"
6. Push to GitHub:          git push
7. Deploy happens automatically (GitHub Actions)
```

### Using Claude Code for Git

You don't need to memorize git commands. Ask Claude Code:

```
"Hey Claude, commit my changes with a proper message"
"Hey Claude, pull the latest code"
"Hey Claude, push my changes to GitHub"
"Hey Claude, what files did I change?"
```

---

## 4. Commit vs Deploy

This is the most important distinction to understand:

| Action | What it does | Where | Visible to users? |
|--------|-------------|-------|-------------------|
| **Save** (Ctrl+S) | Saves file on your machine | Your computer | No |
| **Commit** | Saves a snapshot in git history | Your computer | No |
| **Push** | Sends commits to GitHub | GitHub (cloud) | No (team can see) |
| **Deploy** | Puts code on production server | VPS server | YES — users see it |

- **Commit is safe** — do it often, it only saves history locally
- **Push** makes your changes visible to the team on GitHub
- **Deploy** makes changes live — for penguin-quiz, this happens **automatically** when you push to main (GitHub Actions)

### Monitoring Deploys

After pushing, check if the deploy succeeded:
- Go to the repo on GitHub > Actions tab
- Or ask Claude Code: `"Check if the deploy succeeded"`
- If it failed, Claude Code can read the error logs and fix the issue

---

## 5. Branch Strategy

### When to use what

| Situation | Approach |
|-----------|----------|
| Small fix, typo, text change | Commit directly to `main` |
| New feature, big change | Create a feature branch + Pull Request |
| Database changes, risky edits | Feature branch + Pull Request |
| Not sure | Use a branch (always safer) |

### Feature Branch Workflow

```bash
# 1. Create a branch
git checkout -b feature/my-feature-name

# 2. Work on your changes, commit as you go
git add .
git commit -m "feat: add new quiz question"

# 3. Push the branch
git push -u origin feature/my-feature-name

# 4. Open a Pull Request on GitHub (or ask Claude Code / @devops)
# 5. Get it reviewed
# 6. Merge into main
# 7. Deploy happens automatically
```

### Conflict Resolution

If someone else pushed changes while you were working:
1. `git pull` — download their changes
2. Git will try to merge automatically
3. If there's a conflict, Claude Code can help resolve it
4. Never force-push to main without asking Juan

---

## 6. Claude Code Best Practices

### Settings (must have)

When you open Claude Code, always set:
- **Model:** Opus (always, for best results)
- **Effort:** Max
- **Thinking:** On (Extended Thinking)

### Prompting Tips

**Be specific and give context.** The more Claude Code knows, the better it works.

```
BAD:   "Fix the bug"
GOOD:  "In the penguin-quiz project, the checkout button on step 8
        is not redirecting to Shopify. Check the CheckoutSummaryStep
        component and fix the redirect URL."
```

**Tell Claude Code where things are:**
```
"We have a repository called penguin-software and the environment
 variables are in the .env file. Use those credentials to access
 the Shopify API."
```

**Ask Claude Code to explain before doing:**
```
"Before making changes, tell me what files you found and what
 you plan to change."
```

### What Claude Code Can Do

- Read and edit any file in your project
- Run terminal commands (build, test, deploy)
- Search code across files
- Commit and push to GitHub
- Access APIs with tokens from your project
- Create documentation and summaries
- Fix errors by reading logs

### What Claude Code Cannot Do (well)

- Work across multiple project folders at once (open one per window)
- Remember previous sessions (save docs before closing!)
- Know your preferences without a CLAUDE.md file

---

## 7. Building Your CLAUDE.md

Every team member should create a personalized `CLAUDE.md` file. This file is loaded **every time** Claude Code starts, so it always knows who you are and how to help you.

### Where to create it

Two options:
- **Global** (applies to all projects): `~/.claude/CLAUDE.md`
- **Per-project** (applies to one project): `<project-folder>/CLAUDE.md`

### What to include

Ask Claude Code to help you write it:

```
"Hey Claude Code, help me create a CLAUDE.md file for myself.
 Here's my info:

 - My name is [name]
 - My role is [role] at Penguin
 - I mainly work on [projects]
 - My common tasks are [list tasks]
 - My experience with code is [beginner/intermediate/advanced]
 - I prefer communication in [language]
 - When I'm confused about git, explain it simply
 - Always ask me before pushing to main"
```

### Example CLAUDE.md for a non-developer

```markdown
# CLAUDE.md

## Who I Am
- Mohamed Amer, CEO at Penguin
- Non-developer, learning to use VS Code and Claude Code
- I mainly work on Shopify themes and SEO

## My Projects
- Penguin Wellness CBD (Shopify theme)
- Penguin Method (Shopify theme)
- SEO and Google Analytics setup

## How to Help Me
- Explain git operations simply before doing them
- Always confirm before pushing code or making destructive changes
- When I say "save this", create a document in the project's docs/ folder
- Before closing a session, remind me to save a summary

## My Preferences
- Language: English
- Always use Opus model with max effort
- Show me what files will change before editing
```

---

## 8. Session Management

### Starting a Session

1. Open the correct project folder in VS Code
2. Pull latest code: `git pull`
3. If continuing previous work, tell Claude Code:
   ```
   "I'm continuing the SEO project from last session.
    Read the summary at docs/sessions/2026-03-23-seo-progress.md"
   ```

### During a Session

- Commit frequently — small commits with clear messages
- If Claude Code seems confused, re-state your goal
- Ask `"git status"` to see what changed before committing

### Ending a Session (Critical!)

**Before closing, ALWAYS save your progress:**

```
"Hey Claude Code, save a summary of everything we did today.
 Include: what was done, what decisions were made, what files
 changed, and what's left to do. Save it in docs/sessions/
 with today's date."
```

This is your lifeline — next session, you (or anyone else) can pick up exactly where you left off.

---

## 9. Folder Organization

### Recommended Structure

```
~/code/penguin/
├── penguin-quiz/              # Quiz application (Next.js)
├── penguin-software/          # Master brain / central docs
├── shopify-themes/
│   ├── penguin-method/        # Method Shopify theme
│   └── penguin-wellness/      # Wellness CBD Shopify theme
├── penguin-ai-back/           # AI backend
├── penguin-ai-front/          # AI frontend
└── penguin-data/              # Non-code: PDFs, reports, research
    ├── seo/
    ├── analytics/
    └── certificates/
```

### Apps vs Data

| Type | What it is | Goes in GitHub? | Example |
|------|-----------|----------------|---------|
| **App** | Code that runs (websites, APIs) | YES | penguin-quiz, shopify themes |
| **Data** | Documents, PDFs, research | Maybe (as a repo) | SEO reports, certificates |

- **Apps** are cloned from GitHub and changes are pushed back
- **Data** folders can be stored in a dedicated GitHub repo for backup
- Keep them separate — don't mix PDFs inside app repositories

---

## 10. Shopify Theme Management

### Our Shopify Themes

| Theme | Store | GitHub Repo |
|-------|-------|-------------|
| Penguin Method | penguin-method.com | `shopify-theme-penguin-method` |
| Penguin Wellness CBD | penguin CBD store | `penguin-wellness-cbd` (needs setup) |

### Workflow: Edit Themes with Claude Code

1. Clone the theme repository
2. Open it in VS Code (only that folder!)
3. Ask Claude Code to make changes (e.g., "add a new section for lab reports")
4. Test locally if possible
5. Commit and push to GitHub
6. GitHub syncs automatically with Shopify

### Critical Warning

**Do NOT edit the same theme in both Shopify admin AND GitHub.**

Pick ONE workflow:
- **Option A (Recommended):** Edit locally in VS Code → push to GitHub → auto-sync to Shopify
- **Option B:** Edit in Shopify admin (but then pull changes to GitHub manually)

Mixing both creates conflicts that are very hard to resolve.

### If Your Theme Got Messed Up

1. Ask Claude Code to save a backup of your local modifications
2. Delete the local folder
3. Clone fresh from GitHub
4. Ask Claude Code to update the code with the live Shopify theme (using the Shopify API token)
5. Restore any modifications from the backup
6. Reconnect GitHub with Shopify

---

## 11. Common Mistakes to Avoid

| Mistake | Why it's bad | What to do instead |
|---------|-------------|-------------------|
| Opening parent folder in VS Code | Claude Code gets confused | Open one project folder per window |
| Not pulling before working | Your code is outdated, conflicts will happen | Always `git pull` first |
| Committing without a message | History becomes unreadable | Use descriptive messages: `feat:`, `fix:`, `docs:` |
| Editing Shopify admin + GitHub | Creates merge conflicts | Pick one workflow, stick with it |
| Not saving session summaries | Lose all context when closing | Always save a summary before closing |
| Large commits with many changes | Hard to review and debug | Small, frequent commits |
| Working on main for big features | Risk of breaking production | Use feature branches |
| Not checking deploy status | Broken deploys go unnoticed | Check GitHub Actions after push |
| Keeping VS Code open for weeks | Memory leak, stale state | Restart VS Code regularly |

---

## 12. Quick Reference Card

### Git Commands (or ask Claude Code)
```bash
git pull                    # Get latest code
git status                  # See what changed
git add <file>              # Stage a file for commit
git commit -m "message"     # Save changes locally
git push                    # Send to GitHub
git checkout -b branch-name # Create new branch
git checkout main           # Switch to main branch
```

### Claude Code Essentials
```
Model: Opus | Effort: Max | Thinking: On

Start session:  "I'm working on [project]. Goal: [what I want to do]"
Save progress:  "Save a summary of what we did in docs/sessions/"
Commit:         "Commit my changes with a proper message"
Deploy check:   "Check if the GitHub Actions deploy succeeded"
```

### Claude Code Usage
Check your usage at: https://claude.ai → Usage section
Each team member should monitor their usage to stay within plan limits.

### Key URLs
- GitHub org: https://github.com/JuanCarloDev
- Team setup repo: https://github.com/JuanCarloDev/claude-code-team-setup
- Penguin Quiz: https://github.com/JuanCarloDev/penguin-quiz (private)
