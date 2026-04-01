---
name: tdd-local
description: Test-first local development workflow for Oz using a red-green-refactor loop in the current repository
---

# TDD Local

Use this skill when you want Oz to work test-first in a local repository.

## TDD loop

1. Write or update a test that captures the next behavior
2. Run the test and confirm it fails for the expected reason
3. Implement the smallest change needed to make it pass
4. Re-run the affected tests
5. Refactor only after the test is green
6. Run a broader verification pass before finishing

## Constraints

- No production code before a failing test when a test can reasonably be written
- Keep each cycle focused on one behavior
- Match the repository's existing test style and framework
