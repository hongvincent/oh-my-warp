#!/usr/bin/env bash
set -euo pipefail

# oh-my-warp installer for macOS and Linux

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Detect OS and set paths ---
case "$(uname -s)" in
    Darwin)
        WORKFLOW_DIR="$HOME/.warp/workflows"
        THEME_DIR="$HOME/.warp/themes"
        LAUNCH_DIR="$HOME/.warp/launch_configurations"
        SKILL_DIR="$HOME/.agents/skills"
        ;;
    Linux)
        DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/warp-terminal"
        WORKFLOW_DIR="$DATA_DIR/workflows"
        THEME_DIR="$DATA_DIR/themes"
        LAUNCH_DIR="$DATA_DIR/launch_configurations"
        SKILL_DIR="$HOME/.agents/skills"
        ;;
    *)
        echo "Unsupported OS. Use setup.ps1 for Windows."
        exit 1
        ;;
esac

TEMPLATE_DIR="$HOME/.warp/templates"

echo ""
echo "=== oh-my-warp installer ==="
echo ""

# --- Helper ---
install_files() {
    local src="$1" dst="$2" label="$3"
    mkdir -p "$dst"
    cp -r "$src"/* "$dst/" 2>/dev/null || cp "$src"/* "$dst/"
    echo "  [OK] $label -> $dst"
}

# --- Skills ---
install_files "$SCRIPT_DIR/.agents/skills" "$SKILL_DIR" "Skills"

# --- Workflows ---
install_files "$SCRIPT_DIR/workflows" "$WORKFLOW_DIR" "Workflows"

# --- Themes ---
install_files "$SCRIPT_DIR/themes" "$THEME_DIR" "Themes"

# --- Launch Configs ---
install_files "$SCRIPT_DIR/launch-configs" "$LAUNCH_DIR" "Launch Configs"

# --- WARP.md Template ---
mkdir -p "$TEMPLATE_DIR"
cp "$SCRIPT_DIR/templates/WARP.md" "$TEMPLATE_DIR/WARP.md"
echo "  [OK] WARP.md template -> $TEMPLATE_DIR"

# --- Summary ---
echo ""
echo "=== Installation complete ==="
echo ""
echo "Installed:"
echo "  - Skills in $SKILL_DIR"
echo "  - Workflows (Command Palette > search 'oh-my-warp')"
echo "  - Theme 'Oz Dark' (Settings > Appearance > Themes)"
echo "  - Launch Config 'Dev Workspace' (Settings > Sessions > Launch Configs)"
echo "  - WARP.md template at $TEMPLATE_DIR/WARP.md"
echo ""
echo "Manual steps:"
echo "  1. Global Rules: Copy rules from rules/global-rules.md via /add-rule"
echo "  2. MCP Servers: Add configs from mcp/recommended.json via Settings > MCP"
echo "  3. WARP.md: Copy template to your project root and edit [CUSTOMIZE] sections"
echo ""
