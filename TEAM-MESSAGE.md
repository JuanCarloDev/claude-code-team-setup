# Message for the Team

Copy and send this to Mohamed, Matheus, and Helaine:

---

Hey team!

I've prepared a complete Claude Code setup package for everyone. This gives you the same AI-powered development tools I use — 40 skills, 29 commands, 6 plugins, and the full AIOX agent system.

**Repository:** https://github.com/JuanCarloDev/claude-code-team-setup

## What's Inside

- **40 Skills** — Intelligent workflows that activate automatically (brainstorming, debugging, code review, TDD, content creation, and more)
- **29 Commands** — Slash commands like `/commit`, `/plan`, `/code-review`, `/create-pr`
- **6 Plugins** — Superpowers (skill orchestration), Context7 (live library docs), Claude-Mem (memory across sessions), Code Review, Frontend Design, Ralph Loop
- **6 Hooks** — Auto-triggered scripts (TypeScript checking, code formatting, continuous learning)
- **AIOX Agent System** — 13 specialized AI agents (`@dev`, `@qa`, `@architect`, `@devops`, etc.)
- **Onboarding Guide** — Everything you need to know about VS Code, Git, GitHub, and Claude Code
- **CLAUDE.md Template** — Personalize Claude Code for yourself

## How to Install

Open Claude Code in VS Code and paste this prompt:

```
Hey Claude Code, I need you to set up the Penguin team Claude Code toolkit on my machine. Here's what to do:

1. Clone this repository: https://github.com/JuanCarloDev/claude-code-team-setup.git
   Clone it into a temporary location like ~/Downloads/claude-code-team-setup

2. Run the install script:
   cd ~/Downloads/claude-code-team-setup && chmod +x install.sh && ./install.sh

3. After the install script finishes, help me merge the settings from
   settings-reference.json into my ~/.claude/settings.json
   DO NOT overwrite my existing settings — merge the new sections in.

4. Then help me create a personalized CLAUDE.md file at ~/.claude/CLAUDE.md
   using the template in CLAUDE-MD-TEMPLATE.md. Ask me about my role,
   projects, and preferences so you can fill it in for me.

5. After everything is set up, we can delete the cloned folder from Downloads.
```

After Claude Code does the setup, you'll also need to install the plugins manually. Inside Claude Code, run each of these one at a time:

```
/install-plugin superpowers@claude-plugins-official
/install-plugin context7@claude-plugins-official
/install-plugin claude-mem@thedotmack
/install-plugin code-review@claude-plugins-official
/install-plugin frontend-design@claude-plugins-official
/install-plugin ralph-loop@claude-plugins-official
```

## Important Reminders

1. **Always open ONE project folder per VS Code window** — never the parent folder
2. **Always use Opus model, Max effort, Extended Thinking**
3. **Save a session summary before closing** — ask Claude Code to write it for you
4. **Read the ONBOARDING.md** in the repo for the full guide on Git, GitHub, and Claude Code

If you have any questions or get stuck, let me know!

— Juan
