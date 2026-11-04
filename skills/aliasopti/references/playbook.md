# Performance playbook

Use profiling evidence to select remedies. Check changes in the actual framework and hosting environment.

## Loading and images
- Identify the actual LCP element and separate TTFB, resource load delay, resource load time, and render delay. Remove the dominant delay first.
- Serve responsive images at appropriate dimensions using srcset/sizes or framework equivalents; choose efficient formats with fallbacks where appropriate, while preserving quality. Specify intrinsic width and height or an aspect ratio to reserve space.
- Lazy-load genuinely offscreen images and embeds. Do not lazy-load the LCP image; make it discoverable early and consider fetchpriority="high" for the actual critical image. Avoid indiscriminate preloads and competing high priorities.
- Reserve space for ads, embeds and dynamic content. Avoid unexpected insertions above existing content. Inspect shifts beyond initial page load.
- Minimize render-blocking CSS and avoid unused CSS where measurement supports it. Optimize fonts with a small set of weights, appropriate subsets, caching and font-display; check fallback font metrics and layout shifts. Preload only critical resources.

## Responsiveness and JavaScript
- Use an interaction trace to distinguish input delay, event processing and presentation delay. Reduce long tasks, yield or split work, move suitable computation to workers and reduce expensive layout/paint; verify the real interaction improves.
- Inspect route-specific bundle composition and coverage. Remove genuinely unused code/dependencies; split or defer noncritical code where it reduces work without creating a waterfall. Avoid shipping code required only on the server.
- Profile component renders before memoizing; fix expensive unnecessary renders or excessive DOM size only when observed. Use server/static rendering selectively when it helps actual delivery without breaking interaction or freshness.
- Audit third-party scripts for cost, ownership and necessity; remove or defer where safe and remeasure. Preserve consent and required functionality.

## Network, server and data
- Inspect duplicate requests, request chains, payloads and timing. Parallelize independent requests, deduplicate or batch where appropriate; preserve ordering, error handling and authorization.
- Investigate server timing and slow queries with safe profiling and query plans. Consider appropriate indexes, pagination, fetching fewer fields, avoiding N+1 queries and moving expensive work off critical paths. Evaluate write cost, locks, migrations and data correctness before production changes.
- Use appropriate cache headers, CDN and compression, fingerprinted assets and revalidation. Consider stale data, personalized responses, secrets, cache keys and invalidation; never cache private content as public. Check warm and cold behavior.
- Avoid blind preconnect, preload, prefetch or compression changes: measure benefit and resource contention.

## Measurement and regression prevention
- Use real-user monitoring/CrUX where available, with sample counts and route/device breakdowns. Synthetic testing supports diagnosis and repeatability, not a claim about field percentiles.
- Track key routes and interaction journeys over time. Set budgets on relevant metrics and assets only when grounded in baseline and product priorities. Monitor errors, accessibility and business outcomes alongside speed.
- Record environment, date, commit, test settings, cache state, sample size, measurements and relevant traces. Rerun after changes and explain measurement noise and unmeasured items.

## Official references
- https://web.dev/articles/vitals
- https://web.dev/articles/optimize-lcp
- https://web.dev/articles/optimize-inp
- https://web.dev/articles/optimize-cls
- https://developer.chrome.com/docs/devtools/performance
