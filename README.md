# optyo deal workspace

This repo holds the persistent per-deal context tracked by the `deal-context` Claude Code plugin (from [colindubois-byte/claude-code](https://github.com/colindubois-byte/claude-code)).

The plugin is auto-enabled here via `.claude/settings.json` — open Claude Code in this repo and the `/deal-init`, `/deal-refresh`, and `/deal-status` commands are available immediately, no manual install step needed.

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
