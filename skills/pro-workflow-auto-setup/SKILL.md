---
name: pro-workflow-auto-setup
description: 为新项目自动配置质量门、hooks 和设置。检测项目类型并设置适当的工具。用于加入新代码库时。
---

# Auto Setup (自动配置)

检测项目类型并自动配置 pro-workflow 质量门。

## 触发

- 开始新项目工作
- 加入不熟悉的代码库
- 设置 CI 集成

## 检测

### 步骤 1: 识别项目类型

```bash
ls package.json pyproject.toml Cargo.toml go.mod Gemfile pom.xml build.gradle 2>/dev/null
```

### 步骤 2: 配置质量门

**Node.js/TypeScript:**
```json
{
  "lint": "npm run lint",
  "typecheck": "npx tsc --noEmit",
  "test": "npm test -- --changed --passWithNoTests",
  "format": "npx prettier --check ."
}
```

**Python:**
```json
{
  "lint": "ruff check .",
  "typecheck": "mypy .",
  "test": "pytest --tb=short -q",
  "format": "ruff format --check ."
}
```

**Rust:**
```json
{
  "lint": "cargo clippy -- -D warnings",
  "typecheck": "cargo check",
  "test": "cargo test --quiet",
  "format": "cargo fmt --check"
}
```

**Go:**
```json
{
  "lint": "golangci-lint run",
  "typecheck": "go vet ./...",
  "test": "go test ./... -count=1",
  "format": "gofmt -l ."
}
```

### 步骤 3: 验证工具已安装

用 `--version` 或 `--help` 运行每个命令确认可用性。报告缺失的工具。

### 步骤 4: 创建配置

生成 `.claude/settings.json` 包含：
- 检测到的项目类型的质量门命令
- 安全的权限规则 (只读工具自动批准)
- 项目的 Hook 配置

## 输出

```
自动配置完成
================

检测到的项目: [类型]
已配置质量门:
  - [lint 命令]
  - [typecheck 命令]
  - [test 命令]
  - [format 命令]

缺失工具: [列表或 "无"]
权限配置: 已应用默认安全规则
```

## 原则

- 检测多个项目类型时，优先顺序：Node > Python > Rust > Go
- 只配置存在的工具，不强制安装
- 保留现有配置，只补充缺失部分