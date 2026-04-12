#!/bin/bash
# Auto Backup - 每小时备份重要文件

DATE=$(date +%Y%m%d-%H%M)
BACKUP_DIR="$HOME/.openclaw-backups"

mkdir -p "$BACKUP_DIR"

# 备份核心文件
tar -czf "$BACKUP_DIR/backup-$DATE.tar.gz" \
  ~/.openclaw/workspace/MEMORY.md \
  ~/.openclaw/workspace/AGENTS.md \
  ~/.openclaw/workspace/SOUL.md \
  ~/.openclaw/workspace/USER.md \
  ~/.openclaw/workspace/config/ \
  ~/.openclaw/workspace/skills/ \
  ~/.agents/skills/ \
  2>/dev/null

# 清理7天前的备份
find "$BACKUP_DIR" -name "backup-*.tar.gz" -mtime +7 -delete 2>/dev/null

echo "$(date): Backup completed: backup-$DATE.tar.gz"
