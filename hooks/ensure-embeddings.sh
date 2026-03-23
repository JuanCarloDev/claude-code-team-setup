#!/bin/bash
# Hook: PreToolUse for semantic_search / find_related
# Ensures the SecondBrain embeddings server is running on-demand.
# Only starts when needed, stays alive for the session.

EMBEDDINGS_DIR="/Users/juan/code/juan/secondBrain/mcp/embeddings"

# Quick health check — if already running, exit immediately (fast path)
if curl -s --max-time 1 http://127.0.0.1:3101/health > /dev/null 2>&1; then
    exit 0
fi

# Not running — start it
export SECONDBRAIN_PATH="/Users/juan/code/juan/secondBrain"
nohup "$EMBEDDINGS_DIR/venv/bin/python3" "$EMBEDDINGS_DIR/server.py" > "$EMBEDDINGS_DIR/embeddings.log" 2>&1 &
echo $! > "$EMBEDDINGS_DIR/embeddings.pid"

# Wait for ready (model load takes ~5-10s)
for i in $(seq 1 30); do
    if curl -s --max-time 1 http://127.0.0.1:3101/health > /dev/null 2>&1; then
        exit 0
    fi
    sleep 1
done

echo "Warning: Embedding server failed to start within 30s" >&2
exit 1
