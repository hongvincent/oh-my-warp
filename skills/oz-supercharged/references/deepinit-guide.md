# Deepinit: AGENTS.md Generation Guide

Generate per-directory `AGENTS.md` files that give AI agents instant context about every part of a codebase. This dramatically reduces exploration time on future tasks.

## When to Use

- Initial project onboarding
- After major directory restructuring
- When user says "deepinit", "map codebase", or "generate agents docs"

## Process

### Step 1: Map Directory Tree

Recursively list all directories, excluding:
- node_modules, .git, dist, build, __pycache__, .venv, coverage, .next, .nuxt

### Step 2: Analyze Each Directory

For each non-trivial directory:
1. Read key files to understand purpose
2. Identify patterns and conventions
3. Note dependencies (internal + external)
4. Determine testing approach

### Step 3: Generate AGENTS.md

Create one `AGENTS.md` per directory using this template:

```markdown
<!-- Parent: {relative_path_to_parent}/AGENTS.md -->
<!-- Generated: {timestamp} -->

# {Directory Name}

## Purpose
{One paragraph: what this directory contains and its role}

## Key Files
- `file.ts` — Brief description
- `file2.ts` — Brief description

## Subdirectories
- `subdir/` — What it contains (see `subdir/AGENTS.md`)

## For AI Agents

### Working Here
{Special instructions for AI agents modifying files in this directory}

### Testing
{How to test changes in this directory}

### Patterns
{Code patterns or conventions used here}

## Dependencies

### Internal
{References to other project directories this depends on}

### External
{Key packages/libraries used}
```

### Step 4: Validate Hierarchy

Verify parent references form a consistent tree:
- Every AGENTS.md (except root) references its parent
- All subdirectory links point to existing AGENTS.md files

## Minimal Template

For simple container directories:

```markdown
<!-- Parent: ../AGENTS.md -->
# {Directory Name}

## Purpose
Container for organizing related modules.

## Subdirectories
- `subdir/` — Description (see `subdir/AGENTS.md`)
```

## Tips

- Keep descriptions concise — one line per file, one paragraph per directory
- Focus on non-obvious information (conventions, gotchas, testing quirks)
- Update AGENTS.md when directory structure changes significantly
- Preserve any `<!-- MANUAL: -->` annotations on regeneration
