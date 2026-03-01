#Requires -Version 5.1
<#
.SYNOPSIS
    oh-my-warp installer for Windows.
.DESCRIPTION
    Installs skills, workflows, themes, launch configs, and WARP.md template.
    Skills require Administrator privileges (installs to Program Files).
    Other components install to user-level directories.
.PARAMETER SkipSkills
    Skip skill installation (avoids need for admin).
#>
param(
    [switch]$SkipSkills
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# --- Paths ---
$WarpDataDir     = "$env:APPDATA\warp\Warp\data"
$WorkflowDir     = "$WarpDataDir\workflows"
$ThemeDir        = "$WarpDataDir\themes"
$LaunchConfigDir = "$WarpDataDir\launch_configurations"
$SkillDir        = "$env:PROGRAMFILES\Warp\resources\skills"
$TemplateDir     = "$env:USERPROFILE\.warp\templates"

Write-Host ""
Write-Host "=== oh-my-warp installer ===" -ForegroundColor Cyan
Write-Host ""

# --- Helper ---
function Install-Files {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Label
    )
    if (!(Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination -Force | Out-Null
    }
    Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Force
    Write-Host "  [OK] $Label -> $Destination" -ForegroundColor Green
}

# --- Skills (admin required) ---
if (-not $SkipSkills) {
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if ($isAdmin) {
        Install-Files "$ScriptDir\skills\oz-supercharged" "$SkillDir\oz-supercharged" "Skills (oz-supercharged)"
    } else {
        Write-Host "  [SKIP] Skills require Administrator. Run as Admin or use -SkipSkills." -ForegroundColor Yellow
    }
} else {
    Write-Host "  [SKIP] Skills (--SkipSkills flag)" -ForegroundColor Yellow
}

# --- Workflows ---
Install-Files "$ScriptDir\workflows" $WorkflowDir "Workflows"

# --- Themes ---
Install-Files "$ScriptDir\themes" $ThemeDir "Themes"

# --- Launch Configs ---
Install-Files "$ScriptDir\launch-configs" $LaunchConfigDir "Launch Configs"

# --- WARP.md Template ---
if (!(Test-Path $TemplateDir)) {
    New-Item -ItemType Directory -Path $TemplateDir -Force | Out-Null
}
Copy-Item "$ScriptDir\templates\WARP.md" "$TemplateDir\WARP.md" -Force
Write-Host "  [OK] WARP.md template -> $TemplateDir" -ForegroundColor Green

# --- Summary ---
Write-Host ""
Write-Host "=== Installation complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Installed:" -ForegroundColor White
Write-Host "  - Workflows (Command Palette > search 'oh-my-warp')"
Write-Host "  - Theme 'Oz Dark' (Settings > Appearance > Themes)"
Write-Host "  - Launch Config 'Dev Workspace' (Settings > Sessions > Launch Configs)"
Write-Host "  - WARP.md template at $TemplateDir\WARP.md"
Write-Host ""
Write-Host "Manual steps:" -ForegroundColor Yellow
Write-Host "  1. Global Rules: Copy rules from rules/global-rules.md via /add-rule"
Write-Host "  2. MCP Servers: Add configs from mcp/recommended.json via Settings > MCP"
Write-Host "  3. WARP.md: Copy template to your project root and edit [CUSTOMIZE] sections"
Write-Host ""
