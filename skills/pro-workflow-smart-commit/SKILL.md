---
name: pro-workflow-smart-commit
description: 运行质量门、审查暂存改动、创建规范的 conventional commit。触发：说 "commit"、"git commit"、"保存改动"或准备好提交时。
---

# Smart Commit (智能提交)

## 触发

说 "commit"、"save changes" 或准备好提交改动时。

## 工作流

1. 检查当前状态，识别要提交什么
2. 运行质量门 (lint, typecheck, 改动文件的测试)
3. 扫描暂存改动的质量问题
4. 从 diff 起草 conventional commit 信息
5. 暂存特定文件，创建提交
6. 提示这次改动有什么学习

## 命令

```bash
git status
git diff --stat

npm run lint 2>&1 | tail -5
npm run typecheck 2>&1 | tail -5
npm test -- --changed --passWithNoTests 2>&1 | tail -10

git add <specific files>
git commit -m "<type>(<scope>): <summary>"
```

## 代码审查扫描

提交前，检查暂存改动中 **生产代码**（非测试文件）是否有：
- `console.log` / `debugger` 语句（测试文件中可忽略）
- 无票据引用的 TODO/FIXME/HACK 注释（如 `TODO(JIRA-123)` 就可以）
- 硬编码的密钥或 API keys
- 剩余的测试代码

继续前标记任何问题。

## 提交信息格式

```
<type>(<scope>): <简短总结>

<正文 - 改了什么以及为什么>
```

**类型:** feat, fix, refactor, test, docs, chore, perf, ci, style

## 原则

- 除非用户明确说，否则不要跳过质量门
- 按名称暂存特定文件。永远不要 `git add -A` 或 `git add .`
- 总结不超过 72 字符。正文解释 *为什么*，不是 *是什么*
- 不要 generic 消息 ("fix bug", "update code")
- 适用时引用 issue 编号

## 输出

- 质量门结果 (通过/失败)
- 暂存改动中发现的问题
- 建议的提交信息
- 提交后的 commit hash
- 提示：有什么学习要捕捉？

## 审查抑制

这些在预提交扫描时不标记。它们增加噪音而不抓真 bug：
- 阈值、配置值或功能标志改动（限制、超时、重试次数）
- 不改变运行时行为的导入重排序
- 仅空白或格式改动
- 测试文件中添加或删除 `console.log`
- TODO/FIXME 注释（在 issue 追踪器中单独跟踪）
- 不改变行为的变量或参数重命名