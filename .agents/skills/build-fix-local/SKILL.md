---
name: build-fix-local
description: Minimal-diff local build and typecheck repair workflow for Oz
---

# Build Fix Local

Use this skill when a local build, lint, or typecheck is failing.

## Workflow

1. Run the failing command and collect the real errors
2. Group related failures together
3. Fix the smallest set of files necessary
4. Re-run the same command after each meaningful fix
5. Finish with a broader verification pass if the repository has one

## Constraints

- Prefer minimal changes
- Do not refactor unrelated code while fixing build failures
- Show the exact command that now passes
