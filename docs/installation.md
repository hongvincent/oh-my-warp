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

**Skills require Administrator privileges** because they install to `C:\Program Files\Warp\resources\skills\`. To skip skills:

```powershell
.\setup.ps1 -SkipSkills
```

### macOS / Linux

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
chmod +x setup.sh
./setup.sh
```

## What Gets Installed Where

### Windows Paths

| Component | Path |
|-----------|------|
| Skills | `C:\Program Files\Warp\resources\skills\oz-supercharged\` |
| Workflows | `%APPDATA%\warp\Warp\data\workflows\` |
| Themes | `%APPDATA%\warp\Warp\data\themes\` |
| Launch Configs | `%APPDATA%\warp\Warp\data\launch_configurations\` |
| WARP.md template | `%USERPROFILE%\.warp\templates\` |

### macOS Paths

| Component | Path |
|-----------|------|
| Workflows | `~/.warp/workflows/` |
| Themes | `~/.warp/themes/` |
| Launch Configs | `~/.warp/launch_configurations/` |
| WARP.md template | `~/.warp/templates/` |

### Linux Paths

| Component | Path |
|-----------|------|
| Workflows | `~/.local/share/warp-terminal/workflows/` |
| Themes | `~/.local/share/warp-terminal/themes/` |
| Launch Configs | `~/.local/share/warp-terminal/launch_configurations/` |
| WARP.md template | `~/.warp/templates/` |

## Manual Steps

These cannot be automated (Warp only supports them via UI):

### 1. Global Rules

Open Warp and type `/add-rule`, then paste each rule from `rules/global-rules.md`.

Alternatively: Settings > AI > Knowledge > Manage Rules.

### 2. MCP Servers

Settings > MCP Servers > Add the configurations from `mcp/recommended.json`.

### 3. WARP.md for Your Projects

Copy `templates/WARP.md` to any project root and edit the `[CUSTOMIZE]` sections:

```bash
cp ~/.warp/templates/WARP.md /path/to/your/project/WARP.md
```

Or use the workflow: Command Palette > search "Init WARP.md from Template".

## Uninstalling

Remove the installed files from the paths listed above. The setup script does not modify any existing Warp configuration.
