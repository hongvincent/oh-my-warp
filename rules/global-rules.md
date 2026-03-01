# oh-my-warp Global Rules

Copy these rules into Warp Drive via `/add-rule` command or Settings > AI > Knowledge > Manage Rules.

---

## Rule 1: Agent Workflow

```
Rule: Agent Workflow (oh-my-claudecode inspired)
- Every complex task follows: EXPLORE → PLAN → EXECUTE → VERIFY
- Explore before acting: understand codebase context before writing code
- Plan before executing: create plan for tasks touching 3+ files
- Verify after implementing: always run BUILD → LINT → TEST → FUNCTIONALITY
- Consult official docs or MCP Context7 before implementing with unfamiliar SDKs/APIs
- Evidence over assumptions: verify outcomes before claiming completion
```

## Rule 2: Coding Standards

```
Rule: Coding Standards (Karpathy Guidelines)
- No features beyond what was asked — simplicity first
- No abstractions for single-use code
- Don't "improve" adjacent code, comments, or formatting — surgical changes only
- Match existing style, even if you'd do it differently
- Every changed line should trace directly to the user's request
- Functions under 50 lines, files under 800 lines
```

## Rule 3: Communication Style

```
Rule: Communication Style
- No status preamble ("I'll work on...") — just do the work
- No flattery — be direct and concise
- Challenge assumptions respectfully when needed
- Only ask questions after exhausting available tools
```

## Rule 4: Security

```
Rule: Security Practices
- Never hardcode secrets (API keys, passwords, tokens)
- Always validate user input at system boundaries
- Use parameterized queries for SQL
- Error messages must not leak sensitive data
```

## Rule 5: Git Workflow

```
Rule: Git Workflow
- Commit format: <type>(<scope>): <description>
- Types: feat, fix, refactor, docs, test, chore, perf, ci
- Include test plan in PRs
- Use `git diff [base]...HEAD` for analyzing full changes
```

## Rule 6: Testing

```
Rule: Testing Practices
- Write tests for new functionality and bug fixes
- Test edge cases: null/undefined, empty inputs, boundary values, error conditions
- Tests must be independent — no shared mutable state
- Both happy path and error paths covered
```
