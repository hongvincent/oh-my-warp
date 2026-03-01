# Getting Started with oh-my-warp

**English** | [한국어](getting-started-ko.md)

A beginner-friendly guide

## What is oh-my-warp?

oh-my-warp is a toolkit that makes Warp's AI agent (Oz) smarter and more structured. Instead of just asking the agent to "do something," oh-my-warp teaches it to:

1. **Explore** the codebase first (understand before acting)
2. **Plan** before making changes (think before coding)
3. **Execute** with minimal, targeted changes
4. **Verify** that everything works (test before claiming done)

Think of it as giving your AI assistant a professional development methodology.

## Prerequisites

- [Warp terminal](https://warp.dev) installed and running
- Git installed
- Basic familiarity with terminal commands

## Step-by-Step Installation

### 1. Clone the repository

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
```

### 2. Run the installer

**Windows** (PowerShell):
```powershell
# Right-click PowerShell > Run as Administrator (needed for skills)
.\setup.ps1

# Or without admin (skips skill installation):
.\setup.ps1 -SkipSkills
```

**macOS / Linux**:
```bash
chmod +x setup.sh
./setup.sh
```

### 3. Set up Global Rules (manual step)

Global rules teach the agent how to behave across all your projects.

1. Open Warp
2. Type `/add-rule` in the chat
3. Copy and paste each rule from `rules/global-rules.md` one at a time

There are 9 rules covering: workflow, coding standards, communication, security, git, testing, secrets, debugging, and completion.

### 4. Set up MCP Servers (optional but recommended)

MCP servers give the agent access to external tools like documentation, GitHub, and issue trackers.

1. Open Warp Settings > MCP Servers
2. Add the configurations from `mcp/recommended.json`
3. At minimum, add **Context7** (for library documentation)

### 5. Add WARP.md to your project

WARP.md is a per-project rules file that gives the agent context about your specific codebase.

```bash
# Copy the template to your project
cp templates/WARP.md /path/to/your/project/WARP.md
```

Then edit the `[CUSTOMIZE]` sections in the file with your project's details:
- Project Overview — what your project does
- Core Architecture — tech stack
- Key Components — main files and directories
- Development Commands — how to build, test, lint

## How to Use

### Basic Usage

Just chat with Oz (Warp's agent) normally. The installed skill automatically activates when relevant.

### Keyword Triggers

Use these magic words to activate specific modes:

| Keyword | What it does |
|---------|-------------|
| `autopilot` | Full autonomous workflow — explore, plan, execute, verify |
| `ultrawork` | Maximum thoroughness — reads more files, checks more cases |
| `eco` | Quick and efficient — minimal exploration, essential checks only |
| `plan` | Creates a plan and waits for your approval before coding |
| `debug` | Structured debugging — reproduce, hypothesize, fix |
| `tdd` | Test-Driven Development — write test first, then code |
| `fix build` | Fix build/compile errors with minimal changes |
| `review` | Review recent code changes for quality |
| `security review` | OWASP-based security vulnerability check |
| `deepinit` | Generate AGENTS.md files for codebase documentation |
| `research` | Look up documentation and APIs |

### Example Conversations

**Building a feature:**
```
autopilot: Add user authentication with JWT tokens to the Express API
```

**Debugging:**
```
debug: Users are getting 500 errors on the /api/profile endpoint
```

**Test-driven development:**
```
tdd: Add email validation to the signup form
```

**Quick fix:**
```
eco: Fix the typo in the README header
```

**Planning only:**
```
plan: Refactor the database layer to use connection pooling
```

## Understanding Agent Modes

oh-my-warp has 8 agent modes. The agent switches between them based on the task:

| Mode | When it's used | What it does |
|------|---------------|-------------|
| **Explorer** | Understanding code | Searches files, finds patterns |
| **Architect** | Designing solutions | Analyzes code, creates plans |
| **Executor** | Writing code | Makes minimal, targeted changes |
| **Critic** | Checking work | Runs build/test/lint verification |
| **Researcher** | Looking up docs | Fetches documentation via MCP |
| **Debugger** | Fixing bugs | Root-cause analysis with evidence |
| **Security Reviewer** | Security audits | OWASP checks, secrets scanning |
| **Test Engineer** | Writing tests | TDD, coverage analysis, flaky fix |

## What's in the Box

| Component | What it is |
|-----------|-----------|
| `skills/oz-supercharged/` | The main agent skill (5 files) |
| `templates/WARP.md` | Project rules template |
| `workflows/` | Git, Docker, and project setup shortcuts |
| `themes/oz-dark.yaml` | Dark theme with teal accents |
| `launch-configs/` | Multi-tab workspace layout |
| `rules/global-rules.md` | 9 rules for Warp Drive |
| `mcp/recommended.json` | 7 MCP server configurations |
| `docs/tips.md` | Advanced tips and techniques |

## Troubleshooting

### Skill not activating?
- Verify files exist in `C:\Program Files\Warp\resources\skills\oz-supercharged\` (Windows) or the equivalent path for your OS
- Try restarting Warp after installation

### Agent ignoring rules?
- Make sure you added global rules via `/add-rule`
- Check that WARP.md is in your project root (not a subdirectory)

### Agent reading too many files?
- Add a Context Budget section to your WARP.md (see `docs/tips.md`)

## Next Steps

- Read [tips.md](tips.md) for advanced techniques (Agent Profiles, CLI automation, parallel agents)
- Read [customization.md](customization.md) to create your own skills and workflows
- Star the [original projects](https://github.com/Yeachan-Heo/oh-my-claudecode) that inspired this toolkit
