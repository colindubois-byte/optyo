# optyo deal workspace

This repo holds the persistent per-deal context tracked by the `deal-context` Claude Code plugin (from [colindubois-byte/claude-code](https://github.com/colindubois-byte/claude-code)).

`.claude/settings.json` here declares the marketplace and enables the plugin, but that alone doesn't install it — Claude Code still needs an explicit install step before `/deal-init` etc. are recognized. **The first time you open a Claude Code session in this repo**, run:

```
/plugin marketplace add colindubois-byte/claude-code
/plugin install deal-context@claude-code-plugins
/reload-plugins
```

After that one-time install, `/deal-init`, `/deal-refresh`, and `/deal-status` are available in every future session opened against this repo — no need to repeat these commands.

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
