# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

### Research: Multica (not installed)
- **What**: Open-source managed agents platform
- **GitHub**: multica-ai/multica
- **Features**:
  - Agents as Teammates (assign tasks like human)
  - Task lifecycle management (enqueue → claim → complete)
  - Skill compounding (solutions → reusable skills)
  - Unified runtimes dashboard
  - Multi-workspace support
- **Supports**: Claude Code, Codex, OpenClaw, OpenCode
- **Stack**: Next.js 16, Go (Chi), PostgreSQL + pgvector
- **Install**: `curl -fsSL https://raw.githubusercontent.com/multica-ai/multica/main/scripts/install.sh | bash`
- **Decision**: Not currently needed - OpenClaw + Cron Jobs already cover most features

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.
