# Getting Started with oh-my-warp

**English** | [한국어](getting-started-ko.md)

A beginner-friendly guide for **official local Oz workflows**.

## What is oh-my-warp?

oh-my-warp helps you set up a stronger local Warp environment without relying on undocumented features.

It gives you:

1. a small **native-only skill pack**
2. reusable **global rules**
3. recommended **MCP server configs**
4. a practical **WARP.md template**
5. local automation with **workflows** and **launch configurations**

## Prerequisites

- [Warp terminal](https://warp.dev) installed and running
- Git
- Basic familiarity with terminal workflows

## Step-by-Step Installation

### 1. Clone the repository

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
```

### 2. Run the installer

**Windows**

```powershell
.\setup.ps1
```

**macOS / Linux**

```bash
chmod +x setup.sh
./setup.sh
```

### 3. Add global rules

1. Open Warp
2. Type `/add-rule`
3. Paste the rules from `rules/global-rules.md`

These rules shape Oz's behavior across projects.

### 4. Add MCP servers

1. Open Warp's MCP server settings
2. Import or copy the configs from `mcp/recommended.json`
3. Start with **Context7** if you only want one server at first

### 5. Add `WARP.md` to a project

```powershell
Copy-Item "$HOME\.warp\templates\WARP.md" "C:\path\to\your\project\WARP.md"
```

```bash
cp ~/.warp/templates/WARP.md /path/to/your/project/WARP.md
```

Then fill in the `[CUSTOMIZE]` sections so Oz knows your project's commands, architecture, and key directories.

### 6. Choose or create a profile

Set up a profile that matches your local workflow:
- **Prod mode** for cautious or sensitive work
- **Safe** for cautious work
- **Default** for normal development
- **YOLO mode** for highly trusted local sandboxes

## How to Use It

### Use the bundled skills directly

You can call the skills with slash commands or natural language:

| Skill | Best for |
|------|----------|
| `/local-workflow` | Structured local coding tasks |
| `/research-local` | Documentation and API research |
| `/debug-local` | Reproducing and fixing bugs |
| `/tdd-local` | Test-first implementation |
| `/build-fix-local` | Build, lint, or typecheck failures |
| `/code-review-local` | Reviewing local diffs |

### Use built-in Oz features alongside the skills

The biggest gains come from combining the skill pack with Warp's built-in local features:

- `/plan` for multi-step work
- automatic **Task Lists**
- **Full Terminal Use** for dev servers, REPLs, and interactive tools
- **Interactive Code Review** for Git-indexed diffs
- **Codebase Context** for local code indexing

## Example Prompts

**Plan a refactor**

```text
/plan Refactor the local install flow to use official skill discovery directories.
```

**Run a structured implementation**

```text
/local-workflow Update the README and setup scripts to use only documented local Oz features.
```

**Debug a local issue**

```text
/debug-local The dev server crashes when I open the settings page. Reproduce it and find the root cause.
```

**Do test-first work**

```text
/tdd-local Add validation for empty email input.
```

**Review your current diff**

```text
/code-review-local Review the current diff for clarity, risk, and missing verification.
```

## What's in the Box

| Component | What it is |
|-----------|-----------|
| `.agents/skills/` | Native-only local Oz skills |
| `templates/WARP.md` | Project rules template |
| `workflows/` | Git, Docker, and project setup shortcuts |
| `themes/oz-dark.yaml` | Theme |
| `launch-configs/` | Multi-tab workspace layout |
| `rules/global-rules.md` | Rules for Warp Drive |
| `mcp/recommended.json` | Valid MCP server configurations |
| `docs/tips.md` | Local power-user guide |

## Troubleshooting

### Skill not showing up?

- Verify the skill exists in `~/.agents/skills/` or a repository `.agents/skills/` directory
- Restart Warp if you just installed the files

### Rules not taking effect?

- Re-add them with `/add-rule`
- Make sure your project also has a concrete `WARP.md`

### Oz seems blind to the codebase?

- Check that Codebase Context is enabled
- Wait for indexing to finish for large repositories
- Add ignore files if indexing is noisy or too large

## Next Steps

- Read [tips.md](tips.md) for advanced local workflows
- Read [customization.md](customization.md) to build your own skills and workflows
- Adapt the template and skill pack to your own repositories
