# Setup, error recovery and verification

Check the project's own instructions, lockfile, runtime requirements and existing scripts before selecting a command. Run project commands in its root; inspect output and exit status. Do not automatically overwrite configuration, replace lockfiles, upgrade dependencies, kill unrelated processes or run production load tests.

| Symptom | Diagnose and respond |
| --- | --- |
| Skill not found | Confirm the correct agent's discovery directory contains `aliasopti/SKILL.md` and `aliasopti/references/`; check scope, spelling and agent settings. Refresh the session where supported. |
| Missing runtime, package or browser | Check versions and executable paths, project requirements and existing local tools. Explain which capability is unavailable. Use the project's supported install process if authorized; use DevTools or other already available measurements when appropriate. |
| App will not start | Read the error, check the documented setup, runtime version, environment variable names and port ownership. Do not print secret values. Retry the correct start command after a minimal safe fix. |
| Audit fails, times out or returns an error page | Confirm the correct URL, server readiness, redirects and authentication. Retry on a stable, authorized preview and record limitations. Do not upload private pages or credentials to a public audit service. |
| No field data | Check RUM/CrUX availability and route, device, time window and sample count. Record unavailable rather than reporting simulated data as field data. Use lab diagnostics separately. |
| Build or test fails | Record the exact failure, establish whether it existed before the changes, diagnose logs and fix only relevant regressions. Rerun affected checks. Report unrelated existing failures rather than claiming success. |
| Performance worsens or results vary | Repeat under matched device, cache and network conditions; compare several runs, check measurement noise and undo or revise ineffective changes. Never select only favorable runs. |
| Data or cache behavior changes | Verify authorization, private cache boundaries, invalidation, error states and freshness. Revert unsafe changes and state unresolved risks. |

Finish by checking critical flows, mobile behavior and relevant tests. Report what was measured, what could not be measured, commands/checks actually run, failures and remaining risks. Never claim to have installed a tool or fixed an issue without verifying it.
