# Task Templates

Structured templates for consistent, high-quality task execution. Select the template matching your current phase.

## Exploration Template

Use when gathering context before making changes.

```
## TASK
[What needs to be explored]

## EXPECTED OUTCOME
[What findings to produce]

## SCOPE
- Files/dirs to search
- Patterns to look for
- Exclude: node_modules, .git, dist, build, __pycache__, .venv

## CONSTRAINTS
- Read-only — no modifications
- Document all findings before proposing changes
- Note architectural patterns and conventions observed
```

## Implementation Template

Use when writing or modifying code.

```
## TASK
[Implementation goal]

## CONTEXT
[Background from exploration phase]

## FILES
[Target files to create/modify]

## REQUIREMENTS
- [Specific requirement 1]
- [Specific requirement 2]

## CONSTRAINTS
- Follow existing code conventions
- No unrelated refactoring
- Each change must be independently verifiable

## VERIFICATION CHECKLIST
- [ ] Code compiles/runs without errors
- [ ] Existing tests still pass
- [ ] New tests added for new functionality
- [ ] Lint/typecheck passes
```

## Review Template

Use when verifying completed work.

```
## REVIEW TARGET
[What was implemented]

## VERIFICATION STEPS
1. Build/compile check
2. Lint/typecheck
3. Test execution
4. Functionality verification against requirements
5. Security review (if applicable)

## CRITERIA
- All requirements from implementation met
- No regressions introduced
- Code follows project conventions
- Edge cases handled
```

## Debugging Template

Use when diagnosing and fixing issues.

```
## SYMPTOM
[What's failing or unexpected]

## REPRODUCE
[Steps or command to reproduce]

## DIAGNOSIS APPROACH
1. Read error output carefully
2. Trace from error to root cause
3. Check recent changes (git diff)
4. Identify minimal fix

## FIX CONSTRAINTS
- Minimal changes only
- No architectural changes during bugfix
- Verify fix doesn't introduce new errors
- Add regression test if possible
```

## Research Template

Use when investigating external libraries, APIs, or documentation.

```
## QUESTION
[What needs to be answered]

## SOURCES
- Official documentation (prefer MCP Context7 if available)
- Existing codebase usage patterns
- Type definitions / interfaces

## OUTPUT FORMAT
- Concise summary of findings
- Code examples if applicable
- Recommended approach with rationale
```

## TDD Template

Use when building features test-first.

```
## FEATURE
[What behavior to implement]

## RED PHASE (write failing test)
- Test file: [path]
- Test name: [describes expected behavior, e.g. "rejects email without @ symbol"]
- Run test command — MUST FAIL
- If it passes, the test is wrong — fix the test

## GREEN PHASE (minimal implementation)
- Write ONLY enough code to make the test pass
- No extras. No "while I'm here."
- Run test — MUST PASS

## REFACTOR PHASE (clean up)
- Improve code quality without changing behavior
- Run tests after EVERY change — MUST STAY GREEN

## REPEAT
- Next failing test for the next behavior
- Continue cycle until feature is complete

## ENFORCEMENT
- Code written before test? DELETE IT. Write test first.
- Multiple features in one cycle? STOP. One test, one behavior.
- Skipping refactor? Go back. Clean up before next feature.
```

## Build Fix Template

Use when fixing build/compile/typecheck errors with minimal changes.

```
## ERRORS
[Paste or run build/typecheck output]

## STRATEGY
1. Collect all errors — run build or typecheck command
2. Categorize: type errors, import errors, missing deps, syntax errors
3. Fix one error at a time — verify no new errors after each fix
4. Stop when build passes (exit code 0)

## CONSTRAINTS
- NO refactoring of unrelated code
- NO architectural changes
- NO performance optimizations
- ONLY what's needed to make the build pass
- Minimal diff — fewest lines changed

## VERIFICATION
- [ ] Build/typecheck command exits with 0
- [ ] No new errors introduced
- [ ] Existing tests still pass
```

## Security Review Template

Use when auditing code for security vulnerabilities.

```
## SCOPE
[Files/components to review]

## SECRETS SCAN
- grep for: api[_-]?key, password, secret, token, credential
- Check: .env files tracked in git? Secrets in source code?

## DEPENDENCY AUDIT
- Run: npm audit / pip-audit / cargo audit / govulncheck
- Flag: known vulnerabilities, outdated packages

## OWASP TOP 10 CHECK
- [ ] Injection: parameterized queries? Input sanitized?
- [ ] Auth: passwords hashed? JWT validated? Sessions secure?
- [ ] Sensitive Data: HTTPS? Secrets in env vars? PII encrypted?
- [ ] Access Control: authorization on every route? CORS configured?
- [ ] XSS: output escaped? CSP headers?
- [ ] Security Config: debug disabled? Defaults changed?

## OUTPUT FORMAT
For each finding:
- Severity: CRITICAL / HIGH / MEDIUM / LOW
- Location: file:line
- OWASP category
- Issue description
- Remediation with secure code example

## PRIORITY
Rank by: severity × exploitability × blast radius
```
