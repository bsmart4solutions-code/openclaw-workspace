# Learnings

Corrections, insights, and knowledge gaps captured during development.

**Categories**: correction | insight | knowledge_gap | best_practice

---

## 2026-04-17 技能清理

**Category**: insight

**Event**: 用户让我检查哪些 Skills 有问题

**Insight**: 
- 9个 Skills 缺少 SKILL.md 文件，无法被 OpenClaw 识别
- 分布在 ~/.openclaw/workspace/skills/ 下

**Action Taken**: 删除这 9 个无效 Skills

**Pattern-Key**: skill-audit-001

---

## 2026-04-17 Sub Agent 文件补充

**Category**: correction

**Event**: 检查 investment-assistant 缺少 TOOLS.md 和 HEARTBEAT.md

**Correction**: 
- 补充了 TOOLS.md (投资相关工具说明)
- 补充了 HEARTBEAT.md (空置，需时手动触发)

**Pattern-Key**: sub-agent-setup-001

---

## 2026-04-17 Pro Workflow 移植

**Category**: best_practice

**Event**: 用户想移植 Claude Code 的 pro-workflow 到 OpenClaw

**Insight**: 
- Pro Workflow 有 24 个 Skills，大部分有 SKILL.md 可以移植
- Hooks 系统不兼容，但 Skills 可以手动转换
- 成功移植了 4 个核心 Skills

**Action Taken**: 
- pro-workflow-learn-rule (68行)
- pro-workflow-context-engineering (134行)
- pro-workflow-wrap-up (50行)
- pro-workflow-cost-tracker (81行)

**Pattern-Key**: pro-workflow-transplant-001

## 2026-04-17 Skills 位置说明

**Category**: best_practice

**Event**: 用户问为什么 MiniMax Skills 没列出来

**Best Practice**: 
- OpenClaw 扫描多个 skills 目录
- ~/.openclaw/workspace/skills/ (用户安装的)
- ~/.openclaw/skills/minimax-skills/ (官方套件)
- ~/.openclaw/skills/taste-skill/ (主题包)

**Pattern-Key**: skills-location-001