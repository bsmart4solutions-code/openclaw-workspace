# OpenClaw AI 自动化运营教程

## 从零开始构建你的 AI Agents Team

---

## 第一阶段：入门 (Day 1)

### Step 1: 账号与环境设置

```bash
# 1. 注册 OpenClaw
# 访问 https://openclaw.ai 注册账号

# 2. 安装 OpenClaw
pip install openclaw

# 3. 验证安装
openclaw --version
```

### Step 4: 连接 Telegram 接收通知

```bash
# 4. 创建 Telegram Bot
# 1) 打开 @BotFather
# 2) /newbot
# 3) 获取 Token

# 4. 配置
openclaw config set channel.telegram.token "你的TOKEN"
openclaw config set channel.telegram.chat_id "你的ChatID"
```

### Step 5: 发送第一条消息

```bash
openclaw telegram send "你好，我是 AI 助手！"
```

---

## 第二阶段：核心技能 (Day 2-3)

### Step 6: 安装第一个 Skill

```bash
# 查看可用 skills
clawhub search email

# 安装 email skill
clawhub install email

# 验证
openclaw --skills | grep email
```

### Step 7: 创建你的第一个 Agent

```bash
# 创建投资助手 agent
openclaw agents create investment-assistant

# 配置 Agent
openclaw agents set investment-assistant model mini-max/MiniMax-M2.1
```

### Step 8: 配置记忆系统

```bash
# 创建每日记忆文件
mkdir -p memory
touch memory/$(date +%Y-%m-%d).md

# 编辑 MEMORY.md
echo "# 关于主人
- 名字: Brandon
- 偏好: 每天早盘简报
" > MEMORY.md
```

---

## 第三阶段：自动化工作流 (Day 4-7)

### Step 9: 设置定时任务 (Cron Jobs)

```bash
# 编辑 cron 配置
openclaw cron add "morning-brief" --schedule "0 9 * * *" \
  --task "发送早盘简报" \
  --notify telegram
```

### Step 10: 配置多通道通知

```bash
# 配置邮件通知
openclaw config set email.smtp.host smtp.gmail.com
openclaw config set email.smtp.port 587

# 配置 Slack
openclaw config set channel.slack.enabled true
openclaw config set channel.slack.webhook "你的webhook"
```

### Step 11: 创建技能工作流

```bash
# 创建自动化技能
mkdir -p skills/daily-report

# 创建 SKILL.md
cat > skills/daily-report/SKILL.md << 'EOF'
---
name: daily-report
description: 每日报告生成自动化
trigger: daily-report
---

# 每日报告

## 执行流程
1. 获取今日市场数据
2. 生成简报
3. 发送到 Telegram
EOF
```

---

## 第四阶段：多 Agent 协作 (Day 8-14)

### Step 12: 安装 ClawTeam

```bash
# 安装多代理协调框架
pip install clawteam

# 创建团队
clawteam team spawn-team my-team

# 添加成员
clawteam spawn --team my-team --agent-name researcher --task "研究分析"
clawteam spawn --team my-team --agent-name writer --task "撰写报告"
```

### Step 13: 配置 Agent 分工

```bash
# 研究 Agent
openclaw agents create researcher \
  --model mini-max/MiniMax-M2.1-flash \
  --role "专注于市场研究和数据分析"

# 写作 Agent  
openclaw agents create writer \
  --model mini-max/MiniMax-M2.1 \
  --role "专注于内容撰写和整理"
```

### Step 14: 设置任务队列

```bash
# 创建任务
clawteam task create "分析A股市场" --status pending
clawteam task create "撰写日报" --status pending --blocks "分析A股市场"

# 查看任务板
clawteam board serve --port 8080
```

---

## 第五阶段：生产环境 (Day 15+)

### Step 15: 配置 Git 备份

```bash
# 初始化 Git
cd ~/.openclaw/workspace
git init
git add .
git commit -m "Initial OpenClaw setup"

# 添加远程仓库
git remote add origin your-github-repo
git push -u origin main
```

### Step 16: 设���健康检查

```bash
# 配置监控 cron
openclaw cron add health-check \
  --schedule "*/30 * * * *" \
  --task "检查系统状态" \
  --alert telegram
```

### Step 17: 成本优化

```bash
# 查看使用统计
openclaw cost report

# 优化模型使用
# - 简单任务用 flash 模型
# - 复杂任务用 pro 模型
# - 缓存常用结果
```

---

## 常用命令速查表

| 命令 | 说明 |
|------|------|
| `openclaw --version` | 查看版本 |
| `openclaw status` | 系统状态 |
| `openclaw config get` | 查看配置 |
| `openclaw cron list` | 定时任务 |
| `openclaw agents list` | Agent 列表 |
| `clawhub search <keyword>` | 搜索技能 |
| `clawhub install <skill>` | 安装技能 |

---

## 推荐技能清单

### 基础必备
- email - 邮件管理
- gsk-calendar-create - 日历管理
- gsk-email-send - 发送邮件

### 生产效率
- daily-stock-analysis - 股票分析
- pptx - PPT 生成
- docx - Word 文档
- xlsx - Excel 表格

### 自动化
- cron - 定时任务
-ClawTeam - 多代理协调

---

## 常见问题

### Q: 如何更换模型？
```bash
openclaw config set agents.default.model model-name
```

### Q: 如何查看日志？
```bash
openclaw logs --lines 100
```

### Q: 如何备份？
```bash
git -C ~/.openclaw/workspace add . && git commit -m "Backup"
```

---

## 下一步

1. 先安装必备技能 (`email`, `calendar`)
2. 设置定时任务
3. 尝试 ClawTeam 多代理
4. 配置 Git 备份

有任何问题随时问我！🦐