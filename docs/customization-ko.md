# 커스터마이징 가이드

[English](customization.md) | **한국어**

## 나만의 스킬 추가

스킬은 Warp가 로드하여 에이전트에게 특화된 기능을 부여하는 `SKILL.md` 파일입니다.

### 구조

```
skills/
└── my-skill/
    ├── SKILL.md
    └── references/
        └── extra-context.md
```

### SKILL.md 형식

```markdown
---
name: my-skill
description: >
  스킬의 기능과 활성화 시점을 설명합니다.
  이 스킬을 트리거하는 키워드를 포함하세요.
---

# My Skill

이 스킬이 활성화되었을 때 에이전트에게 제공되는 지침.
```

### 설치

스킬 폴더를 Warp의 skills 디렉토리에 복사합니다:

- **Windows**: `C:\Program Files\Warp\resources\skills\` (관리자 권한 필요)
- **macOS/Linux**: 현재 경로는 Warp 공식 문서를 확인하세요

## 커스텀 워크플로우 만들기

워크플로우는 재사용 가능한 커맨드를 정의하는 YAML 파일입니다.

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

### 설치

`.yaml` 파일을 아래 경로에 배치합니다:

- **Windows**: `%APPDATA%\warp\Warp\data\workflows\`
- **macOS**: `~/.warp/workflows/`
- **Linux**: `~/.local/share/warp-terminal/workflows/`

또는 저장소 내: `.warp/workflows/` (해당 저장소 활성 시 로드됨).

## WARP.md 템플릿 수정

`templates/WARP.md`를 편집하여 조직의 표준을 추가합니다:

1. `[CUSTOMIZE]` 섹션에 기본값 채우기
2. 언어별 컨벤션 추가
3. 표준 개발 명령어 추가
4. `setup.ps1` 또는 `setup.sh`를 다시 실행하여 설치된 템플릿 업데이트

## 커스텀 테마 만들기

테마는 색상 정의가 포함된 YAML 파일입니다.

### 형식

```yaml
name: My Theme
accent: '#hex'
cursor: '#hex'
background: '#hex'
foreground: '#hex'
details: darker  # 또는 'lighter'
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

### 배경 이미지

배경 이미지 추가 (JPG만 지원):

```yaml
background_image:
  path: my-image.jpg  # themes 디렉토리 기준 상대 경로
  opacity: 60         # 0-100
```

### 설치

`.yaml` 파일을 아래 경로에 배치합니다:

- **Windows**: `%APPDATA%\warp\Warp\data\themes\`
- **macOS**: `~/.warp/themes/`
- **Linux**: `~/.local/share/warp-terminal/themes/`

그런 다음 Settings > Appearance > Themes에서 선택합니다.

## 런치 설정 만들기

런치 설정은 멀티 윈도우/탭 레이아웃을 정의합니다.

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

### 설치

`.yaml` 파일을 아래 경로에 배치합니다:

- **Windows**: `%APPDATA%\warp\Warp\data\launch_configurations\`
- **macOS**: `~/.warp/launch_configurations/`
- **Linux**: `~/.local/share/warp-terminal/launch_configurations/`

## 기여하기

유용한 스킬, 워크플로우, 테마를 만들었다면 이 저장소에 추가해주세요:

1. 저장소 Fork
2. 해당 디렉토리에 파일 추가
3. 새 구성 요소를 추가하면 README.md 업데이트
4. Pull Request 제출
