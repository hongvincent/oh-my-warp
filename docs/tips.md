# Power Tips

**English** | [한국어](tips-ko.md)

This guide focuses on **official local Oz features** that give you the most leverage inside Warp.

## 1. Build the Right Agent Profiles

Profiles let you tune autonomy, models, command permissions, and MCP access for different situations.

### Prod mode profile

Use for unfamiliar repositories or sensitive environments.

**Suggested settings**
- Code diffs: `Always ask`
- Read files: `Agent decides`
- Create plans: `Agent decides`
- Execute commands: `Always ask`
- Full Terminal Use writes: `Always ask`
- MCP servers: allow only the ones you trust

### Default profile

Use for normal development in a local repository you trust.

**Suggested settings**
- Code diffs: `Agent decides`
- Read files: `Always allow`
- Create plans: `Always allow`
- Execute commands: `Agent decides`
- Full Terminal Use writes: `Ask on first write`

### YOLO mode profile

Use only for throwaway or highly trusted local work.

**Suggested settings**
- Most permissions: `Always allow`
- Keep a command denylist for destructive commands you never want silently approved

### Useful allowlist starters

```regex
which .*
ls(\\s.*)?
grep(\\s.*)?
find .*
git (status|log|diff|branch|show|blame).*
npm (run|test|list|outdated).*
python -m pytest.*
ruff .*
```

### CLI usage

```bash
# List available profiles
oz agent profile list

# Run with a specific profile
oz agent run --profile <PROFILE_ID> --prompt "analyze this repository"
```

## 2. Lean on `/plan` and Task Lists

Warp's built-in planning and task lists are the safest way to structure larger changes.

- Use `/plan` for anything multi-step or unclear
- Let Oz create task lists automatically for complex requests
- Reopen plans and task lists while the work is running
- Revise the plan if the shape of the work changes

Example prompts:

```text
/plan Refactor the local install flow to use official skill discovery paths.
```

```text
Implement phase 1 of the current plan and stop after updating the docs.
```

## 3. Use Full Terminal Use for Interactive Work

Full Terminal Use is the official way to let Oz operate inside REPLs, debuggers, database shells, and dev servers.

Good fits:
- `npm run dev`
- `python`
- `psql`
- `gdb`
- long-running local servers

Useful controls:
- `⌘I` on macOS / `Ctrl+I` on Windows and Linux: switch between shell and agent input when needed
- `⌘⇧I` on macOS / `Ctrl+Shift+I` on Windows and Linux: toggle auto-accept while the task is running

Use it when the task depends on observing live terminal state, not just static files.

## 4. Review Non-trivial Changes in Code Review

For Git-indexed repositories, let Oz generate diffs and inspect them in Warp's code review flow.

Best practices:
- Ask Oz to surface a diff instead of blindly applying it
- Leave inline comments on specific hunks
- Batch comments, then ask Oz to address them in one pass
- Repeat until the diff is clean

Example prompt:

```text
/code-review-local Review the current diff for logic risks and suggest follow-up comments I should leave.
```

## 5. Keep Codebase Context Healthy

Codebase Context is one of the biggest quality multipliers for local Oz work.

Recommendations:
- Work in Git-indexed repositories
- Keep indexing enabled in Warp's code settings
- Add `.warpindexingignore` when a repository is too large or contains noisy generated files
- Mention exact repo names when using multi-repo context

For large repositories, use ignore files aggressively:
- `.gitignore`
- `.warpindexingignore`
- `.cursorignore`
- `.cursorindexingignore`

## 6. Use MCP as the Tool Layer

Treat MCP servers as Warp's plugin layer for local Oz.

Suggested bundle:
- **Context7** for up-to-date docs
- **GitHub** for repository, PR, and issue context
- **Linear / Sentry / Atlassian / Notion** only when you actively use them

CLI example:

```bash
oz agent run --mcp ./mcp/recommended.json --prompt "Use Context7 to review the latest Warp skills documentation."
```

If you do not need every server, create a smaller JSON file and pass that instead.

## 7. Use `oz agent run` for Headless Local Work

The local CLI is useful for repeatable repository work, scripted verification, or running the same task under different profiles.

Examples:

```bash
oz agent run --prompt "summarize the current directory"
```

```bash
oz agent run --profile <PROFILE_ID> --prompt "run tests and explain the failures"
```

```bash
oz agent run --mcp ./mcp/recommended.json --prompt "look up the current SDK docs before editing code"
```

## 8. Parallelize Safely with Tabs and Launch Configurations

If you want safe local parallelism without undocumented orchestration, use multiple Warp tabs and launch configurations.

A practical pattern:
1. Tab 1: active coding task
2. Tab 2: tests or dev server
3. Tab 3: research or docs task

Use launch configurations to recreate that layout quickly.

## 9. Keep `WARP.md` Concrete

The fastest way to improve results is to make `WARP.md` specific.

### Development commands

```markdown
## Development Commands

### Setup
npm install

### Dev
npm run dev

### Build
npm run build

### Test
npm run test

### Lint
npm run lint
npm run typecheck
```

### Key components

```markdown
## Key Components
- `src/auth/` — Authentication and session logic
- `src/api/routes/` — HTTP routes
- `src/db/models/` — Database models
- `src/lib/` — Shared utilities
```

## 10. Use the Bundled Skills Intentionally

The skill pack in this repository is small on purpose.

- `/local-workflow` for structured local implementation
- `/research-local` for docs and codebase research
- `/debug-local` for bug reproduction and diagnosis
- `/tdd-local` for test-first work
- `/build-fix-local` for build or typecheck failures
- `/code-review-local` for local diff review

Use built-in Oz features first, and use skills to make those features easier to invoke consistently.
