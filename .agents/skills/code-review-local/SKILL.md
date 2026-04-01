---
name: code-review-local
description: Local diff review workflow that uses Warp's code review features and focuses on logic, risk, readability, and verification gaps
---

# Code Review Local

Use this skill to review local Git-indexed changes before accepting or shipping them.

## Review flow

1. Open the local diff
2. Inspect each changed file for:
   - logic risks
   - incomplete verification
   - unclear naming or comments
   - missed edge cases
   - follow-up questions for the author
3. Use Warp's interactive code review flow for inline feedback on non-trivial diffs
4. Re-run verification after any follow-up changes

## Constraints

- Stay focused on the current local diff
- Call out the most important risks first
- Prefer actionable feedback over generic style comments
