---
name: debug-local
description: Local debugging workflow for reproducing issues, gathering evidence, using Full Terminal Use when needed, and verifying the fix
---

# Debug Local

Use this skill for bugs in a local repository or running local process.

## Debug loop

1. Reproduce the issue first
2. Capture the exact error or failing behavior
3. Inspect recent changes and the affected code paths
4. Use Full Terminal Use if the issue depends on a live server, REPL, debugger, or interactive tool
5. Apply the smallest fix that addresses the root cause
6. Add or run a regression test if possible
7. Re-run verification before declaring success

## Constraints

- Do not skip reproduction
- Prefer evidence over guesses
- Fix the root cause, not just the symptom
