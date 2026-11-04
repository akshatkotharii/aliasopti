---
name: aliasopti
description: Audit and improve website and web app performance using real-user and lab measurements. Use when asked to investigate slow pages, Core Web Vitals, loading, responsiveness, layout shifts, asset delivery, frontend bundles, API or database latency, caching, or regressions. Prioritize measured user impact, implement appropriate fixes, and verify behavior and performance.
---

# AliasOpti

Make websites feel faster for real people. Treat scores as diagnostics, not the goal. Adapt to the project's stack, existing instructions, access, and the user's scope. Never claim measurements or improvements that were not observed.

## Workflow

1. **Understand the experience.** Identify important routes and interactions, user devices and networks, architecture, available production/preview environments, and constraints. Inspect existing performance monitoring and tests. Preserve user changes.
2. **Establish a baseline before editing.** Prefer field data (RUM or CrUX/PageSpeed Insights) segmented by route, mobile/desktop and relevant cohorts; record time window, sample size and percentile when available. Record LCP, INP and CLS and the slow interactions and elements involved. Reproduce representative flows in a controlled lab with mobile viewport, CPU/network conditions, cold and warm cache, and multiple runs. Note environment, tools and limitations. Lighthouse measures lab performance; its Total Blocking Time is a diagnostic proxy, not INP. Exercise interactions and measure INP where tooling permits. If production/field data or profiling is unavailable, say so; do not substitute lab results as field metrics.
3. **Find causes, then rank.** Inspect traces, network waterfalls, resource sizes, LCP breakdown, main-thread tasks, layout shifts, server timing, API calls, and query plans as relevant. Rank by actual user impact, confidence, reach, effort and risk. Investigate the largest proven bottlenecks first; avoid speculative cleanup.
4. **Implement targeted changes.** Follow [references/playbook.md](references/playbook.md) for the applicable area. Keep accessibility, visual quality, functionality, SEO, privacy and security intact. Avoid broad rewrites, caching private data publicly, and risky production database changes without appropriate safeguards. Do not invent field data, assume an index is safe, or add dependencies without justification.
5. **Verify.** Run relevant build, automated tests and representative user flows, including mobile and slow connections. Repeat the baseline under comparable conditions; compare distributions or repeated runs, not isolated scores. Check visual stability, interaction behavior, image quality, data freshness, cache invalidation and errors as relevant. Distinguish observed results from hypotheses and expected field impact; production field data takes time to accrue.
6. **Report.** Summarize baseline and after measurements with environment and limitations, the evidence behind fixes, tests performed, remaining bottlenecks, regressions or tradeoffs, and next steps. If execution or measurement is blocked, state exactly what could not be verified.

## Targets

Aim for **LCP ≤ 2.5 s, INP ≤ 200 ms, CLS ≤ 0.1** at the **75th percentile of real-user visits**, segmented by mobile and desktop. Thresholds are guides, not guarantees of a good experience; measure important journeys and business-specific outcomes too. Use current official documentation if metrics or tooling may have changed.

## Investigation details

Read the playbook's additional diagnostics and practical commands when profiling, including LCP phase breakdown, interaction timing, post-load shifts, navigation cache, backend latency and safe command use. Select checks based on available evidence; never present unrun commands or missing field data as results. Use existing project tooling when possible. Record repeated-run conditions and the exact route, commit and environment. Avoid profiling production with synthetic load or exposing sensitive URLs and data.

## Recover from errors and verify setup

Before running diagnostics, identify the project root, package manager, lockfile, runtime versions, available browser and testing tools, start command, and applicable permissions. Read [references/troubleshooting.md](references/troubleshooting.md) when setup, measurement, build, tests, or changes fail. Check exit codes and actual output, diagnose the cause, apply the smallest safe correction, and rerun the affected check. Preserve existing project configuration and dependencies. Do not repeatedly install packages, alter unrelated configuration, expose private URLs to third parties, or claim a fix without verification. If a prerequisite cannot be resolved within access or scope, continue independent checks and report the blocker, its effect, and the next action.
