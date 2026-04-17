---
name: pro-workflow-wrap-up
description: 结束会话仪式 - 审计改动、运行质量检查、捕捉学习、生成会话总结。触发：说 "wrap up"、"今天完了"、"结束编码" 或结束编码会话时。
---

# Wrap-Up 仪式

有意地结束你的编码会话。

## 触发

结束会话时说 "wrap up"、"done for now"，或关闭编辑器前。

## 工作流

1. **改动审计** — 改了哪些文件？有什么未提交的？代码里有没有 TODO？
2. **质量检查** — 运行 lint、typecheck、测试。全通过了吗？有警告吗？
3. **学习捕捉** — 犯了什么错？什么模式效果好？格式化为 `[LEARN] 分类: 规则`
4. **下次会话上下文** — 下个逻辑任务是什么？有什么阻碍？需要保留什么上下文？
5. **总结** — 一段话：完成了什么、当前状态、下一步是什么。

## 命令

```bash
git status
git diff --stat

npm run lint 2>&1 | head -20
npm run typecheck 2>&1 | head -20
npm test -- --changed --passWithNoTests
```

## 学习分类

Navigation, Editing, Testing, Git, Quality, Context, Architecture, Performance

## 原则

- 不要跳过任何检查步骤
- 如果测试失败，标记再结束会话
- 如果有未提交的改动，问是要提交还是 stash

## 输出

- 改动文件列表，高亮未提交的
- 质量门结果
- 捕捉的学习（如果有）
- 一段话会话总结
- 下次会话恢复上下文

完成检查后问："准备好结束会话了吗？"