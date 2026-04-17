---
name: pro-workflow-deslop
description: 从当前分支 diff 中移除 AI 生成的代码垃圾、不必要的注释和过度工程。清理样板代码、简化抽象、剥离防御代码。用于清理代码、简化、移除样板或提交前。
---

# Remove AI Code Slop (移除代码垃圾)

检查与 main 的 diff，移除分支中引入的 AI 生成的垃圾。

## 触发

完成改动后、提交前，或觉得代码过度工程时。

## 命令

```bash
git fetch origin main
git diff origin/main...HEAD --stat
git diff origin/main...HEAD
```

## 工作流

1. 运行 diff 命令查看分支上所有改动
2. 从以下重点区域识别垃圾模式
3. 应用最小、集中的编辑移除垃圾
4. 重新运行 `git diff origin/main...HEAD` 验证只移除了垃圾
5. 运行测试或类型检查确认行为未改变: `npm test -- --changed --passWithNoTests 2>&1 | tail -10`
6. 总结清理了什么

## 重点区域

- 多余的、明显或与本地风格不一致的注释
- 对信任的内部代码路径不正常的防御性 try/catch 块
- 仅用来绕过类型问题的 `any` 强制转换
- 一次性操作的过度工程抽象 (过早的 helper、factory)
- 应该用早返回简化的深度嵌套代码
- 向后兼容hack (重命名的 `_vars`、重新导出、`// removed` 注释)
- 超出请求的特性、重构或"改进"
- 对未改动的代码添加的 docstrings、类型注解或注释
- 信任的内部路径中不可能出现场景的错误处理

## 原则

- 保持行为不变，除非修复明显的 bug
- 优先最小、集中的编辑而非广泛重写
- 三行相似代码好过过早抽象
- 如果移除什么，先确认真的未使用
- 最终总结简洁 (1-3 句)

## 输出

- 发现的垃圾模式列表及文件位置
- 应用的编辑
- 一行总结清理了什么