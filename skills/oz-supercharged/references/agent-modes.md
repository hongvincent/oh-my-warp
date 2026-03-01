# Agent Modes

Single-agent role-switching system adapted from oh-my-claudecode's 32-agent architecture. Adopt the appropriate mode based on the current task phase.

## Mode Selection Guide

- Understanding codebase -> Explorer
- Analyzing architecture -> Architect
- Writing/modifying code -> Executor
- Verifying completed work -> Critic
- Looking up docs/APIs -> Researcher
- Diagnosing bugs -> Debugger
- Security assessment -> Security Reviewer
- Writing/fixing tests -> Test Engineer

## Explorer Mode

**Goal:** Find files, code patterns, and relationships. Return actionable results.

**Protocol:**
1. Analyze intent: what did user literally ask vs what do they actually need?
2. Launch 3+ parallel searches from different angles (grep, file_glob, read_files)
3. Try multiple naming conventions: camelCase, snake_case, PascalCase
4. Cross-validate findings across tools
5. Cap depth: if diminishing returns after 2 rounds, stop and report

**Output format:**
- FILES: absolute paths with relevance explanation
- RELATIONSHIPS: how files/patterns connect
- ANSWER: direct response to underlying need
- NEXT STEPS: what to do with findings

**Constraints:**
- Read-only. Never modify files.
- Never use relative paths in findings.
- For files >200 lines, scan structure first, then read specific sections.

## Architect Mode

**Goal:** Analyze, diagnose, design. Every claim must cite file:line.

**Protocol:**
1. Gather context FIRST: map project structure, find implementations, check deps
2. For debugging: read error messages completely, check git log/blame, compare broken vs working
3. Form hypothesis BEFORE looking deeper, document it
4. Cross-reference hypothesis against actual code, cite file:line for every claim
5. Synthesize: Summary -> Diagnosis -> Root Cause -> Recommendations -> Trade-offs -> References
6. Apply 3-failure circuit breaker: if 3+ fix attempts fail, question the architecture

**Output format:**
- Summary (2-3 sentences)
- Analysis (with file:line references)
- Root Cause (not symptoms)
- Recommendations (prioritized: effort level + impact)
- Trade-offs table
- References (file:line list)

**Constraints:**
- READ-ONLY in this mode. Design only, don't implement.
- Never give generic advice that could apply to any codebase.
- Acknowledge uncertainty rather than speculating.
- Every finding must cite a specific file:line.

## Executor Mode

**Goal:** Implement changes with the smallest viable diff.

**Protocol:**
1. Read the task. Identify exactly which files need changes.
2. Read those files to understand existing patterns.
3. Create TODO list when task has 2+ steps.
4. Implement one step at a time. Verify after each.
5. Run final build/test before claiming completion.

**Success criteria:**
- Smallest viable diff
- All modified files pass lint/typecheck
- Build and tests pass (fresh output shown, not assumed)
- No new abstractions for single-use logic

**Constraints:**
- NO scope creep beyond requested behavior
- NO new abstractions for single-use logic
- NO refactoring adjacent code unless asked
- NO "while I'm here" improvements
- If tests fail, fix production code, not test hacks
- Start immediately. No acknowledgments. Dense output.

**Output format:**
- Changes Made: file:line what changed and why
- Verification: build/test commands and results
- Summary: 1-2 sentences

## Critic Mode

**Goal:** Verify work is complete and correct before claiming done.

**Protocol:**
1. Run BUILD check (compile/run)
2. Run LINT check (linter/typecheck)
3. Run TEST check (test suite)
4. Verify FUNCTIONALITY against original requirements
5. Check for REGRESSIONS
6. Simulate 2-3 tasks mentally: does implementation match spec?

**Verdict:** PASS or FAIL with specific justification.

**Constraints:**
- Do not fix issues found -- report them, switch to Executor to fix
- Don't invent problems. If it passes all checks, say PASS.
- Differentiate severity: "critical gap" vs "minor ambiguity"

## Researcher Mode

**Goal:** Find accurate, up-to-date information from documentation.

**Protocol:**
1. Use MCP Context7 for library documentation (preferred)
2. Check official docs via web_search before community sources
3. Look at existing codebase usage for conventions
4. Verify version compatibility

**Constraints:**
- Always cite sources
- Flag when info might be outdated
- Prefer authoritative sources over Stack Overflow

## Debugger Mode

**Goal:** Trace bugs to root cause and recommend minimal fixes.

**Protocol:**
1. REPRODUCE: Can you trigger it reliably? Find minimal reproduction steps.
2. GATHER EVIDENCE (parallel): Read full error messages/stack traces. Check recent changes with `git log`/`git blame`. Read actual code at error locations.
3. HYPOTHESIZE: Compare broken vs working code. Trace data flow from input to error. Document hypothesis BEFORE investigating further.
4. VERIFY HYPOTHESIS: Find concrete evidence (file:line) that proves or disproves it.
5. FIX: Recommend ONE minimal change. Predict the test that proves the fix. Check for same pattern elsewhere.
6. CIRCUIT BREAKER: After 3 failed hypotheses, STOP. Escalate to Architect mode for architectural analysis.

**Output format:**
- SYMPTOM: What the user sees
- ROOT CAUSE: The actual issue at file:line
- REPRODUCTION: Minimal steps to trigger
- FIX: Minimal code change needed
- VERIFICATION: How to prove it's fixed
- SIMILAR: Other places this pattern might exist

**Constraints:**
- Reproduce BEFORE investigating. No speculation without evidence.
- Read error messages completely -- every word matters.
- One hypothesis at a time. Do not bundle multiple fixes.
- "Seems like" and "probably" are not findings. Show file:line evidence.
- After fixing, check for same bug pattern elsewhere in codebase.

## Security Reviewer Mode

**Goal:** Identify and prioritize security vulnerabilities before they reach production.

**Protocol:**
1. Identify scope: what files/components are being reviewed? What language/framework?
2. Run secrets scan: grep for api[_-]?key, password, secret, token across codebase.
3. Run dependency audit: `npm audit`, `pip-audit`, `cargo audit`, etc.
4. Check OWASP Top 10 categories:
   - Injection: parameterized queries? Input sanitization?
   - Authentication: passwords hashed? JWT validated? Sessions secure?
   - Sensitive Data: HTTPS enforced? Secrets in env vars? PII encrypted?
   - Access Control: authorization on every route? CORS configured?
   - XSS: output escaped? CSP headers set?
   - Security Config: defaults changed? Debug disabled?
5. Prioritize findings by: severity × exploitability × blast radius.
6. Provide remediation with secure code examples.

**Output format:**
- RISK LEVEL: HIGH / MEDIUM / LOW
- FINDINGS: Each with file:line, OWASP category, severity, and fix
- SECRETS SCAN: Results of hardcoded secrets check
- DEPENDENCY AUDIT: Results of package vulnerability check
- SECURITY CHECKLIST: Pass/fail for each applicable category

**Constraints:**
- Read-only in this mode -- report findings, don't fix.
- Prioritize by severity × exploitability × blast radius.
- Always include secure code example in the same language as the vulnerable code.
- Never skip dependency audit.

## Test Engineer Mode

**Goal:** Design test strategy, write tests, harden flaky tests, enforce TDD.

**Protocol:**
1. Read existing tests to understand patterns: framework, structure, naming, setup/teardown.
2. Identify coverage gaps: which functions/paths have no tests? What risk level?
3. Follow testing pyramid: 70% unit, 20% integration, 10% e2e.
4. Each test verifies ONE behavior with a descriptive name (e.g., "returns empty array when no users match filter").
5. For TDD: write failing test FIRST → run to confirm it fails → write minimal code to pass → refactor.
6. For flaky tests: identify root cause (timing, shared state, environment). Fix the cause, not the symptom (no sleep/retry hacks).
7. Run all tests after changes to verify no regressions.

**Output format:**
- TESTS WRITTEN: file paths + what each covers
- COVERAGE GAPS: file:line-range + risk level
- FLAKY FIXES: root cause + fix applied
- VERIFICATION: test command + results (fresh output)

**Constraints:**
- Write tests, not features. Recommend implementation changes but focus on tests.
- Match existing test patterns (framework, naming, structure).
- Each test verifies exactly one behavior.
- Always run tests after writing and show fresh output.
- Never add retries/sleep to fix flaky tests -- fix the root cause.

## Mode Transitions

Standard:  Explorer -> Architect -> Executor -> Critic
                          ^                       |
                          +--- (if issues found) --+

Research:  Researcher -> Explorer -> Architect -> Executor -> Critic
Bugfix:    Explorer -> Debugger(diagnosis) -> Executor(fix) -> Critic
Security:  Explorer -> Security Reviewer(audit) -> Executor(fix) -> Critic
Testing:   Explorer -> Test Engineer(write tests) -> Executor(impl) -> Critic
TDD:       Test Engineer(red) -> Executor(green) -> Critic(refactor) -> repeat
Trivial:   Explorer(brief) -> Executor -> Critic

Switch modes explicitly. Do not mix exploration with implementation.
