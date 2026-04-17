---
name: pro-workflow-permission-tuner
description: 分析权限拒绝模式，生成优化的 alwaysAllow 和 alwaysDeny 规则。用于权限提示减慢速度或会话中有大量手动批准时。
---

# Permission Tuner (权限调优器)

通过分析拒绝模式和建议针对性规则来减少权限提示疲劳。

## 触发

- 权限提示反复打断流程
- 开始新项目想配置权限
- 会话中有大量手动批准后

## 工作流

1. 扫描近期会话数据获取权限模式
2. 识别频繁批准的工具和模式
3. 生成安全的 `alwaysAllow` 规则
4. 在应用前展示规则供批准

## 分析

### 步骤 1: 收集权限数据

检查当前权限规则：
```bash
cat .claude/settings.json 2>/dev/null | grep -A 20 "permissions"
cat ~/.claude/settings.json 2>/dev/null | grep -A 20 "permissions"
```

### 步骤 2: 识别安全模式

**自动批准候选** (低风险):
- `Read` — 所有文件读取 (只读，无副作用)
- `Glob` — 文件模式匹配 (只读)
- `Grep` — 内容搜索 (只读)
- `Bash(git status)` — 只读 git 命令
- `Bash(git diff*)` — 只读 git 命令
- `Bash(git log*)` — 只读 git 命令
- `Bash(npm test*)` — 测试执行
- `Bash(npm run lint*)` — linting
- `Bash(npm run typecheck*)` — 类型检查

**询问候选** (中等风险 — 仅在用户确认后自动批准):
- `Edit` — 文件修改
- `Write` — 新文件创建
- `Bash(git add*)` — 暂存改动
- `Bash(git commit*)` — 创建提交
- `Bash(npm install*)` — 依赖更改

**永不自动批准** (高风险):
- `Bash(git push*)` — 影响远程
- `Bash(git reset --hard*)` — 破坏性
- `Bash(rm -rf*)` — 破坏性
- `Bash(curl*POST*)` — 外部 API 调用
- 任何带 `--force` 或 `--no-verify` 的命令

### 步骤 3: 生成规则

```json
{
  "permissions": {
    "allow": [
      "Read",
      "Glob",
      "Grep",
      "Bash(git status)",
      "Bash(git diff*)",
      "Bash(git log*)",
      "Bash(npm test*)",
      "Bash(npm run lint*)",
      "Bash(npm run typecheck*)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(git push --force*)",
      "Bash(git reset --hard*)"
    ]
  }
}
```

## 原则

- 永远先展示规则再应用
- 保守批准 — 低风险操作优先
- 保持 deny 列表短但覆盖破坏性命令
- 定期回顾和调整规则

## 输出

- 当前权限设置分析
- 建议的 allow 规则列表
- 建议的 deny 规则列表
- 批准后应用的确认