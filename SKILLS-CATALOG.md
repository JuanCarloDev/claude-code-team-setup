# Claude Code — Complete Skills & Tools Catalog

Everything available in the Penguin team Claude Code setup.

---

## 1. SKILLS (40 total)

Skills are intelligent workflows that live in `~/.claude/skills/`. Most activate automatically when relevant — you don't need to invoke them manually.

### Development & Code Quality (17 skills)

| Skill | When it activates | What it does |
|-------|-------------------|--------------|
| **brainstorming** | Before any feature/creative work | Explores intent, requirements & design BEFORE you write code |
| **writing-plans** | Multi-step task with requirements | Creates step-by-step implementation plans |
| **executing-plans** | You have a written plan | Executes plans with review checkpoints between phases |
| **subagent-driven-development** | Plan has independent tasks | Parallelizes implementation using multiple sub-agents |
| **tdd-workflow** | Writing any feature or fix | Enforces test-driven development (RED → GREEN → REFACTOR) |
| **systematic-debugging** | Any bug or test failure | Root cause tracing — no guessing, follows evidence |
| **verification-before-completion** | Before claiming work is done | Forces you to run tests/build and show evidence before committing |
| **requesting-code-review** | After completing a feature | Validates your work against the original plan |
| **receiving-code-review** | When you get review feedback | Ensures technical rigor when responding to feedback |
| **finishing-a-development-branch** | Tests pass, work is done | Guides you through merge/PR/cleanup decisions |
| **finding-duplicate-functions** | Auditing a codebase | Detects functions that do the same thing with different names |
| **search-first** | Before writing custom code | Searches for existing libraries/tools before reinventing |
| **using-git-worktrees** | Feature needing isolation | Creates isolated git worktrees for parallel work |
| **using-tmux-for-interactive-commands** | Need vim, REPL, etc. | tmux-based approach for interactive terminal tools |
| **strategic-compact** | Long sessions | Suggests context compaction at logical intervals |
| **eval-harness** | Evaluating session quality | Formal evaluation framework for Claude Code sessions |
| **continuous-learning-v2** | Always (via hooks) | Observes your sessions, learns patterns, evolves into new skills |

### Architecture & Patterns (6 skills)

| Skill | When it activates | What it does |
|-------|-------------------|--------------|
| **frontend-patterns** | React/Next.js work | Best practices for React, Next.js, state management, performance |
| **api-design** | Building REST APIs | Resource naming, status codes, pagination, error responses |
| **database-migrations** | Schema changes | Migration best practices for PostgreSQL, MySQL, Prisma, Drizzle |
| **deployment-patterns** | CI/CD, Docker, production | Deployment workflows, health checks, rollback strategies |
| **security-review** | Auth, secrets, APIs, payments | Comprehensive security checklist (OWASP top 10) |
| **react-portal-modals** | Modals/drawers in dashboards | Prevents CSS stacking context issues with portals |

### Content & Marketing (8 skills)

| Skill | When it activates | What it does |
|-------|-------------------|--------------|
| **copywriter** | Writing copy, headlines, CTAs | Professional copywriter using AIDA, PAS, BAB frameworks |
| **content-researcher** | Market research, trends | Deep research for digital content creation |
| **content-planner** | Editorial calendar | Plans content pipelines and editorial strategy |
| **post-writer** | Writing social media posts | End-to-end: research → copy → structure → publish-ready |
| **carousel-designer** | Instagram/social carousels | HTML/CSS slide design with design system principles |
| **extract-instagram-carousel** | IG post URL → text | Extracts text from carousel images without screenshots |
| **penguin-blog-publisher** | Penguin blog articles | AI generation → image creation → Shopify draft publishing |
| **brand-guidelines** | Brand consistency | Color systems, typography, logo rules, tone matrix |

### Media & Design (3 skills)

| Skill | When it activates | What it does |
|-------|-------------------|--------------|
| **generate-image** | Need images/illustrations | Uses Google Gemini 2.5 Flash for image generation |
| **logo-designer** | Logo design requests | SVG-based logo design and iteration |
| **transcribe-video** | Video URL to text | Downloads video, transcribes with Whisper, translates |

### Team & Communication (2 skills)

| Skill | When it activates | What it does |
|-------|-------------------|--------------|
| **notify-team** | After deploys/major changes | Generates team notification with change summary and links |
| **slack-messaging** | Slack interactions | Send/read Slack messages from CLI |

### Framework & Meta (4 skills)

| Skill | When it activates | What it does |
|-------|-------------------|--------------|
| **using-superpowers** | Every conversation start | Establishes how skills work — the "brain" of the system |
| **writing-skills** | Creating/editing skills | Guides skill authoring with best practices |
| **mcp-cli** | Need external tools on-demand | Discovers MCP tools without pre-loading everything |
| **update-agents-guide** | AGENTS.md needs refresh | Updates the agent guide documentation |

---

## 2. COMMANDS (29 total)

Commands are invoked manually with `/command-name` in Claude Code.

### Development

| Command | What it does |
|---------|--------------|
| `/plan` | Analyze requirements, assess risks, create step-by-step implementation plan |
| `/commit` | Smart commit — analyzes changes, writes conventional commit message |
| `/build-fix` | Build the project and auto-fix any errors |
| `/act` | RED-GREEN-REFACTOR TDD cycle |
| `/code-review` | Review current code changes for quality |
| `/pr-review` | Review a pull request |
| `/create-pr` | Create a pull request via GitHub CLI |
| `/create-pull-request` | Detailed PR creation workflow |
| `/fix-github-issue` | Analyze and fix a specific GitHub issue |
| `/create-hook` | Create Claude Code hooks (event-triggered scripts) |
| `/create-worktrees` | Git worktree management for parallel development |
| `/update-branch-name` | Rename current git branch |
| `/clean` | Fix all linting issues (black, isort, flake8, mypy) |
| `/optimize` | Analyze code performance and suggest optimizations |
| `/todo` | Manage project todos in todos.md |
| `/husky` | Git hooks manager |
| `/testing_plan_integration` | Create integration testing plan |

### Documentation & Planning

| Command | What it does |
|---------|--------------|
| `/create-prd` | Create Product Requirements Document |
| `/create-prp` | Create Product Requirements Proposal |
| `/create-jtbd` | Create Jobs to be Done document |
| `/update-docs` | Update implementation documentation |
| `/add-to-changelog` | Update CHANGELOG.md with recent changes |
| `/release` | Version bump + changelog update |
| `/initref` | Build implementation reference for a project |
| `/load-llms-txt` | Load external data context |

### Workflow

| Command | What it does |
|---------|--------------|
| `/brainstorm` | Creative brainstorming session |
| `/write-plan` | Write implementation plan (alias) |
| `/execute-plan` | Execute a written plan (alias) |
| `/context-prime` | Prime context with full project structure |

---

## 3. PLUGINS (6 — install via Claude Code CLI)

Plugins add MCP-powered capabilities. Install with `/install-plugin <name>`.

| Plugin | Install command | What it provides |
|--------|----------------|-----------------|
| **superpowers** | `/install-plugin superpowers@claude-plugins-official` | Skill orchestration, brainstorming, planning, code review, debugging, parallel agents, git worktrees |
| **context7** | `/install-plugin context7@claude-plugins-official` | Live library documentation — ask about any npm package and get current docs |
| **claude-mem** | `/install-plugin claude-mem@thedotmack` | Persistent cross-session memory — remembers code decisions, patterns, past work |
| **code-review** | `/install-plugin code-review@claude-plugins-official` | Automated code review agent that validates work against plans |
| **frontend-design** | `/install-plugin frontend-design@claude-plugins-official` | Generates high-quality, creative frontend UI (not generic AI code) |
| **ralph-loop** | `/install-plugin ralph-loop@claude-plugins-official` | Runs tasks on intervals (e.g., `/loop 5m /check-deploy`) |

**Note:** For `claude-mem`, you also need this in your `settings.json`:
```json
"extraKnownMarketplaces": {
  "thedotmack": {
    "source": { "source": "github", "repo": "thedotmack/claude-mem" }
  }
}
```

---

## 4. MCP SERVERS (external tools)

MCP servers connect Claude Code to external systems. These require separate setup.

### Browser / Puppeteer (7 tools)
**Purpose:** Web automation, testing, screenshots
**Setup:** Requires puppeteer MCP server configured in Claude Desktop or via `@anthropic/mcp-puppeteer`

| Tool | What it does |
|------|--------------|
| `puppeteer_navigate` | Open a URL in the browser |
| `puppeteer_screenshot` | Take a screenshot of the page |
| `puppeteer_click` | Click an element |
| `puppeteer_fill` | Fill a form field |
| `puppeteer_select` | Select a dropdown option |
| `puppeteer_hover` | Hover over an element |
| `puppeteer_evaluate` | Execute JavaScript in the browser console |

### Penguin Hub (3 tools)
**Purpose:** Penguin-specific action management
**Setup:** Configured per-project (comes with Penguin repos)

| Tool | What it does |
|------|--------------|
| `penguin_actions_create` | Create Penguin actions |
| `penguin_actions_list` | List Penguin actions |
| `penguin_actions_update` | Update Penguin actions |

---

## 5. HOOKS (6 global)

Hooks run automatically on Claude Code events. Installed via `install.sh`.

| Hook File | Trigger | What it does |
|-----------|---------|--------------|
| `observe.sh` | Every tool use (pre & post) | Continuous learning — watches what you do and learns patterns |
| `ensure-embeddings.sh` | Before semantic search | Ensures embeddings are generated before searching |
| `post-edit-typecheck.js` | After file edits | Runs TypeScript type checking automatically |
| `post-edit-console-warn.js` | After file edits | Warns if you left `console.log` in code |
| `post-edit-format.js` | After file edits | Auto-formats code after changes |
| `session-start.js` | Session start | Initializes session context |

---

## 6. AIOX AGENT SYSTEM (per-project, 13 agents)

**Location:** `.claude/commands/AIOX/agents/` inside each Penguin project repo.
**Not installed globally** — cloned with the project.

### How to use

In any Penguin project, type `@agent-name` to activate an agent:

```
@dev       → Full-stack developer (Dex) — implements features, fixes bugs
@qa        → Quality engineer (Quinn) — code review, test gates
@architect → Solution architect (Aria) — system design, tech decisions
@pm        → Product manager (Morgan) — PRDs, epic orchestration
@po        → Product owner (Pax) — story validation, backlog
@sm        → Scrum master (River) — story creation, sprint planning
@devops    → DevOps engineer (Gage) — git push, PRs, CI/CD
@analyst   → Business analyst (Alex) — research, brainstorming
@data-engineer → Database specialist (Dara) — schema design, migrations
@ux        → UX designer (Uma) — UI/UX design
@aiox-master → Orchestrator (Orion) — any task, framework governance
```

### Agent commands

All agents respond to commands with `*` prefix:
- `*help` — Show available commands for the active agent
- `*develop {story}` — (`@dev`) Implement a story
- `*draft` — (`@sm`) Create a new story
- `*review {story}` — (`@qa`) Review implementation
- `*push` — (`@devops`) Push code and create PR

### Standard workflow

```
@sm *draft          → Creates story from requirements
@po *validate       → Validates story (10-point checklist)
@dev *develop       → Implements the story
@qa *gate           → Reviews code quality (7 checks)
@devops *push       → Pushes to remote, creates PR
```

### Important rules

- **Only `@devops` can push code or create PRs** — other agents are blocked
- **`@dev` can commit locally** but cannot push
- **Each agent has boundaries** — respect their domain
- **Switch agents in new conversations** for cleanest context

---

## 7. PROJECT RULES (per-project, 10 files)

Rules in `.claude/rules/` inside each project are loaded automatically.

| Rule | What it enforces |
|------|-----------------|
| `agent-authority.md` | Who can do what (DevOps exclusive for push/PR) |
| `agent-handoff.md` | Context compaction when switching agents |
| `agent-memory-imports.md` | Agent memory lifecycle |
| `coderabbit-integration.md` | Automated code review integration |
| `ids-principles.md` | Incremental Development System |
| `mcp-usage.md` | MCP server governance and tool priority |
| `story-lifecycle.md` | Story status transitions and quality gates |
| `tool-examples.md` | Concrete examples for common tools |
| `tool-response-filtering.md` | Response filtering |
| `workflow-execution.md` | 4 workflows: Story Dev Cycle, QA Loop, Spec Pipeline, Brownfield |

---

## Quick Reference Card

### Most-used skills (automatic)
```
brainstorming              → activates before feature work
systematic-debugging       → activates on bugs/failures
verification-before-completion → activates before commits
tdd-workflow              → activates when implementing
```

### Most-used commands (manual)
```
/plan                     → plan before coding
/commit                   → smart commit
/code-review              → review changes
/create-pr                → create pull request
/build-fix                → build and auto-fix
```

### Most-used agents (in Penguin projects)
```
@dev                      → implement features
@qa                       → review code quality
@devops                   → push code, create PRs
@sm                       → create stories
```

---

## Stats

| Category | Count |
|----------|-------|
| Skills | 40 |
| Commands | 29 |
| Plugins | 6 |
| Hooks | 6 |
| AIOX Agents | 13 (per-project) |
| Project Rules | 10 (per-project) |
| **Total capabilities** | **~104** |
