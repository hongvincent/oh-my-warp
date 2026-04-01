# Installation Guide

**English** | [한국어](installation-ko.md)

## Prerequisites

- [Warp terminal](https://warp.dev) installed
- Git

## Automated Installation

### Windows

```powershell
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
.\setup.ps1
```

### macOS / Linux

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
chmod +x setup.sh
./setup.sh
```

## What Gets Installed Where

### Windows

| Component | Path |
|-----------|------|
| Skills | `%USERPROFILE%\\.agents\\skills\\` |
| Workflows | `%APPDATA%\\warp\\Warp\\data\\workflows\\` |
| Themes | `%APPDATA%\\warp\\Warp\\data\\themes\\` |
| Launch Configs | `%APPDATA%\\warp\\Warp\\data\\launch_configurations\\` |
| WARP.md template | `%USERPROFILE%\\.warp\\templates\\` |

### macOS

| Component | Path |
|-----------|------|
| Skills | `~/.agents/skills/` |
| Workflows | `~/.warp/workflows/` |
| Themes | `~/.warp/themes/` |
| Launch Configs | `~/.warp/launch_configurations/` |
| WARP.md template | `~/.warp/templates/` |

### Linux

| Component | Path |
|-----------|------|
| Skills | `~/.agents/skills/` |
| Workflows | `~/.local/share/warp-terminal/workflows/` |
| Themes | `~/.local/share/warp-terminal/themes/` |
| Launch Configs | `~/.local/share/warp-terminal/launch_configurations/` |
| WARP.md template | `~/.warp/templates/` |

## Project-scoped Alternative

If you do not want global skills, copy a skill folder into a repository-local `.agents/skills/` directory instead.
Example on Windows:

```powershell
New-Item -ItemType Directory -Force -Path "C:\path\to\project\.agents\skills"
Copy-Item -Recurse ".agents\skills\local-workflow" "C:\path\to\project\.agents\skills\"
```

Example on macOS / Linux:

```bash
mkdir -p /path/to/project/.agents/skills
cp -R .agents/skills/local-workflow /path/to/project/.agents/skills/
```

## Manual UI Steps

Some local Oz surfaces are intentionally managed in Warp's UI.

### 1. Global Rules

Open Warp and type `/add-rule`, then paste rules from `rules/global-rules.md`.

### 2. MCP Servers

Open Warp's MCP server settings and add the configs from `mcp/recommended.json`.

### 3. WARP.md for Your Projects

Copy `templates/WARP.md` into a project root and edit the `[CUSTOMIZE]` sections:

```powershell
Copy-Item "$HOME\.warp\templates\WARP.md" "C:\path\to\your\project\WARP.md"
```

```bash
cp ~/.warp/templates/WARP.md /path/to/your/project/WARP.md
```

### 4. Profiles

Create or adjust a local profile in Warp so your permissions match the way you work.

Useful profile styles:
- Prod mode
- Default
- YOLO mode for trusted sandboxes

## Uninstall

Remove the installed files from the paths above. The setup scripts only copy files; they do not mutate existing Warp state outside those destinations.
