# 설치 가이드

[English](installation.md) | **한국어**

## 사전 요구사항

- [Warp 터미널](https://warp.dev) 설치
- Git

## 자동 설치

### Windows

```powershell
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
.\setup.ps1
```

**스킬은 관리자 권한이 필요합니다** — `C:\Program Files\Warp\resources\skills\`에 설치됩니다. 스킬을 건너뛰려면:

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

## 설치 경로

### Windows 경로

| 구성 요소 | 경로 |
|-----------|------|
| Skills | `C:\Program Files\Warp\resources\skills\oz-supercharged\` |
| Workflows | `%APPDATA%\warp\Warp\data\workflows\` |
| Themes | `%APPDATA%\warp\Warp\data\themes\` |
| Launch Configs | `%APPDATA%\warp\Warp\data\launch_configurations\` |
| WARP.md 템플릿 | `%USERPROFILE%\.warp\templates\` |

### macOS 경로

| 구성 요소 | 경로 |
|-----------|------|
| Workflows | `~/.warp/workflows/` |
| Themes | `~/.warp/themes/` |
| Launch Configs | `~/.warp/launch_configurations/` |
| WARP.md 템플릿 | `~/.warp/templates/` |

### Linux 경로

| 구성 요소 | 경로 |
|-----------|------|
| Workflows | `~/.local/share/warp-terminal/workflows/` |
| Themes | `~/.local/share/warp-terminal/themes/` |
| Launch Configs | `~/.local/share/warp-terminal/launch_configurations/` |
| WARP.md 템플릿 | `~/.warp/templates/` |

## 수동 설정

아래 항목은 자동화할 수 없습니다 (Warp UI를 통해서만 설정 가능):

### 1. 글로벌 룰

Warp를 열고 `/add-rule`을 입력한 뒤, `rules/global-rules.md`의 각 규칙을 붙여넣습니다.

또는: Settings > AI > Knowledge > Manage Rules에서 설정.

### 2. MCP 서버

Settings > MCP Servers에서 `mcp/recommended.json`의 설정을 추가합니다.

### 3. 프로젝트별 WARP.md

`templates/WARP.md`를 프로젝트 루트에 복사하고 `[CUSTOMIZE]` 섹션을 편집합니다:

```bash
cp ~/.warp/templates/WARP.md /path/to/your/project/WARP.md
```

또는 워크플로우 사용: Command Palette > "Init WARP.md from Template" 검색.

## 제거

위에 나열된 경로에서 설치된 파일을 삭제하면 됩니다. 설치 스크립트는 기존 Warp 설정을 수정하지 않습니다.
