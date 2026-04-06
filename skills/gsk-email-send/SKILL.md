---
name: gsk-email-send
version: 1.0.0
description: Send a new email message via Gmail or Outlook.
metadata:
  category: email
  requires:
    bins:
    - gsk
  cliHelp: gsk email send --help
---

# gsk-email-send

**PREREQUISITE:** Read `../gsk-shared/SKILL.md` for auth, global flags, and security rules.

Send a new email message via Gmail or Outlook.

## Usage

```bash
gsk email send [options]
```

## Flags

| Flag | Required | Description |
|------|----------|-------------|
| `--to` | Yes | Recipient email address(es), comma-separated. (string) |
| `--subject` | Yes | Email subject line. (string) |
| `--body` | Yes | Email body content. (string) |
| `--cc` | No | CC recipient(s), comma-separated. (string) |
| `--bcc` | No | BCC recipient(s), comma-separated. (string) |
| `--content_type` | No | Content type: text/plain or text/html. Default: text/plain. (string) |
| `-a`, `--from_account` | No | Sender email account to use if multiple accounts are connected. (string) |

> **CAUTION:** This command performs a write/send operation. Double-check parameters before executing.

## See Also

- [gsk-shared](../gsk-shared/SKILL.md) — Authentication and global flags

