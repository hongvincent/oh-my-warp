# Verification Loops

Advanced verification patterns for iterative quality assurance. Use these when the standard VERIFY phase needs more rigor.

## QA Cycling

When a single verify pass isn't enough (complex changes, flaky environments), use iterative QA cycling:

```
Cycle 1/5: RUN -> CHECK -> DIAGNOSE -> FIX -> repeat
```

### Protocol

1. **RUN**: Execute the verification command (test, build, lint, typecheck)
2. **CHECK**: Did it pass?
   - YES → Exit with success
   - NO → Continue to step 3
3. **DIAGNOSE**: Analyze the failure. What's the root cause? What specific fix is needed?
4. **FIX**: Apply the fix. Minimal changes only.
5. **REPEAT**: Go back to step 1

### Exit Conditions

- **Goal met**: All checks pass → report success with cycle count
- **Max cycles (5)**: Stop and report diagnosis of remaining issues
- **Same failure 3×**: Stop early — this indicates a fundamental issue requiring different approach or user input
- **Environment error**: Stop and report (missing dependency, port conflict, etc.)

### Progress Reporting

Report status each cycle for visibility:

```
[QA Cycle 1/5] Running tests... FAILED - 3 tests failing
[QA Cycle 1/5] Diagnosing: missing mock for auth service
[QA Cycle 1/5] Fixing: adding mock to test setup
[QA Cycle 2/5] Running tests... PASSED - All 47 tests pass
[QA COMPLETE] Goal met after 2 cycles
```

## Continuation Protocol

Before claiming ANY task is complete, verify all of these:

### Completion Checklist

1. **Zero pending tasks**: All TODO items marked done. No "I'll come back to this."
2. **All features working**: Every requirement from the original task is met — no scope reduction.
3. **Tests passing**: Fresh test output shown (not assumed or remembered from earlier).
4. **Zero errors**: Build, lint, and typecheck all pass with fresh output.
5. **Verification evidence**: Concrete command output proving the work is done. "Should work" is not evidence.

### Red Flags (Do Not Claim Complete)

- Words like "should," "probably," "seems to" — these demand actual verification
- No fresh test/build output — run the commands
- Claims of "all tests pass" without results — show the output
- Remaining TODO items — finish them first
- Untested edge cases mentioned but not covered

### If Any Item Fails

Do not claim completion. Continue working:
1. Fix the failing item
2. Re-run verification
3. Only claim done when ALL items pass

## Escalation Rules

### 3-Failure Circuit Breaker

If the same approach fails 3 times:
1. **STOP** trying variations of the same fix
2. **SUMMARIZE** what was attempted and why it failed
3. **ESCALATE**: Switch to Architect mode for architectural analysis, or ask the user for guidance

### When to Continue Working

- A single subtask failed but others can continue — fix and retry
- Build error after code change — normal, fix it
- Test failure that reveals a real bug — investigate and fix

### When to Stop and Report

- Blocked by missing credentials or permissions
- Fundamental architecture issue (not a code bug)
- Unclear or conflicting requirements — need user clarification
- Same error persists across 3+ fix attempts
- External service/dependency is down

### When to Ask the User

Only after exhausting these steps:
1. Searched the codebase for answers
2. Checked documentation (MCP Context7, README, etc.)
3. Tried at least one reasonable interpretation
4. Cannot proceed without a decision only the user can make

## Verification Sizing

Match verification effort to change size:

- **Small** (<5 files, <100 lines): Lightweight — build + affected tests
- **Standard** (5-20 files): Full — build + lint + test suite + functionality check
- **Large** (>20 files or architectural): Thorough — all checks + security review + regression sweep + edge case testing
