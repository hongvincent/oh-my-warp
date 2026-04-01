---
name: local-workflow
description: Structured local Oz workflow for multi-step coding tasks using official features such as Codebase Context, plans, task lists, MCP servers, Full Terminal Use, and code review
---

# Local Workflow

Use this skill for non-trivial **local** coding work in Warp.

## Workflow

1. **Explore first**
   - Read the relevant files
   - Use Codebase Context if indexing is available
   - Check `README.md`, `WARP.md`, tests, and project config files

2. **Create a plan when needed**
   - Use Warp's built-in `/plan` flow for tasks that touch multiple files
   - Keep the plan updated if the work changes

3. **Let Oz track execution**
   - Use built-in task lists for multi-step work
   - Keep changes minimal and tied to the original request

4. **Use MCP deliberately**
   - Prefer Context7 for unfamiliar SDKs and frameworks
   - Use GitHub or other servers only when they are relevant

5. **Use Full Terminal Use when the tool is interactive**
   - Dev servers
   - REPLs
   - database shells
   - debuggers

6. **Verify before claiming completion**
   - Build or compile check
   - Lint or typecheck
   - Tests
   - Functional confirmation against the original request

## Constraints

- Stay inside documented local Oz capabilities
- Do not assume custom hooks, tmux worker runtimes, or companion control planes
- Prefer the smallest viable diff
