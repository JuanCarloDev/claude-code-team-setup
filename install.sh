#!/bin/bash
# Claude Code Team Setup — Penguin
# Run: chmod +x install.sh && ./install.sh

set -e

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "  Claude Code Team Setup — Penguin"
echo "  ======================================"
echo ""

# Check if Claude Code directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "  Creating ~/.claude/ directory..."
    mkdir -p "$CLAUDE_DIR"
fi

# 1. Create directories
echo "  [1/5] Creating directories..."
mkdir -p "$CLAUDE_DIR/skills"
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/hooks"
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/lib"

# 2. Copy skills
if [ -d "$SCRIPT_DIR/skills" ]; then
    SKILL_COUNT=$(ls -d "$SCRIPT_DIR/skills"/*/ 2>/dev/null | wc -l | tr -d ' ')
    echo "  [2/5] Copying $SKILL_COUNT skills..."
    cp -r "$SCRIPT_DIR/skills/"* "$CLAUDE_DIR/skills/"
    echo "        Done"
else
    echo "  [2/5] No skills/ folder found — skipping"
fi

# 3. Copy commands
if [ -d "$SCRIPT_DIR/commands" ]; then
    CMD_COUNT=$(ls "$SCRIPT_DIR/commands/"*.md 2>/dev/null | wc -l | tr -d ' ')
    echo "  [3/5] Copying $CMD_COUNT commands..."
    cp -r "$SCRIPT_DIR/commands/"* "$CLAUDE_DIR/commands/"
    echo "        Done"
else
    echo "  [3/5] No commands/ folder found — skipping"
fi

# 4. Copy hooks
if [ -d "$SCRIPT_DIR/hooks" ]; then
    echo "  [4/5] Copying hooks..."
    cp -r "$SCRIPT_DIR/hooks/"* "$CLAUDE_DIR/hooks/"
    chmod +x "$CLAUDE_DIR/hooks/"*.sh 2>/dev/null || true
    echo "        Done"
else
    echo "  [4/5] No hooks/ folder found — skipping"
fi

# 5. Copy agents + lib
echo "  [5/5] Copying agents and lib..."
if [ -d "$SCRIPT_DIR/agents" ]; then
    cp -r "$SCRIPT_DIR/agents/"* "$CLAUDE_DIR/agents/"
fi
if [ -d "$SCRIPT_DIR/lib" ]; then
    cp -r "$SCRIPT_DIR/lib/"* "$CLAUDE_DIR/lib/"
fi
echo "        Done"

echo ""
echo "  ======================================"
echo "  Files copied successfully!"
echo ""
echo "  NEXT STEPS (manual):"
echo ""
echo "  1. MERGE SETTINGS"
echo "     Compare settings-reference.json with your ~/.claude/settings.json"
echo "     DO NOT overwrite — merge the relevant sections manually"
echo ""
echo "  2. INSTALL PLUGINS (run inside Claude Code CLI):"
echo ""
echo "     /install-plugin superpowers@claude-plugins-official"
echo "     /install-plugin context7@claude-plugins-official"
echo "     /install-plugin claude-mem@thedotmack"
echo "     /install-plugin code-review@claude-plugins-official"
echo "     /install-plugin frontend-design@claude-plugins-official"
echo "     /install-plugin ralph-loop@claude-plugins-official"
echo ""
echo "  3. AIOX AGENTS (no install needed)"
echo "     AIOX agents live inside each Penguin project repo."
echo "     Just clone the repo — agents are in .claude/commands/AIOX/agents/"
echo "     Activate with: @dev, @qa, @architect, @devops, etc."
echo ""
echo "  See README.md and SKILLS-CATALOG.md for full documentation."
echo ""
