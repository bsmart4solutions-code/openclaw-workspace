---
name: pro-workflow-mcp-audit
description: 审计已连接的 MCP 服务器的 token 开销、冗余和安全问题。用于会话感觉慢或添加新 MCP 之前。
---

# MCP Audit (MCP 审计)

分析 MCP 服务器开销并建议清理。

## 触发

- 会话感觉慢或昂贵
- 添加新 MCP 服务器
- 上下文快速填满
- 审查项目配置

## 关键洞察

每个 MCP 服务器把其所有工具描述添加到每个 API 请求。一个有 20 个工具的服务器每个请求添加 ~2K-4K tokens，不管你是否使用那些工具。

## 审计步骤

### 步骤 1: 列出活跃服务器

检查所有 MCP 配置：
```bash
cat .claude/settings.json 2>/dev/null | grep -A 50 "mcpServers"
cat ~/.claude/settings.json 2>/dev/null | grep -A 50 "mcpServers"
```

### 步骤 2: 统计每个服务器的 Tools

每个服务器估算 token 开销：
- 1-5 tools: ~200-500 tokens (低开销)
- 6-15 tools: ~500-1500 tokens (中等)
- 16-30 tools: ~1500-3000 tokens (高)
- 30+ tools: ~3000+ tokens (过高 — 考虑工具过滤)

### 步骤 3: 检查使用情况

要问的问题：
- 哪些服务器这个会话真正使用了？
- 哪些服务器 7+ 天没用了？
- 是否有功能重叠的服务器？
- 是否有只需要特定任务的服务器？

### 步骤 4: 建议操作

**禁用** 服务器：
- 7+ 天未使用
- 与另一个活跃服务器重叠
- 是项目特定的但你在不同项目

**保留** 服务器：
- 每个会话都用 (filesystem, git)
- 提供当前工作需要的独特能力
- 工具数少 (<5 tools)

## 输出

```text
MCP 审计
  活跃服务器: [N]
  总工具数: [N]
  估算开销: ~[N]K tokens 每请求

  服务器分析:
    [名称] — [N] tools, ~[N] tokens
      状态: 保留 / 禁用 / 审查
      原因: [为什么]

  建议:
    禁用: [列表]
    保留: [列表]
    审查: [列表]

  预计节省: ~[N]K tokens 每请求 (~$X.XX 每会话)
```