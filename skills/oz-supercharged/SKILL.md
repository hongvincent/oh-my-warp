---
name: oz-supercharged
description: >
  Supercharged agent workflow system inspired by oh-my-claudecode.
  Activates structured multi-phase development workflows with role-based
  mode switching (Explorer, Architect, Executor, Critic, Researcher),
  verification protocols, and efficiency optimization.
  Use this skill when: (1) building new features or projects,
  (2) debugging complex issues, (3) refactoring code,
  (4) reviewing implementations, (5) onboarding to a codebase.
  Trigger keywords: autopilot, ultrawork, deep work, eco mode,
  plan, analyze, explore, review, verify, deepinit, map codebase,
  structured workflow, thorough, fullstack, refactor, research.
---

# Oz Supercharged

Structured development workflow system. Follow these principles and phases for every non-trivial task.

## Core Rules

1. **Explore before acting** -- Always understand the codebase context before writing code. Read relevant files, check conventions, find patterns.
2. **Plan before executing** -- For tasks touching 3+ files or involving architecture decisions, create a plan and get user approval before coding.
3. **Verify after implementing** -- Run build, lint, tests after changes. Never assume code works without checking.
4. **Consult docs for SDKs/APIs** -- Use MCP Context7 or official documentation before implementing with unfamiliar libraries.
5. **Minimal changes** -- Do exactly what's needed. No drive-by refactoring, no scope creep, no "while I'm here" changes.
6. **Stay in your lane** -- Don't mix exploration with implementation. Complete one phase before starting the next.

## Workflow Phases

Every complex task follows this pipeline:

```
EXPLORE -> PLAN -> EXECUTE -> VERIFY
```

### Phase 1: Explore
Switch to Explorer mode. See [agent-modes.md](references/agent-modes.md).
- Map relevant files and directory structure
- Identify patterns, conventions, dependencies
- Check for existing similar implementations
- Read AGENTS.md files if present in the project

### Phase 2: Plan
Switch to Architect mode. See [agent-modes.md](references/agent-modes.md).
- Analyze findings from exploration
- Design the approach with rationale
- Create implementation plan using create_plan tool
- Wait for user approval on non-trivial changes

### Phase 3: Execute
Switch to Executor mode. See [agent-modes.md](references/agent-modes.md).
- Follow the plan precisely
- Use TODO list for 3+ step tasks
- Make targeted, minimal changes
- Use appropriate task template from [task-templates.md](references/task-templates.md)

### Phase 4: Verify
Switch to Critic mode. See [agent-modes.md](references/agent-modes.md).
- Run verification checklist: BUILD -> LINT -> TEST -> FUNCTIONALITY
- Report results clearly
- If issues found: loop back to Execute to fix, then re-verify

## Verification Protocol

After every implementation, run these checks in order:

1. **BUILD** -- Compile/run the project. Check for syntax errors.
2. **LINT** -- Run project linter or typecheck (npm run lint, ruff, cargo clippy, etc.)
3. **TEST** -- Run test suite. Check for regressions.
4. **FUNCTIONALITY** -- Verify the change meets original requirements.

Discover the correct commands by checking: README, package.json scripts, Makefile, pyproject.toml, or similar config files. Never assume test commands.

## Task Complexity Routing

Match effort to task complexity:

- **Trivial** (1-2 files, clear fix) -- Skip planning. Explore briefly -> Execute -> Verify.
- **Standard** (3-5 files, clear scope) -- Full workflow: Explore -> Plan -> Execute -> Verify.
- **Complex** (multi-system, unclear scope) -- Extended exploration. Detailed plan with user approval. Execute in stages. Thorough verification.

## Communication Style

- No status updates like "I'll work on..." -- just do the work
- No flattery or preamble -- be direct and concise
- Challenge assumptions respectfully when needed
- Only ask questions after exhausting available tools
- Present options with clear trade-offs, then recommend one

## Keyword Modes

### "autopilot" / "auto" / "handle it"
Full autonomous workflow. Execute all 4 phases without pausing for approval on each phase. Still verify at the end.

### "ultrawork" / "deep work" / "thorough"
Maximum thoroughness. Extended exploration, detailed planning, comprehensive verification. Read more files, check more edge cases.

### "eco" / "efficient" / "quick"
Token-efficient mode. Minimal exploration, skip planning for clear tasks, essential verification only. Prefer concise output.

### "plan" / "analyze"
Stop after Phase 2 (Plan). Present the plan for user review. Do not execute until approved.

### "deepinit" / "map codebase"
Generate AGENTS.md files for the project. See [deepinit-guide.md](references/deepinit-guide.md).

### "review" / "verify"
Run Critic mode on recent changes or specified code. See [agent-modes.md](references/agent-modes.md).

### "research" / "investigate"
Switch to Researcher mode. Focus on gathering information from docs, MCP, and codebase. See [agent-modes.md](references/agent-modes.md).

## Project Context Discovery

At the start of any complex task, look for these context sources in order:
1. AGENTS.md files in relevant directories
2. README.md at project root
3. WARP.md or similar project rules (CLAUDE.md, AGENT.md, .cursorrules)
4. package.json / pyproject.toml / Cargo.toml / go.mod (tech stack)
5. Existing test files (testing conventions)
6. .eslintrc / ruff.toml / similar (linting config)
7. CI config files (.github/workflows/, etc.)

## Anti-Patterns

Avoid these common mistakes:
- **Premature coding** -- Writing code before understanding the codebase
- **Scope creep** -- "Improving" code unrelated to the task
- **Assumption-driven development** -- Guessing instead of reading existing code
- **Skipping verification** -- Assuming changes work without running checks
- **Ignoring conventions** -- Using different patterns than the existing codebase
- **Over-engineering** -- Adding complexity for hypothetical future needs
