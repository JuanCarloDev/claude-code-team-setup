# Claude Code Team Setup — Penguin

Welcome to the Penguin development team's Claude Code configuration. This package gives you the same AI-powered development workflow used across all Penguin projects.

## What is Claude Code?

Claude Code is Anthropic's CLI tool that lets you use Claude AI directly in your terminal or VS Code. Think of it as a senior developer sitting next to you who can read your code, write code, run commands, search the web, and use external tools — all through conversation.

## What's in this package?

| Folder | What it is | Count |
|--------|-----------|-------|
| `skills/` | Intelligent workflows that activate automatically or on demand | 40 |
| `commands/` | Slash commands you invoke with `/command-name` | 29 |
| `hooks/` | Scripts that run automatically on Claude Code events | 6 |
| `agents/` | Agent persona definitions (code reviewer) | 1 |
| `lib/` | Core utility scripts used by skills | 1 |

Plus **6 plugins** and **AIOX agent system** (installed separately — see below).

---

## Installation

### Prerequisites

1. **Claude Code** installed — see [claude.ai/claude-code](https://claude.ai/claude-code)
2. **Node.js 18+** installed
3. **Git** installed

### Step 1: Run the installer

```bash
chmod +x install.sh
./install.sh
```

This copies skills, commands, hooks, agents, and lib into `~/.claude/`.

### Step 2: Install plugins (inside Claude Code)

Open Claude Code in your terminal and run each of these:

```
/install-plugin superpowers@claude-plugins-official
/install-plugin context7@claude-plugins-official
/install-plugin claude-mem@thedotmack
/install-plugin code-review@claude-plugins-official
/install-plugin frontend-design@claude-plugins-official
/install-plugin ralph-loop@claude-plugins-official
```

**What each plugin does:**

| Plugin | Purpose |
|--------|---------|
| **superpowers** | The brain — orchestrates skills, workflows, brainstorming, planning, debugging |
| **context7** | Fetches live documentation for any library (React, Next.js, Prisma, etc.) |
| **claude-mem** | Persistent memory across sessions — remembers what you worked on before |
| **code-review** | Automated code review agent that checks your work against plans |
| **frontend-design** | Generates high-quality, polished frontend UI code |
| **ralph-loop** | Runs tasks on recurring intervals (e.g., check deploy every 5 min) |

### Step 3: Merge settings

Open `settings-reference.json` and merge the relevant sections into your `~/.claude/settings.json`. **Do NOT overwrite** your existing settings — merge manually.

Key things to add:
- `permissions.allow` — pre-approved tool permissions so Claude doesn't ask every time
- `permissions.deny` — safety rules (prevents destructive commands)
- `enabledPlugins` — activates the plugins you installed
- `extraKnownMarketplaces` — needed for the claude-mem plugin
- `hooks` — continuous learning observer (optional but recommended)
- `env.CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` — enables agent teams feature

### Step 4: Install AIOX Agent System (for Penguin projects)

The AIOX agent system lives **inside each project repo** (not in `~/.claude/`). When you clone a Penguin repo, it's already there in `.claude/commands/AIOX/agents/`.

**What is AIOX?**
AIOX (AI-Orchestrated System) is our structured development framework. It provides specialized AI agents that each handle a specific role:

| Agent | How to activate | Role |
|-------|----------------|------|
| `@dev` (Dex) | Type `@dev` in Claude Code | Writes code, implements features, fixes bugs |
| `@qa` (Quinn) | Type `@qa` | Reviews code quality, runs test gates |
| `@architect` (Aria) | Type `@architect` | System design, technical decisions |
| `@pm` (Morgan) | Type `@pm` | Product requirements, epic management |
| `@po` (Pax) | Type `@po` | Story validation, backlog prioritization |
| `@sm` (River) | Type `@sm` | Creates stories from PRDs, sprint planning |
| `@devops` (Gage) | Type `@devops` | Git push, PR creation, CI/CD (EXCLUSIVE) |
| `@analyst` (Alex) | Type `@analyst` | Research, brainstorming, analysis |
| `@data-engineer` (Dara) | Type `@data-engineer` | Database design, migrations, queries |
| `@ux-design-expert` (Uma) | Type `@ux` | UI/UX design |
| `@aiox-master` (Orion) | Type `@aiox-master` | Framework orchestrator |

**The standard development workflow:**
```
@sm creates story → @po validates → @dev implements → @qa reviews → @devops pushes
```

**Where AIOX lives in a project:**
```
your-project/
└── .claude/
    ├── commands/
    │   └── AIOX/
    │       └── agents/        ← Agent definitions (13 files)
    ├── rules/                 ← Auto-loaded rules (10 files)
    ├── hooks/                 ← Project-specific hooks
    └── settings.json          ← Project settings
```

**You don't need to install AIOX separately** — it comes with each Penguin repo. Just clone the repo and the agents are available.

---

## How to Use

### Skills (automatic)
Most skills activate automatically. For example:
- Start implementing a feature → **brainstorming** skill activates first
- Hit a bug → **systematic-debugging** skill guides you through root cause analysis
- About to commit → **verification-before-completion** ensures you ran tests

### Commands (manual)
Type `/command-name` in Claude Code:
- `/plan` — Create an implementation plan before coding
- `/commit` — Smart commit with conventional commit format
- `/code-review` — Review your changes
- `/create-pr` — Create a pull request

### Plugins (always active)
Plugins work in the background. Examples:
- Ask "how does useEffect work in React 19?" → **context7** fetches live docs
- Say "remember this for next time" → **claude-mem** stores it
- Complete a feature → **code-review** plugin can review against plan

### AIOX Agents (manual)
In any Penguin project, type `@agent-name`:
- `@dev` → "I need to implement the user dashboard"
- `@qa` → "Review the code I just wrote"
- `@devops` → "Push this to main and create a PR"

---

## Folder Structure After Install

```
~/.claude/
├── settings.json          ← Your merged settings
├── skills/                ← 40 skill folders (from this package)
│   ├── brainstorming/
│   ├── systematic-debugging/
│   ├── tdd-workflow/
│   └── ... (37 more)
├── commands/              ← 29 command files (from this package)
│   ├── commit.md
│   ├── plan.md
│   └── ... (27 more)
├── hooks/                 ← 6 hook scripts (from this package)
├── agents/                ← 1 agent definition (from this package)
├── lib/                   ← Core utilities (from this package)
└── plugins/               ← 6 plugins (installed via CLI)
```

---

## Troubleshooting

**"Skill not found"** — Make sure you ran `install.sh` and the skill folder exists in `~/.claude/skills/`

**"Plugin not installed"** — Run `/install-plugin <name>` inside Claude Code

**"Permission denied"** — Add the tool to `permissions.allow` in `~/.claude/settings.json`

**"AIOX agents not available"** — Make sure the project has `.claude/commands/AIOX/agents/` directory. This comes from the repo, not from this package.

**"Hooks not running"** — Check that `hooks` section is in your `settings.json` and scripts are executable (`chmod +x`)

---

## Full Catalog

See `SKILLS-CATALOG.md` for detailed descriptions of every skill, command, plugin, and tool.
