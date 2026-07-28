# optyo deal workspace

This repo holds the persistent per-deal context originally designed as the `deal-context` Claude Code plugin (from [colindubois-byte/claude-code](https://github.com/colindubois-byte/claude-code)). The commands and agent are vendored directly into this repo's `.claude/` folder (`.claude/commands/`, `.claude/agents/`) rather than installed via the plugin marketplace — that avoids a per-session/per-environment install step that doesn't reliably persist here. `/deal-init`, `/deal-refresh`, and `/deal-status` are recognized automatically in any Claude Code session opened against this repo — nothing to install, no `/plugin` commands, no setup step.

If you ever update the plugin source in `colindubois-byte/claude-code`, re-copy `plugins/deal-context/commands/*.md` and `plugins/deal-context/agents/*.md` into this repo's `.claude/commands/` and `.claude/agents/` to pick up the changes.

## Getting started

Set up your first account:

```
/deal-init "Account Name"
```

Then run the daily refresh for one account or all of them:

```
/deal-refresh "Account Name"
/deal-refresh
```

Check the current plan without refreshing anything:

```
/deal-status
```

Each account's workspace lives under `deals/<account-slug>/` once you run `/deal-init` — see the [plugin README](https://github.com/colindubois-byte/claude-code/tree/main/plugins/deal-context) for the full layout and how it aggregates CRM data, conversations, web research, and Monday.com signals.
