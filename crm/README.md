# CRM - 客户数据库

> 装修业务客户管理系统

## 文件结构

```
crm/
├── customers/
│   └── YYYY-MM.md          # 按月份归档的客户
├── projects/
│   └── [customer-id].md    # 每个客户的装修项目
├── templates/
│   ├── inquiry-response.md # 常见回复模板
│   └── follow-up.md        # 跟进模板
└── README.md               # 本文件
```

## 客户字段

| 字段 | 说明 |
|------|------|
| id | 客户唯一ID |
| name | 姓名 |
| phone | 电话 |
| email | 邮箱 |
| source | 来源 (FB/IG/WhatsApp/转介绍) |
| status | 状态 (新咨询/已报价/已签约/已完成/已失效) |
| budget | 预算范围 |
| property_type | 房产类型 |
| area | 面积 |
| location | 地区 |
| tags | 标签 |
| created_at | 创建时间 |
| updated_at | 更新时间 |
| notes | 备注 |

## 使用方法

1. 新客户咨询 → 创建 `customers/YYYY-MM.md` 记录
2. 跟进情况 → 更新客户记录
3. 成交 → 移动到 `projects/` 创建项目档案