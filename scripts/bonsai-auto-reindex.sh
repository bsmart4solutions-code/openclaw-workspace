#!/bin/bash
# Bonsai Memory Auto Reindex - 每6小时自动执行

cd ~/.openclaw/workspace
bash ~/.agents/skills/bonsai-memory/scripts/bonsai-reindex.sh 2>&1 >> ~/.openclaw/logs/bonsai-reindex.log
echo "$(date): Bonsai reindex completed" >> ~/.openclaw/logs/bonsai-reindex.log
