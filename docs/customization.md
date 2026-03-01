# Customization Guide

**English** | [한국어](customization-ko.md)

## Adding Your Own Skills

Skills are `SKILL.md` files that Warp loads to give the agent specialized capabilities.

### Structure

```
skills/
└── my-skill/
    ├── SKILL.md
    └── references/
        └── extra-context.md
```

### SKILL.md Format

```markdown
---
name: my-skill
description: >
  What the skill does and when to use it.
  Include trigger keywords that activate this skill.
---

# My Skill

Instructions for the agent when this skill is activated.
```

### Installation

Copy the skill folder to Warp's skills directory:

- **Windows**: `C:\Program Files\Warp\resources\skills\` (requires Admin)
- **macOS/Linux**: Check Warp docs for the current path

## Creating Custom Workflows

Workflows are YAML files that define reusable commands.

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

### Installation

Place `.yaml` files in:

- **Windows**: `%APPDATA%\warp\Warp\data\workflows\`
- **macOS**: `~/.warp/workflows/`
- **Linux**: `~/.local/share/warp-terminal/workflows/`

Or in your repo: `.warp/workflows/` (loaded when repo is active).

## Modifying the WARP.md Template

Edit `templates/WARP.md` to add your organization's standards:

1. Fill in the `[CUSTOMIZE]` sections with your defaults
2. Add any language-specific conventions
3. Add your standard dev commands
4. Re-run `setup.ps1` or `setup.sh` to update the installed template

## Building Custom Themes

Themes are YAML files with color definitions.

### Format

```yaml
name: My Theme
accent: '#hex'
cursor: '#hex'
background: '#hex'
foreground: '#hex'
details: darker  # or 'lighter'
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

### Background Images

Add a background image (JPG only):

```yaml
background_image:
  path: my-image.jpg  # relative to themes directory
  opacity: 60         # 0-100
```

### Installation

Place `.yaml` files in:

- **Windows**: `%APPDATA%\warp\Warp\data\themes\`
- **macOS**: `~/.warp/themes/`
- **Linux**: `~/.local/share/warp-terminal/themes/`

Then select in Settings > Appearance > Themes.

## Creating Launch Configurations

Launch configs define multi-window/tab layouts.

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

### Installation

Place `.yaml` files in:

- **Windows**: `%APPDATA%\warp\Warp\data\launch_configurations\`
- **macOS**: `~/.warp/launch_configurations/`
- **Linux**: `~/.local/share/warp-terminal/launch_configurations/`

## Contributing Back

If you create useful skills, workflows, or themes, consider adding them to this repo:

1. Fork the repository
2. Add your files to the appropriate directory
3. Update README.md if adding a new component
4. Submit a pull request
