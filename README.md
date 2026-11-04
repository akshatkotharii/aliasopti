# ⚡ AliasOpti

### Make websites feel faster. Measure what matters.

A reusable AI skill for finding and fixing performance problems that real people notice.

**Measure → Diagnose → Prioritize → Improve → Verify**

---

## The idea

A fast website is more than a green Lighthouse score. AliasOpti helps an AI coding agent measure the real experience, find the biggest bottlenecks, make focused changes, and check that the site still works. It follows evidence instead of optimizing random code.

## What it covers

| Area | Focus |
| --- | --- |
| Real experience | Core Web Vitals, important journeys, mobile and slower connections |
| Loading | LCP, images, critical resources, fonts and layout shifts |
| Responsiveness | Slow interactions, long tasks, bundles and rendering |
| Backend | Request waterfalls, duplicate calls, APIs and slow queries |
| Delivery | Caching, assets, compression and third-party scripts |
| Confidence | Before-and-after measurements, accessibility and regressions |

## Core Web Vitals targets

| Metric | Good target |
| --- | --- |
| LCP | ≤ 2.5 seconds |
| INP | ≤ 200 milliseconds |
| CLS | ≤ 0.1 |

Evaluate at the **75th percentile of real-user visits**, separately for mobile and desktop. Lab results help diagnose issues but do not replace field data. [Learn more](https://web.dev/articles/defining-core-web-vitals-thresholds).

## Use it

Copy [skills/aliasopti](skills/aliasopti) into the skills location supported by your AI coding agent. Then invoke AliasOpti or ask:

> Use AliasOpti to measure and improve this website. Focus on the homepage and checkout on mobile. Show a baseline, fix the biggest verified issues and check for regressions.

The agent needs access to relevant code, a running site or performance data. Field data and production access may not always be available.

## How it works

1. Understand important pages, interactions and constraints.
2. Measure real-user and repeatable lab performance before changes.
3. Diagnose bottlenecks using traces and appropriate tools.
4. Improve the highest-impact verified issues first.
5. Verify performance and key features.
6. Explain results, limitations and remaining issues.

## Growing AliasOpti

This is a starting point designed to improve as we learn. Contributions can add practical techniques, reliable sources and examples grounded in real problems. Open an issue or pull request with evidence and context.

---

**Better performance is something people feel.**

