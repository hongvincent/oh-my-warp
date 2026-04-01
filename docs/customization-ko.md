# 커스터마이징 가이드

[English](customization.md) | **한국어**

## 나만의 스킬 추가

스킬은 Oz가 자동으로 탐색하는 재사용 가능한 `SKILL.md` 파일입니다.

### 권장 위치

공식 스킬 탐색 경로를 사용하세요:

- **프로젝트 범위**: `.agents/skills/`
- **글로벌 범위**: `~/.agents/skills/`

Warp는 `.warp/skills/`, `.claude/skills/`, `.codex/skills/` 같은 호환 디렉토리도 인식하지만, 기본값으로는 `.agents/skills/`가 가장 명확합니다.

### 구조

```text
.agents/
└── skills/
    └── my-skill/
        ├── SKILL.md
        └── references/
            └── extra-context.md
```

### SKILL.md 형식

```markdown
---
name: my-skill
description: 이 스킬이 무엇을 하고 언제 쓰는지 짧게 설명
---

# My Skill

## 언제 사용할까
이 스킬이 유용한 상황을 설명합니다.

## 지침
에이전트가 따라야 할 절차를 구체적으로 적습니다.
```

### 설치 방법

- **글로벌 설치**: 스킬 폴더를 `~/.agents/skills/` 아래에 복사
- **프로젝트 설치**: 저장소 안 `.agents/skills/` 아래에 복사

프로젝트 스킬은 팀 규칙에 적합하고, 글로벌 스킬은 여러 저장소에서 공통으로 쓰기 좋습니다.

## 커스텀 워크플로우 만들기

워크플로우는 반복 가능한 명령을 정의하는 YAML 파일입니다.

### 위치

- **Windows**: `%APPDATA%\warp\Warp\data\workflows\`
- **macOS**: `~/.warp/workflows/`
- **Linux**: `~/.local/share/warp-terminal/workflows/`
- **저장소 범위**: `.warp/workflows/`

### 형식

```yaml
---
name: My Workflow
command: echo "Hello {{name}}"
tags: ["my-tag"]
arguments:
  - name: name
    description: "이름을 입력하세요"
    default_value: "World"
```

저장소 전용 명령이면 repo workflow를, 개인 자동화면 로컬 workflow를 쓰는 편이 좋습니다.

## WARP.md 템플릿 수정

`templates/WARP.md`를 편집해 기본값을 추가하세요:

1. `[CUSTOMIZE]` 섹션 채우기
2. 프로젝트 명령과 규칙 추가
3. 필요하면 `setup.ps1` 또는 `setup.sh`를 다시 실행해 전역 템플릿 갱신

## 커스텀 테마 만들기

테마는 아래 경로에 두는 YAML 파일입니다:

- **Windows**: `%APPDATA%\warp\Warp\data\themes\`
- **macOS**: `~/.warp/themes/`
- **Linux**: `~/.local/share/warp-terminal/themes/`

예시:

```yaml
name: My Theme
accent: '#hex'
cursor: '#hex'
background: '#hex'
foreground: '#hex'
details: darker
terminal_colors:
  bright:
    black: '#hex'
    red: '#hex'
    green: '#hex'
    yellow: '#hex'
    blue: '#hex'
    magenta: '#hex'
    cyan: '#hex'
    white: '#hex'
  normal:
    black: '#hex'
    red: '#hex'
    green: '#hex'
    yellow: '#hex'
    blue: '#hex'
    magenta: '#hex'
    cyan: '#hex'
    white: '#hex'
```

## 런치 설정 만들기

런치 설정은 멀티탭 또는 멀티패널 로컬 워크스페이스를 정의합니다.

### 위치

- **Windows**: `%APPDATA%\warp\Warp\data\launch_configurations\`
- **macOS**: `~/.warp/launch_configurations/`
- **Linux**: `~/.local/share/warp-terminal/launch_configurations/`

### 형식

```yaml
---
name: My Workspace
windows:
  - tabs:
      - title: Tab Name
        layout:
          cwd: /absolute/path
          commands:
            - exec: command-to-run
        color: blue
```

## Rules 와 MCP 서버

Rules 와 MCP 서버도 로컬 Oz 워크플로우의 핵심이지만 보통 Warp UI에서 관리합니다:

- **Rules**: `/add-rule` 또는 Warp Drive 규칙 관리에서 추가
- **MCP Servers**: Warp의 MCP 설정에서 추가하거나 `oz agent run --mcp`에 JSON 전달

스킬은 행동을, 룰은 제약을, MCP는 외부 도구 접근을 담당하도록 나누는 편이 유지보수에 좋습니다.

## 기여하기

유용한 스킬, 워크플로우, 테마, 런치 설정을 만들었다면:

1. 저장소 Fork
2. 적절한 디렉토리에 파일 추가
3. 동작이 바뀌면 문서도 함께 갱신
4. Pull Request 제출
