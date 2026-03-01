# oh-my-warp

> Your Warp is not alone.

A curated enhancement toolkit for [Warp](https://warp.dev) terminal agents. Batteries-included skills, workflows, themes, and project rules — inspired by the [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) philosophy.

## What's Inside

| Component | Description | Count |
|-----------|-------------|-------|
| **Skills** | Structured agent workflow system with role-based modes | 1 skill (5 files) |
|| **WARP.md Template** | Universal project rules with OMC-inspired best practices | 1 template |
|| **Workflows** | Reusable command shortcuts for git, docker, project setup | 3 workflow files |
|| **Theme** | Dark theme with green accents (Tokyo Night inspired) | 1 theme |
|| **Launch Config** | Multi-tab dev workspace layout | 1 config |
|| **Global Rules** | Copy-paste rules for Warp Drive | 9 rules |
|| **MCP Configs** | Recommended MCP server configurations | 7 servers |

## Quick Start

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

### After Installation

1. **Global Rules**: Copy rules from `rules/global-rules.md` using Warp's `/add-rule` command
2. **MCP Servers**: Add configs from `mcp/recommended.json` via Settings > MCP Servers
3. **WARP.md**: Copy `templates/WARP.md` to your project root and edit the `[CUSTOMIZE]` sections
4. **Theme**: Select "Oz Dark" in Settings > Appearance > Themes

## Components

### Skills: `oz-supercharged`

A structured development workflow system that teaches Warp's agent (Oz) to follow the **EXPLORE → PLAN → EXECUTE → VERIFY** pipeline. Includes:

- **8 Agent Modes**: Explorer, Architect, Executor, Critic, Researcher, Debugger, Security Reviewer, Test Engineer
- **Keyword Triggers**: `autopilot`, `ultrawork`, `eco`, `plan`, `deepinit`, `review`, `research`, `debug`, `tdd`, `fix build`, `security review`
- **8 Task Templates**: Exploration, Implementation, Review, Debugging, Research, TDD, Build Fix, Security Review
- **Verification Protocol**: BUILD → LINT → TEST → FUNCTIONALITY + QA cycling + completion protocol
- **Deepinit**: Generate per-directory `AGENTS.md` files for codebase onboarding
- **Escalation**: 3-failure circuit breaker, structured escalation rules

### WARP.md Template

A universal project rules template that combines:

- **Warp official structure**: Project Overview, Core Architecture, Key Components, Development Commands, Architecture Notes
- **OMC principles**: Core Principles, Workflow Phases, Verification Protocol, Goal-Driven Execution
- **Karpathy Guidelines**: Simplicity First, Surgical Changes
- **Best practices**: Testing, Security, Git Workflow

### Workflows

Pre-built YAML workflows accessible via Warp's Command Palette:

- **git-essentials**: Status+diff, compact log, conventional commits, stash, branch cleanup, full diff
- **docker-dev**: Compose up/down/logs/rebuild, system prune, exec shell
- **project-setup**: Node.js init, Python init, WARP.md init, .gitignore generator

### Theme: Oz Dark

A dark theme with teal accents, inspired by Tokyo Night. Designed for long coding sessions with high contrast and comfortable colors.

### Launch Config: Dev Workspace

A multi-tab layout with Code, Server, Tests, and Terminal tabs — ready to customize with your project paths.

### Global Rules

9 pre-written rules for Warp Drive covering: Agent Workflow, Coding Standards, Communication Style, Security, Git Workflow, Testing, Secret Protection, Debugging Protocol, and Completion Protocol.

### MCP Server Recommendations

Tested configurations for Context7, GitHub, Notion, Puppeteer, Linear, Sentry, and Atlassian MCP servers.

## File Structure

```
oh-my-warp/
├── README.md
├── LICENSE
├── setup.ps1                    # Windows installer
├── setup.sh                     # macOS/Linux installer
├── templates/
│   └── WARP.md                  # Universal project rules template
├── skills/
│   └── oz-supercharged/
│       ├── SKILL.md
│       └── references/
│           ├── agent-modes.md
│           ├── task-templates.md
│           ├── deepinit-guide.md
│           └── verification-loops.md
├── workflows/
│   ├── git-essentials.yaml
│   ├── docker-dev.yaml
│   └── project-setup.yaml
├── themes/
│   └── oz-dark.yaml
├── launch-configs/
│   └── dev-workspace.yaml
├── rules/
│   └── global-rules.md
├── mcp/
│   └── recommended.json
└── docs/
    ├── installation.md
    ├── customization.md
    └── tips.md
```

## How It Works

oh-my-warp leverages every customization surface Warp exposes:

| Surface | Method | Automated? |
|---------|--------|------------|
| Skills | `SKILL.md` in Warp's resources directory | Yes (setup script) |
| Workflows | YAML files in Warp's workflow directory | Yes (setup script) |
| Themes | YAML files in Warp's theme directory | Yes (setup script) |
| Launch Configs | YAML files in Warp's config directory | Yes (setup script) |
| Project Rules | `WARP.md` in project root | Template provided |
| Global Rules | Warp Drive UI (`/add-rule`) | Copy-paste provided |
| MCP Servers | Warp Settings UI | JSON configs provided |

## Customization

See [docs/customization.md](docs/customization.md) for:

- Adding your own skills
- Creating custom workflows
- Modifying the WARP.md template
- Building custom themes

See [docs/tips.md](docs/tips.md) for:

- Agent Profile optimization (YOLO vs Strategic)
- CLI automation patterns
- Parallel agent execution
- PR review prompt templates
- Command allowlist/denylist patterns
- Context budget management
- TDD quick-start guide
- Debugging workflow patterns

## Philosophy

This project adapts the structured multi-agent workflow philosophy of oh-my-claudecode for Warp's single-agent architecture. Instead of orchestrating multiple AI agents, we teach one agent (Oz) to switch roles and follow disciplined workflows.

**Key principles borrowed from OMC:**

1. Explore before acting — understand context first
2. Plan before executing — think before you code
3. Verify after implementing — trust but verify
4. Minimal changes — do what's needed, nothing more
5. Evidence over assumptions — show, don't tell

## Credits

This project is directly inspired by the work of **[Yeachan-Heo (Bellman)](https://github.com/Yeachan-Heo)**:

- **[oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode)** — Teams-first multi-agent orchestration for Claude Code. The original framework that pioneered structured AI agent workflows with 30+ specialized agents, 40+ skills, and the EXPLORE → PLAN → EXECUTE → VERIFY pipeline.
- **[oh-my-codex](https://github.com/Yeachan-Heo/oh-my-codex)** — The same orchestration philosophy adapted for OpenAI Codex CLI, proving these patterns work across different AI coding tools.

oh-my-warp adapts these ideas for Warp's extension model. If you find this useful, consider starring the original projects above.

## License

[MIT](LICENSE)
