# Customization Guide

**English** | [한국어](customization-ko.md)

## Add Your Own Skills

Skills are reusable `SKILL.md` files that Oz discovers automatically.

### Recommended locations

Use the official skill discovery directories:

- **Project-scoped**: `.agents/skills/`
- **Global**: `~/.agents/skills/`

Warp also recognizes compatible directories such as `.warp/skills/`, `.claude/skills/`, `.codex/skills/`, and similar tool-specific paths, but `.agents/skills/` is the clearest default.

### Structure

```text
.agents/
└── skills/
    └── my-skill/
        ├── SKILL.md
        └── references/
            └── extra-context.md
```

### SKILL.md format

```markdown
---
name: my-skill
description: Brief description of what this skill does and when to use it
---

# My Skill

## When to use
Explain the situations where the skill helps.

## Instructions
Provide clear steps for the agent to follow.
```

### Install options

- **Global install**: copy the skill folder into `~/.agents/skills/`
- **Project install**: copy the skill folder into `.agents/skills/` inside a repository

Project-scoped skills are great for team conventions. Global skills are useful for personal workflows you want across projects.

## Create Custom Workflows

Workflows are YAML files for repeatable commands.

### Locations

- **Windows**: `%APPDATA%\\warp\\Warp\\data\\workflows\\`
- **macOS**: `~/.warp/workflows/`
- **Linux**: `~/.local/share/warp-terminal/workflows/`
- **Repository scoped**: `.warp/workflows/`

### Format

```yaml
---
name: My Workflow
command: echo "Hello {{name}}"
tags: ["my-tag"]
arguments:
  - name: name
    description: "Your name"
    default_value: "World"
```

Use repository workflows when the command belongs to a codebase. Use local workflows for personal automation.

## Modify the WARP.md Template

Edit `templates/WARP.md` to add your defaults:

1. Fill in the `[CUSTOMIZE]` sections
2. Add project commands and conventions
3. Re-run `setup.ps1` or `setup.sh` if you want to refresh the globally installed template

## Build Custom Themes

Themes are YAML files placed in Warp's theme directories:

- **Windows**: `%APPDATA%\\warp\\Warp\\data\\themes\\`
- **macOS**: `~/.warp/themes/`
- **Linux**: `~/.local/share/warp-terminal/themes/`

Example:

```yaml
name: My Theme
accent: '#hex'
cursor: '#hex'
background: '#hex'
foreground: '#hex'
details: darker
terminal_colors:
  bright:
    black: '#hex'
    red: '#hex'
    green: '#hex'
    yellow: '#hex'
    blue: '#hex'
    magenta: '#hex'
    cyan: '#hex'
    white: '#hex'
  normal:
    black: '#hex'
    red: '#hex'
    green: '#hex'
    yellow: '#hex'
    blue: '#hex'
    magenta: '#hex'
    cyan: '#hex'
    white: '#hex'
```

## Create Launch Configurations

Launch configurations define multi-tab or multi-pane local workspaces.

### Locations

- **Windows**: `%APPDATA%\\warp\\Warp\\data\\launch_configurations\\`
- **macOS**: `~/.warp/launch_configurations/`
- **Linux**: `~/.local/share/warp-terminal/launch_configurations/`

### Format

```yaml
---
name: My Workspace
windows:
  - tabs:
      - title: Tab Name
        layout:
          cwd: /absolute/path
          commands:
            - exec: command-to-run
        color: blue
```

## Rules and MCP Servers

Rules and MCP servers are part of the local Oz workflow too, but they are typically managed through Warp's UI:

- **Rules**: add via `/add-rule` or Warp Drive rule management
- **MCP Servers**: add in Warp's MCP settings, or pass a JSON config to `oz agent run --mcp`

Keep skills focused on behavior, rules focused on constraints, and MCP focused on external tools.

## Contribute Back

If you create useful skills, workflows, themes, or launch configs:

1. Fork the repository
2. Add files in the appropriate directory
3. Update the docs if behavior changes
4. Open a pull request
