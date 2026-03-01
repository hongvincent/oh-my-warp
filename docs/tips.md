# Power Tips

Advanced techniques for getting the most out of Warp's agent capabilities.

## Agent Profiles: YOLO vs Strategic

Warp lets you create multiple Agent Profiles with different autonomy levels. Set up two profiles for different situations:

### YOLO Profile (high autonomy)

For trusted environments (local dev, sandboxed containers). Auto-approves most commands.

**Settings > AI > Agents > New Profile:**
- Name: `YOLO`
- Autonomy: High
- Command Allowlist (regex patterns):

```regex
which .*
ls(\s.*)?
cat .*
grep(\s.*)?
find .*
echo(\s.*)?
git (status|log|diff|branch|show|blame).*
npm (run|test|list|outdated).*
cargo (check|clippy|test|build).*
python -m pytest.*
ruff .*
node .*
wc .*
head .*
tail .*
```

### Strategic Profile (careful autonomy)

For sensitive environments. Only auto-approves read-only commands.

**Settings > AI > Agents > New Profile:**
- Name: `Strategic`
- Autonomy: Low
- Command Allowlist (minimal):

```regex
which .*
ls(\s.*)?
grep(\s.*)?
echo(\s.*)?
```

- Command Denylist (blocks dangerous commands — denylist takes precedence):

```regex
rm -rf.*
sudo.*
chmod 777.*
curl.*\| sh
wget.*\| sh
```

### Using Profiles via CLI

```bash
# List profiles
warp agent profile list

# Run with YOLO profile
warp agent run --profile <YOLO_PROFILE_ID> --prompt "refactor the auth module"

# Run with Strategic profile for production work
warp agent run --profile <STRATEGIC_PROFILE_ID> --prompt "update database migrations"
```

## CLI Automation

Warp's CLI (`warp agent run`) lets you script agent tasks and run them headlessly.

### Basic Usage

```bash
# Simple prompt
warp agent run --prompt "analyze this codebase"

# With API key (for CI/automation)
export WARP_API_KEY="wk-xxx..."
warp agent run --prompt "run tests and fix failures"

# With saved prompt
warp agent run --saved-prompt <PROMPT_ID>

# With MCP server
warp agent run --mcp-server "<MCP_UUID>" --prompt "check for errors"

# With notebook context
warp agent run --prompt "Follow the instructions in <notebook:ID>"
```

### Chaining Agents

Use the CLI to run sequential agent tasks:

```bash
# Step 1: Analyze
warp agent run --prompt "analyze the auth module and list all security issues"

# Step 2: Fix (after reviewing step 1 output)
warp agent run --prompt "fix the security issues found in the auth module"

# Step 3: Verify
warp agent run --prompt "run all tests and verify no regressions"
```

## Parallel Agent Execution

Warp supports running multiple agents in parallel across tabs. Use this for independent tasks:

**Example: 3 agents in parallel**
1. Tab 1: `Summarize Cloud Run logs for the last hour`
2. Tab 2: `Analyze all open PRs assigned to me`
3. Tab 3: `Update UI component styles`

Each tab runs its own agent instance. Use Launch Configurations to set up multi-tab layouts for this.

## PR Review Prompt Template

A structured prompt for thorough pull request reviews. Copy this into a Warp saved prompt or use directly:

```
Review this pull request and format for rapid scanning:

### 1. Risk Assessment
Overall Risk: HIGH | MEDIUM | LOW
Complexity: Simple | Moderate | Complex
Blast Radius: Isolated | Module-wide | System-wide

### 2. Critical Issues
For each: File:Line, Impact, Fix suggestion

### 3. Concerns
Prefix with: [SECURITY], [PERFORMANCE], [LOGIC], [STYLE]

### 4. Maintainer Decision Guide
Merge confidence: 0-100%
Recommended action: merge / fix blockers / needs discussion / split PR
Time to review: ~X minutes

### 5. Rules
- Blockers get full detail, everything else stays concise
- Include code examples only for blockers
- If PR is fine: "This PR is safe to merge as-is."
```

## Secret Protection

Add this as a Warp global rule to prevent accidental secret exposure:

```
Rule: Protect Secrets
- Never include or reveal secrets when generating code or commands.
- Automatically redact sensitive strings before showing output.
- Store secrets in environment variables, never inline.
- For CLI tools: compute secrets in prior steps, reference via $VAR.
```

## Effective WARP.md Tips

### Fill in Development Commands

The most impactful section of WARP.md is Development Commands. Be specific:

```markdown
## Development Commands

### Setup
npm install

### Dev
npm run dev        # starts on localhost:3000

### Build
npm run build

### Test
npm run test       # Jest, runs all tests
npm run test:watch # Watch mode

### Lint
npm run lint       # ESLint + Prettier
npm run typecheck  # tsc --noEmit
```

### Add Key Component Descriptions

Help the agent find code faster by listing your main files:

```markdown
## Key Components
- `src/auth/` — Authentication (JWT + OAuth)
- `src/api/routes/` — REST API endpoints
- `src/db/models/` — Prisma models
- `src/lib/` — Shared utilities
```

## MCP Server Tips

### Context7 for Documentation

Always keep Context7 MCP enabled. When working with unfamiliar libraries, the agent can fetch up-to-date docs:

```
Use Context7 MCP to look up the latest Next.js App Router documentation before implementing.
```

### GitHub MCP for PR Workflows

With GitHub MCP enabled, the agent can:
- List and analyze open PRs
- Create PRs with proper descriptions
- Check CI status
- Review code changes

### Linear/Sentry for Issue Tracking

Connect Linear or Sentry MCP to let the agent:
- Read issue details and acceptance criteria
- Update ticket status after implementation
- Link PRs to issues automatically
