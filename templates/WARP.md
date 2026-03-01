# WARP.md

This file provides guidance to Warp agents when working with code in this repository.

## Agent Workflow (oh-my-claudecode inspired)

### Core Principles
1. **Explore before acting** — understand codebase context before writing code
2. **Plan before executing** — create plan for tasks touching 3+ files
3. **Verify after implementing** — run build, lint, tests after changes
4. **Consult docs for SDKs/APIs** — use MCP Context7 or official docs first
5. **Minimal changes** — no drive-by refactoring, no scope creep
6. **Evidence over assumptions** — verify outcomes before final claims

### Workflow Phases
Every complex task follows: **EXPLORE → PLAN → EXECUTE → VERIFY**

### Verification Protocol
After implementation, always run in order:
1. BUILD — compile/run check
2. LINT — linter/typecheck (check package.json scripts, Makefile, pyproject.toml)
3. TEST — test suite, check for regressions
4. FUNCTIONALITY — verify change meets requirements

### Goal-Driven Execution
Transform tasks into verifiable goals before implementing:
- "Add validation" → write tests for invalid inputs, then make them pass
- "Fix the bug" → write a test that reproduces it, then make it pass
- "Refactor X" → ensure tests pass before and after

### Debugging Protocol
- Reproduce before investigating — find minimal reproduction steps
- One hypothesis at a time — show file:line evidence, not speculation
- 3-failure circuit breaker: after 3 failed attempts, stop and reassess

### Completion Protocol
- Before claiming done: zero pending tasks, all requirements met, fresh test output shown
- "Should work" is not verification — show concrete command output as evidence
- If verification fails, continue working — do not claim completion

### Communication Style
- No status preamble ("I'll work on...") — just do the work
- No flattery — be direct and concise
- Challenge assumptions respectfully when needed
- Only ask questions after exhausting available tools

## Coding Standards

### Simplicity First (Karpathy Guidelines)
- No features beyond what was asked
- No abstractions for single-use code
- If you write 200 lines and it could be 50, rewrite it

### Surgical Changes
- Don't "improve" adjacent code, comments, or formatting
- Don't refactor things that aren't broken
- Match existing style, even if you'd do it differently
- Every changed line should trace directly to the user's request

### File Organization
- 200-400 lines typical, 800 max per file
- Organize by feature/domain, not by type
- Functions under 50 lines

### Error Handling
- Always handle errors comprehensively, never swallow exceptions
- Always validate user input at system boundaries

## Testing
- Write tests for new functionality and bug fixes
- Test edge cases: null/undefined, empty inputs, boundary values, error conditions
- Tests must be independent — no shared mutable state
- Both happy path and error paths covered

## Security
- No hardcoded secrets (API keys, passwords, tokens)
- All user inputs validated
- Parameterized queries for SQL
- Error messages don't leak sensitive data

## Git Workflow
- Commit format: `<type>(<scope>): <description>`
- Types: feat, fix, refactor, docs, test, chore, perf, ci
- Include test plan in PRs
- Use `git diff [base]...HEAD` for analyzing full changes

## Project Overview
<!-- [CUSTOMIZE] Describe your project's purpose and tech stack -->

## Core Architecture
<!-- [CUSTOMIZE] Frontend, Backend, Database, Deployment, Styling -->

## Key Components
<!-- [CUSTOMIZE] List main modules/files with brief descriptions -->

## Development Commands
<!-- [CUSTOMIZE] Add setup, dev, build, test commands -->

## Architecture Notes
<!-- [CUSTOMIZE] Important patterns, data flow, or design decisions -->
