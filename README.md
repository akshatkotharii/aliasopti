<div align="center">

# AliasOpti

### Make the website feel faster. Know why it is faster.

A portable performance skill for compatible AI agents, built around measurement, focused fixes and verification.

[Get started](#get-started) · [How it works](#how-it-works) · [Example output](#example-output) · [Troubleshooting](#troubleshooting)

</div>

![AliasOpti workflow: measure, diagnose, improve, verify and explain](assets/workflow.svg)

## Why AliasOpti?

A page can have a good score and still feel slow. A checkout button may lag, a layout may jump while someone reads, or a page may load quickly only on a fast connection. Fixing those problems starts with understanding what real people experience.

AliasOpti gives your coding agent a repeatable way to investigate. It establishes a baseline, finds the likely causes, improves the biggest verified bottlenecks and checks that important features still work. It keeps the focus on evidence and user experience.

> **What it is:** a portable folder of instructions and reference material for a compatible AI coding agent.
> **What it needs:** access to the website project or an accessible URL. Browser tools, real-user data and backend access improve the investigation when available. Installing the skill does not install those tools or guarantee a score.

## How it works

| Stage | What the agent does |
| --- | --- |
| **Measure** | Identify important routes and interactions; record available field data and a repeatable lab baseline. |
| **Diagnose** | Inspect loading, responsiveness, layout shifts, network requests, assets and server behavior. |
| **Improve** | Rank measured problems by impact and risk; make focused fixes in the permitted scope. |
| **Verify** | Repeat comparable measurements and test key journeys, accessibility and regressions. |
| **Explain** | Share results, evidence, commands run, limitations and remaining work. |

The skill adapts to the tools and stack already present. It checks prerequisites and troubleshoots failures; it cannot promise to repair every environment or measure data it cannot access.

## What it investigates

- **Loading:** LCP element and its timing, oversized images, responsive formats, font loading, render-blocking resources and server response.
- **Responsiveness:** slow clicks, taps and keyboard interactions, long tasks, expensive rendering and JavaScript bundles.
- **Visual stability:** image dimensions, late content, fonts, embeds and layout shifts throughout the page lifecycle.
- **Network and backend:** duplicate requests, waterfalls, API latency, caching, CDN delivery and slow queries when access permits.
- **Real-world experience:** key journeys, mobile layouts, slower networks, cold and warm caches, and third-party costs.
- **Reliability:** builds, relevant tests, error handling, privacy, security and data freshness after changes.

### The metrics

| Core Web Vital | What it tells you | Good target |
| --- | --- | --- |
| **LCP** | How quickly the main content appears | ≤ 2.5 seconds |
| **INP** | How responsive interactions feel | ≤ 200 milliseconds |
| **CLS** | How stable the layout is | ≤ 0.1 |

These targets are assessed at the **75th percentile of real-user visits**, separately for mobile and desktop. Lab tests help diagnose problems; they do not replace field data. Lighthouse's Total Blocking Time is a diagnostic, not field INP. [About Core Web Vitals](https://web.dev/articles/vitals).

## Get started

### 1. Install with the Skills CLI

You need [Node.js](https://nodejs.org/) 22.20 or later (includes `npx`), Git, and a supported coding agent. Open a terminal **inside your website project**, then run:

```sh
npx skills add akshatkotharii/aliasopti --skill aliasopti
```

Follow the prompts to choose your agent and installation preferences. The CLI installs to the current project by default. To make it available across projects, add `--global`:

```sh
npx skills add akshatkotharii/aliasopti --skill aliasopti --global
```

You can target an agent explicitly; for example:

```sh
npx skills add akshatkotharii/aliasopti --skill aliasopti --agent codex
npx skills add akshatkotharii/aliasopti --skill aliasopti --agent claude-code
npx skills add akshatkotharii/aliasopti --skill aliasopti --agent cursor
```

The CLI supports more agents; see its [supported agents list](https://github.com/vercel-labs/skills/blob/main/docs/agents.md). You can select multiple agents in the prompts. Avoid installing duplicate copies in different locations unless you understand your agent's precedence rules.

### 2. Confirm installation

```sh
npx skills list
```

Run this from the project where you installed the skill. Open that project in your agent and check its skill list; refresh or start a new session if it does not appear. For a global install, use `npx skills list --global`. Discovery and invocation differ between agents, and the CLI's list does not by itself prove that your agent has loaded the skill.

### 3. Update or remove

```sh
npx skills check
npx skills update
npx skills remove aliasopti
```

Review the CLI's prompts and scope. Use `--global` where applicable for global installations. See the [CLI documentation](https://github.com/vercel-labs/skills/blob/main/docs/commands.md) for current options. Install only from a source you trust; inspect this repository before adding it.

<details>
<summary>Manual installation alternative</summary>

Clone this repository outside your website project. Copy the complete `skills/aliasopti` folder, including `references`, to your agent's documented skill directory. Or use `./scripts/install.sh` from the checkout; run it without arguments for options. Do not overwrite an existing skill without reviewing it. This manual method is not managed by the Skills CLI update command.

</details>

### 4. Ask for an audit

> Use AliasOpti to audit and improve this website. Focus on the homepage and checkout on mobile. Measure before changing anything, fix the biggest verified bottlenecks, and test the key flows.

Other useful requests:

- **Read-only:** “Use AliasOpti to investigate this site. Give me a prioritized report; do not change code.”
- **Specific issue:** “Use AliasOpti to investigate why the product page shifts while loading.”
- **Slow interaction:** “Use AliasOpti to trace the slow search interaction and verify any fix.”

### 5. Review the results

Look for the baseline, test conditions, evidence, changes, after measurements and functional checks. Ask the agent to explain missing measurements or unresolved failures. Field data may need time to accumulate after a deployment.

## Example output

The following is **illustrative only**, not a real audit or a claim of typical results.

```text
Route: /products · mobile lab · cold cache · 3 runs

Finding: Main image discovered late and larger than needed.
Evidence: Network waterfall and LCP trace.
Action: Serve a responsive image; make the LCP image discoverable early.
Verification: Compare repeated LCP measurements and check image quality.
Field INP: unavailable — no real-user data was provided.
Tests: product navigation and cart flow checked; build passed.
```

A real report should show actual measurements, the environment and any failures, instead of filling gaps with estimates.

## Tools and prerequisites

AliasOpti follows the portable Agent Skills folder format. Agents differ in discovery, permissions, available tools and skill support, so universal compatibility cannot be guaranteed. For an agent without skill support, give it `SKILL.md` and the referenced files as context; automatic discovery is unavailable. The skill itself has **no runtime dependencies**. Available diagnostics depend on the site and agent environment. Chrome DevTools can run Lighthouse without a separate CLI installation. For the optional Lighthouse CLI you need compatible Node.js and Chrome; follow [Chrome's installation guidance](https://developer.chrome.com/docs/lighthouse/overview/). Use the project's existing package manager, scripts and lockfile. Database analysis requires appropriate access and permissions. Do not send private URLs or credentials to public audit tools.

## Troubleshooting

| Problem | Check |
| --- | --- |
| Agent cannot find AliasOpti | Confirm the correct project directory, complete skill folder and agent-specific path; refresh the session. |
| `npx` or installation fails | Check Node.js version, npm and Git availability, network access and terminal output. See the [Skills CLI documentation](https://github.com/vercel-labs/skills/blob/main/docs/commands.md). |
| Website will not start | Follow the project's setup instructions, inspect runtime versions, required environment variables and port conflicts. Keep secrets private. |
| Lighthouse cannot run | Check Chrome availability and, for CLI use, compatible Node.js and Lighthouse. DevTools is an alternative. |
| Field data is unavailable | Record that limitation. Lab tests can still diagnose issues, but cannot establish real-user percentiles. |
| A fix breaks a test or makes performance worse | Inspect the failure, revise or revert the change, and repeat the affected checks. |

The agent has a fuller [error-recovery guide](skills/aliasopti/references/troubleshooting.md) for handling setup, measurement and verification failures.

## Repository structure

```text
aliasopti/
├── README.md
├── assets/workflow.svg
├── scripts/install.sh
└── skills/aliasopti/
    ├── SKILL.md
    └── references/
        ├── playbook.md
        └── troubleshooting.md
```

## Contributing

AliasOpti is intended to improve as we learn. Propose focused checks, clearer workflows or fixes backed by evidence and primary sources. Explain tradeoffs and avoid stack-specific assumptions. Open an issue or pull request with context and a reproducible example.
