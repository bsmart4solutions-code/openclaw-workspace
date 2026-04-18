---
name: gofr-framework
description: GoFr - Opinionated Go microservice framework. Use when building Go microservices, REST/gRPC APIs with database and observability.
---

# GoFr Framework

GoLang 微服务开发框架

## Install
```bash
go get gofr.dev/pkg/gofr
```

## Quick Start
```go
import "gofr.dev/pkg/gofr"

app := gofr.New()
app.GET("/hello", func(c *gofr.Context) (any, error) {
    return "Hello!", nil
})
app.Run()
```

## Features
- REST/gRPC APIs
- Database migrations
- Cron jobs
- Observability (logs, traces, metrics)
- Auth middleware
- WebSocket
- GraphQL
- Kubernetes deployment

## Use Cases
- 微服务开发
- REST/gRPC APIs
- K8s 部署
- 快速原型

## 文档
- https://gofr.dev/docs
- https://pkg.go.dev/gofr.dev