# AliasOpti

**A measurement-first performance skill for AI coding agents.**

AliasOpti helps an agent investigate a slow website, prioritize observed bottlenecks, make targeted improvements, and verify both performance and functionality. It is a reusable set of instructions, not a scanner or a promise of a particular score.

## What it does

1. Establishes a baseline for important pages and interactions before changes.
2. Uses real-user data where available, then reproduces issues with appropriate lab tools.
3. Traces loading, responsiveness, layout shifts, assets, JavaScript, APIs, server and database performance.
4. Ranks evidence-backed opportunities by user impact, confidence, effort and risk.
5. Implements appropriate changes and checks features, accessibility and regressions.
6. Reports comparable before-and-after measurements, tradeoffs and remaining unknowns.

### Core Web Vitals

| Metric | Measures | Good field target |
| --- | --- | --- |
| LCP | Main content loading | ≤ 2.5 seconds |
| INP | Interaction responsiveness | ≤ 200 milliseconds |
| CLS | Visual stability | ≤ 0.1 |

Targets apply at the 75th percentile of real-user visits, segmented by mobile and desktop. Lighthouse's Total Blocking Time is a lab diagnostic, not field INP. See [Web Vitals](https://web.dev/articles/vitals).

## Install

You need Git and an agent that supports the Agent Skills format. Copy the **entire** `skills/aliasopti` folder, including `references`, into the agent's skills directory. The commands below create a project-level installation. Run them from your website project's root on macOS or Linux:

```sh
git clone https://github.com/akshatkotharii/aliasopti.git /tmp/aliasopti-source
mkdir -p .agents/skills
cp -R /tmp/aliasopti-source/skills/aliasopti .agents/skills/
```

This location works for Codex and current VS Code Copilot Agent Skills. For Claude Code, use its project skills directory instead:

```sh
mkdir -p .claude/skills
cp -R /tmp/aliasopti-source/skills/aliasopti .claude/skills/
```

For GitHub Copilot in VS Code, `.github/skills/aliasopti` is another supported project location. Check your agent's documentation for personal/global locations and skill discovery behavior. Restart or refresh the agent session if needed. If the destination already exists, inspect it first; copying over an existing directory may preserve stale files. To update, review the new version and replace the complete skill directory.

- [Codex skills](https://developers.openai.com/codex/skills/)
- [Claude Code skills](https://code.claude.com/docs/en/skills)
- [VS Code Agent Skills](https://code.visualstudio.com/docs/agent-customization/agent-skills)

## Use

Open the website project in your agent and ask, for example:

> Use AliasOpti to audit and improve the homepage and checkout on mobile. Measure first, fix the biggest proven bottlenecks, and verify the important user flows.

For a read-only review, say: “Use AliasOpti to audit this site. Do not change code.” You can also ask it to investigate one issue, such as a slow interaction or layout shifts. Available access determines what it can measure: a URL alone may not expose source code, real-user data, server traces or database queries. The skill must report those limits.

## Checks and tools

The playbook covers LCP timing phases; interaction traces and long tasks; post-load layout shifts; responsive images and font loading; bundle analysis and rendering; request waterfalls, caching, third parties and server/query profiling. It includes safe starting commands for asset sizes, response timing and Lighthouse where already installed. Tools and commands must be adapted to the project and permissions; no automatic production load testing.

## Repository

```text
skills/aliasopti/
├── SKILL.md
└── references/playbook.md
```

Contributions are welcome. Explain the problem, evidence and tradeoffs for new checks; link primary sources when guidance changes. Keep instructions focused on improvements that users can feel.
