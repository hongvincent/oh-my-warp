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
