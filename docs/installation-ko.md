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

### macOS / Linux

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
chmod +x setup.sh
./setup.sh
```

## 설치 경로

### Windows

| 구성 요소 | 경로 |
|-----------|------|
| Skills | `%USERPROFILE%\.agents\skills\` |
| Workflows | `%APPDATA%\warp\Warp\data\workflows\` |
| Themes | `%APPDATA%\warp\Warp\data\themes\` |
| Launch Configs | `%APPDATA%\warp\Warp\data\launch_configurations\` |
| WARP.md 템플릿 | `%USERPROFILE%\.warp\templates\` |

### macOS

| 구성 요소 | 경로 |
|-----------|------|
| Skills | `~/.agents/skills/` |
| Workflows | `~/.warp/workflows/` |
| Themes | `~/.warp/themes/` |
| Launch Configs | `~/.warp/launch_configurations/` |
| WARP.md 템플릿 | `~/.warp/templates/` |

### Linux

| 구성 요소 | 경로 |
|-----------|------|
| Skills | `~/.agents/skills/` |
| Workflows | `~/.local/share/warp-terminal/workflows/` |
| Themes | `~/.local/share/warp-terminal/themes/` |
| Launch Configs | `~/.local/share/warp-terminal/launch_configurations/` |
| WARP.md 템플릿 | `~/.warp/templates/` |

## 프로젝트 범위 설치 대안

글로벌 스킬이 싫다면, 저장소 안 `.agents/skills/`에 원하는 스킬 폴더만 복사해도 됩니다.

Windows 예시:

```powershell
New-Item -ItemType Directory -Force -Path "C:\path\to\project\.agents\skills"
Copy-Item -Recurse ".agents\skills\local-workflow" "C:\path\to\project\.agents\skills\"
```

macOS / Linux 예시:

```bash
mkdir -p /path/to/project/.agents/skills
cp -R .agents/skills/local-workflow /path/to/project/.agents/skills/
```

## 수동 UI 설정

일부 로컬 Oz 기능은 Warp UI에서 관리하는 것이 기본입니다.

### 1. 글로벌 룰

Warp를 열고 `/add-rule`을 입력한 뒤 `rules/global-rules.md` 내용을 붙여넣습니다.

### 2. MCP 서버

Warp의 MCP 서버 설정에서 `mcp/recommended.json`을 추가합니다.

### 3. 프로젝트별 WARP.md

`templates/WARP.md`를 프로젝트 루트에 복사하고 `[CUSTOMIZE]` 섹션을 편집합니다:

```powershell
Copy-Item "$HOME\.warp\templates\WARP.md" "C:\path\to\your\project\WARP.md"
```

```bash
cp ~/.warp/templates/WARP.md /path/to/your/project/WARP.md
```

### 4. 프로필

권한과 자율성을 작업 방식에 맞게 조정할 로컬 프로필을 만드세요.

추천 스타일:
- Prod mode
- Default
- YOLO mode for trusted sandboxes

## 제거

위 경로에서 복사된 파일을 삭제하면 됩니다. 설치 스크립트는 대상 디렉토리로 파일을 복사할 뿐, 그 외 Warp 상태를 변경하지 않습니다.
