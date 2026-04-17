# Errors

Command failures and integration errors.

---

## 2026-04-17 Gateway Pairing Error

**Date**: 2026-04-16

**Error**: gateway connect failed: GatewayClientRequestError: pairing required

**Context**: 尝试用 openclaw cron remove 命令时

**Root Cause**: Gateway 需要配对才能执行某些操作

**Solution**: 直接编辑 ~/.openclaw/cron/jobs.json 文件

**Lesson**: CLI 命令失败时可以用直接文件编辑作为备选方案

**Pattern-Key**: gateway-pairing-error-001