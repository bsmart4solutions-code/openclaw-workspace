# Overview

## What this project does

`daily_stock_analysis` is an AI-powered stock analysis system for A-shares, Hong Kong stocks, and US stocks. It produces a daily decision dashboard and can push results to channels such as Telegram, Discord, Slack, email, WeChat Work, and Feishu.

## Preferred deployment order

1. GitHub Actions for zero-server automation
2. Local Python run for development/testing
3. Docker for packaged deployment
4. Web/API/Bot integrations when needed

## Minimum setup

To get a useful first run, configure:

- `STOCK_LIST`
- one model source:
  - `GEMINI_API_KEY`, or
  - `OPENAI_API_KEY` + optional `OPENAI_BASE_URL`, or
  - `OLLAMA_API_BASE`
- at least one notification channel if you want pushes

## Practical reminders

- Use `OLLAMA_API_BASE` for Ollama local models.
- Do not point Ollama at `OPENAI_BASE_URL`.
- For GitHub Actions, keep secrets and variables separate.
- If a deployment binds only to localhost, make it listen on `0.0.0.0`.
- If messages are too long, switch to a shorter report type or split notifications.
- If market-data fetches fail, reduce concurrency and try fallback sources.

## Good first checks

- Confirm the stock symbols are in the intended market format.
- Confirm the LLM config is present and valid.
- Confirm notification credentials are correct.
- Run one manual execution before scheduling.
