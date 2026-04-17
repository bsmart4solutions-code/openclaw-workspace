---
name: pro-workflow-replay-learnings
description: 在开始工作前显示与当前任务相关的过往学习。搜索纠正历史、回忆过去错误、应用先前模式。触发：开始任务、说 "我知道什么关于"、"之前的错误"、"学到的教训"或"提醒我"。
---

# Replay Learnings (重放学习)

像你编码会话的肌肉记忆。在开始工作前找到并显示相关的学习。

## 触发

开始新任务时说 "what do I know about"、"before I start"、"replay"，或 "remind me about"。

## 工作流

1. 从任务描述提取关键词 (如 "auth refactor" → `auth`, `middleware`, `refactor`)
2. 在学习/记忆中搜索匹配模式：
   ```bash
   grep -i "auth\|middleware" .claude/LEARNED.md 2>/dev/null
   grep -i "auth\|middleware" .claude/learning-log.md 2>/dev/null
   grep -A2 "\[LEARN\]" CLAUDE.md | grep -i "auth\|middleware"
   ```
3. 检查类似工作的会话历史 — 纠正率是多少？
4. 显示按相关性排名的最高学习
5. 如果没找到学习，建议先启动 scout agent 探索

## 输出

```
重放简报: <任务>
=======================

过往学习 (按相关性排序):
  1. [Testing] 在 auth 测试中始终 mock 外部 API (应用 8次)
     错误: 在测试中调用 live API，导致不稳定失败
  2. [Navigation] Auth 中间件在 src/middleware/ 不是 src/auth/ (应用 5次)
  3. [Quality] 在 auth 状态变化周围添加错误边界 (应用 3次)

类似工作的会话历史:
  - 2026-02-01: auth refactor — 23次改动, 2次纠正 (8.7% 率)
  - 2026-01-28: auth middleware — 15次改动, 4次纠正 (26.7% 率)
    ^ 更高纠正率 — 开始前审查模式

建议方法:
  - Mock 外部 API (学习 #1)
  - 先检查 src/middleware/ 的 auth 代码 (学习 #2)
```

## 原则

- 按相关性排序，不是按时间
- 包含原始错误上下文让学习可操作
- 标记高纠正率的会话需要额外注意
- 如果没有匹配的学习，明确说明而不是强行给无关结果