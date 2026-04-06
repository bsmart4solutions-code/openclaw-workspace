---
metadata.openclaw: |
  name: follow-up-reminder
  description: Keep track of leads and clients that need follow-up. Automatically remind about pending follow-ups based on cron schedule.
  emoji: 🔔
  requires:
    bins: []
    env: []
---

# Follow-Up Reminder Skill

> Track leads and clients that need follow-up. Send reminders at appropriate intervals.

## When to Use

- When a lead needs follow-up (after 3, 7, 14 days of no response)
- When checking daily tasks for leads to contact
- When a client project needs status update
- When scheduling future follow-up reminders

## How It Works

### 1. Create a Follow-Up Entry

When you identify a lead or client that needs follow-up:

```
# Add to memory/logs/follow-ups.md

## Follow-Up Tasks

### [Client Name] - [Date Added]
- **Reason:** [Why need follow-up]
- **Next Action:** [What to do]
- **Due Date:** [When to follow up]
- **Priority:** High/Medium/Low
- **Contact:** [Phone/WhatsApp]
- **Last Contact:** [Date]
```

### 2. Daily Check Routine

Each day, check the follow-up log and:
- Identify overdue follow-ups
- Send follow-up messages
- Update status after contact

### 3. Follow-Up Message Templates

**3-Day Follow-Up:**
```
Hi [Name]! Just checking in - did you get a chance to look at the information I sent? 
Any questions I can help answer? 😊
```

**7-Day Follow-Up:**
```
Hi [Name]! Just wanted to follow up on our last conversation. 
Hope you're doing well! Let me know if you need any more info.
```

**14-Day Follow-Up:**
```
Hi [Name]! It's been a while since we last connected. 
I understand things can get busy. Just wanted to check if you have any questions or need any help!
```

## For Renovation Business

This skill is essential for:
- Following up with leads who asked for quotes
- Checking in with clients during project phases
- Reminding about upcoming measurements
- Post-project follow-up for referrals

## Success Metrics

| Metric | Target |
|--------|--------|
| Follow-up response rate | > 40% |
| Overdue follow-ups | < 5 |
| Average follow-up cycle | 7 days |