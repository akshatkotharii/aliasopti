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

## Additional diagnostics
- Check redirects, server response time, connection setup, geographic latency and origin/CDN cache hit rates. Distinguish backend time from network time; use Server-Timing where available.
- Trace LCP across navigation types and viewports. Examine discovery delay, image size and decoding, font-blocked text, client-only rendering, and CSS or JavaScript preventing paint. The LCP element need not be an image.
- Record slow taps, clicks and keyboard input: separate input delay, processing and presentation delay. Inspect expensive event handlers, synchronous work, forced layout, style recalculation, DOM size and rendering. Do not conflate Lighthouse TBT with actual INP.
- Inspect layout shifts during scrolling, late API responses, consent prompts, font swaps and embedded content, not only initial load. Reserve space where dimensions are known; avoid suppressing useful content just to change a score.
- Examine duplicate fetches, request waterfalls, overfetching, pagination, cancellation, retry storms and concurrency. Verify server-side authorization, pagination correctness and cache freshness.
- Look for oversized video, uncompressed text, excessive images, redirects and cache misses. Check actual transfer sizes and responsive variants, not just source file sizes. Check modern formats only where supported and beneficial.
- Check back/forward cache eligibility and navigation performance when relevant; do not weaken security or freshness for cacheability.
- Prioritize by users affected and measured delay. Record an evidence-backed hypothesis and verify impact after each meaningful change; avoid overlapping experiments when attribution matters.

## Practical commands

Choose commands for the project's existing package manager and available tools; inspect scripts before running and never install packages or send private URLs to external services without appropriate authorization. Avoid running destructive or production-load tests.

```sh
# Identify project scripts and package manager
ls
cat package.json

# Asset sizes, excluding version-control internals
find public -type f -size +500k -print 2>/dev/null

# Response status, timing and headers for a site you may access
curl -sS -o /dev/null -w 'status=%{http_code} dns=%{time_namelookup}s connect=%{time_connect}s ttfb=%{time_starttransfer}s total=%{time_total}s\n' https://example.com/
curl -sSI https://example.com/
```

If Lighthouse and Chrome are already installed, run a representative production build locally, for example `lighthouse http://localhost:3000/ --output=html --output-path=./lighthouse-report.html`. Repeat runs with documented conditions. Lighthouse reports TBT, not field INP; use browser interaction traces or RUM for interaction evidence. CLI output and network headers may contain sensitive data; redact before sharing. Commands are examples, not universal fixes.
