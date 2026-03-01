# oh-my-warp

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Warp](https://img.shields.io/badge/Warp-Terminal-00D4AA?logo=warp)](https://warp.dev)

> **Your Warp is not alone.**

**English** | [한국어](README-ko.md)

A curated enhancement toolkit for [Warp](https://warp.dev) terminal agents
Inspired by the [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) philosophy of structured AI agent workflows.

## What's Inside

| Component | Description | Count |
|-----------|-------------|-------|
| **Skills** | Structured agent workflow system with role-based modes | 1 skill (5 files) |
| **WARP.md Template** | Universal project rules with OMC-inspired best practices | 1 template |
| **Workflows** | Reusable command shortcuts for git, docker, project setup | 3 workflow files |
| **Theme** | Dark theme with teal accents (Tokyo Night inspired) | 1 theme |
| **Launch Config** | Multi-tab dev workspace layout | 1 config |
| **Global Rules** | Copy-paste rules for Warp Drive | 9 rules |
| **MCP Configs** | Recommended MCP server configurations | 7 servers |

## Requirements

- [Warp terminal](https://warp.dev) installed and running
- Git
- (Optional) Node.js — for MCP servers that use `npx`
- (Optional) Docker — for GitHub MCP server

## Getting Started

> **New to oh-my-warp?** Start with the beginner-friendly guides:
> - [Getting Started (English)](docs/getting-started.md)
> - [시작하기 (한국어)](docs/getting-started-ko.md)

### Windows (PowerShell)

```powershell
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp

# Full install (run as Administrator for skills)
.\setup.ps1

# Without skills (no admin needed)
.\setup.ps1 -SkipSkills
```

### macOS / Linux

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
chmod +x setup.sh
./setup.sh
```

### Post-Install (Manual Steps)

1. **Global Rules** — Copy rules from `rules/global-rules.md` using Warp's `/add-rule` command
2. **MCP Servers** — Add configs from `mcp/recommended.json` via Settings > MCP Servers
3. **WARP.md** — Copy `templates/WARP.md` to your project root and edit the `[CUSTOMIZE]` sections
4. **Theme** — Select "Oz Dark" in Settings > Appearance > Themes

> See [docs/installation.md](docs/installation.md) for detailed paths per OS and uninstall instructions.

## Components

### `oz-supercharged` Skill

The core of oh-my-warp. Teaches Warp's agent (Oz) to follow the **EXPLORE → PLAN → EXECUTE → VERIFY** pipeline:

- **8 Agent Modes** — Explorer, Architect, Executor, Critic, Researcher, Debugger, Security Reviewer, Test Engineer
- **Keyword Triggers** — `autopilot`, `ultrawork`, `eco`, `plan`, `deepinit`, `review`, `research`, `debug`, `tdd`, `fix build`, `security review`
- **Verification Protocol** — BUILD → LINT → TEST → FUNCTIONALITY with QA cycling
- **Deepinit** — Generate per-directory `AGENTS.md` files for codebase onboarding
- **Escalation** — 3-failure circuit breaker with structured escalation rules

### WARP.md Template

A universal project rules template combining:

- Warp official structure (Project Overview, Core Architecture, Key Components, etc.)
- OMC principles (Workflow Phases, Verification Protocol, Goal-Driven Execution)
- Karpathy Guidelines (Simplicity First, Surgical Changes)
- Best practices (Testing, Security, Git Workflow)

### Workflows

Pre-built YAML workflows accessible via Warp's Command Palette (`oh-my-warp` tag):

| Workflow | Commands |
|----------|----------|
| **git-essentials** | Status+diff, compact log, conventional commits, stash, branch cleanup, full diff |
| **docker-dev** | Compose up/down/logs/rebuild, system prune, exec shell |
| **project-setup** | Node.js init, Python init, WARP.md init, .gitignore generator |

### Theme, Launch Config, Global Rules, MCP

- **Oz Dark** — Dark theme with teal accents, inspired by Tokyo Night
- **Dev Workspace** — Multi-tab layout (Code, Server, Tests, Terminal)
- **9 Global Rules** — Agent Workflow, Coding Standards, Communication, Security, Git, Testing, Secrets, Debugging, Completion
- **7 MCP Servers** — Context7, GitHub, Notion, Puppeteer, Linear, Sentry, Atlassian

## How It Works

oh-my-warp leverages every customization surface Warp exposes:

| Surface | Method | Setup |
|---------|--------|-------|
| Skills | `SKILL.md` in Warp's resources directory | Automated (setup script) |
| Workflows | YAML in Warp's workflow directory | Automated (setup script) |
| Themes | YAML in Warp's theme directory | Automated (setup script) |
| Launch Configs | YAML in Warp's config directory | Automated (setup script) |
| Project Rules | `WARP.md` in project root | Template provided |
| Global Rules | Warp Drive UI (`/add-rule`) | Copy-paste provided |
| MCP Servers | Warp Settings UI | JSON configs provided |

## File Structure

```
oh-my-warp/
├── setup.ps1 / setup.sh        # Installers (Windows / macOS+Linux)
├── skills/oz-supercharged/      # Agent skill (SKILL.md + 4 reference docs)
├── templates/WARP.md            # Project rules template
├── workflows/                   # git-essentials, docker-dev, project-setup
├── themes/oz-dark.yaml          # Tokyo Night-inspired dark theme
├── launch-configs/              # Dev workspace multi-tab layout
├── rules/global-rules.md        # 9 copy-paste rules for Warp Drive
├── mcp/recommended.json         # 7 MCP server configurations
└── docs/                        # Guides, tips, customization
```

## Customization

See [docs/customization.md](docs/customization.md) — custom skills, workflows, themes, and WARP.md templates.

See [docs/tips.md](docs/tips.md) — Agent Profiles (YOLO vs Strategic), CLI automation, parallel agents, PR review prompts, context budget management, TDD, debugging workflows.

## Philosophy

This project adapts the [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) multi-agent workflow philosophy for Warp's single-agent architecture. Instead of orchestrating multiple AI agents, we teach one agent (Oz) to switch roles and follow disciplined workflows:

1. **Explore** before acting — understand context first
2. **Plan** before executing — think before you code
3. **Verify** after implementing — trust but verify
4. **Minimal changes** — do what's needed, nothing more
5. **Evidence** over assumptions — show, don't tell

## Contributing

Contributions welcome! See [docs/customization.md](docs/customization.md) for how to create skills, workflows, and themes.

1. Fork the repository
2. Create a feature branch (`git checkout -b feat/my-feature`)
3. Commit with conventional format (`feat(scope): description`)
4. Submit a pull request

## Credits

Inspired by the work of **[Yeachan-Heo (Bellman)](https://github.com/Yeachan-Heo)**:

- **[oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode)** — Multi-agent orchestration for Claude Code with 30+ agents, 40+ skills, and the EXPLORE → PLAN → EXECUTE → VERIFY pipeline.
- **[oh-my-codex](https://github.com/Yeachan-Heo/oh-my-codex)** — The same philosophy adapted for OpenAI Codex CLI.

If you find oh-my-warp useful, consider starring the original projects above.

## License

[MIT](LICENSE)
