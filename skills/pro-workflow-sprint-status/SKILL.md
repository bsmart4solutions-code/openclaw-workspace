---
name: pro-workflow-sprint-status
description: 追踪并行工作会话，防止多实例混淆。每个主要步骤以状态行结束。每个问题重述项目、分支和任务。
---

# Sprint Status (冲刺状态)

当并行运行多个 AI 会话时，混淆是敌人。这个技能确保每个会话标识自己，每个步骤报告其状态。

## 会话标识

每个涉及决策、规划或重要操作的响应以方向开始：

```text
会话: my-app | 分支: feat/auth | 任务: 添加 JWT 刷新令牌
```

这占一行。几乎不花成本。防止用户把反馈应用到错误的会话。

### 检测并行会话

检查同级 AI 进程：

```bash
pgrep -af "claude" | grep -v "$$" | head -5
```

或检查活跃 worktrees：

```bash
git worktree list 2>/dev/null
```

或寻找会话标记：

```bash
ls $TMPDIR/pro-workflow/sessions/ 2>/dev/null | tail -5
```

如果检测到多个会话，始终包含会话标识头。如果只有一个会话运行，在任务边界和展示选项前包含。

## 状态行

每个主要步骤恰好以一行状态结束。无歧义。

### STATUS: COMPLETE

当前步骤的所有工作完成。可以提交、合并或转到下一个任务。

```text
STATUS: COMPLETE
  改动: src/auth/refresh.ts, src/auth/refresh.test.ts
  测试: 14 通过, 0 失败
  准备好提交。
```

### STATUS: COMPLETE_WITH_NOTES

完成，但标记用户应该知道的事情。

### STATUS: IN_PROGRESS

工作正在进行。报告当前状态和进度。

### STATUS: BLOCKED

被阻碍。需要用户输入或外部依赖。

### STATUS: NEEDS_REVIEW

需要用户审查或决策。

## 原则

- 始终在并行会话中标识自己
- 每行一个状态，不要混杂
- 在任务边界更新状态
- 状态要具体 — "完成了什么" 而非 "正在做"