# oh-my-warp

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Warp](https://img.shields.io/badge/Warp-Terminal-00D4AA?logo=warp)](https://warp.dev)

> **Your Warp is not alone.**

[English](README.md) | **한국어**

Warp 터미널 에이전트를 위한 올인원 확장 도구 모음 — 스킬, 워크플로우, 테마, 프로젝트 규칙을 한 번에.
[oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode)의 구조화된 AI 에이전트 워크플로우 철학에서 영감을 받았습니다.

## 구성 요소

| 구성 요소 | 설명 | 수량 |
|-----------|------|------|
| **Skills** | 역할 기반 모드를 갖춘 구조화된 에이전트 워크플로우 시스템 | 1 스킬 (5 파일) |
| **WARP.md 템플릿** | OMC 기반 베스트 프랙티스를 적용한 범용 프로젝트 규칙 | 1 템플릿 |
| **Workflows** | git, docker, 프로젝트 설정용 재사용 가능한 커맨드 단축키 | 3 워크플로우 |
| **Theme** | 틸 액센트 다크 테마 (Tokyo Night 영감) | 1 테마 |
| **Launch Config** | 멀티탭 개발 워크스페이스 레이아웃 | 1 설정 |
| **Global Rules** | Warp Drive에 복사-붙여넣기할 규칙 | 9 규칙 |
| **MCP Configs** | 추천 MCP 서버 설정 | 7 서버 |

## 요구사항

- [Warp 터미널](https://warp.dev) 설치 및 실행
- Git
- (선택) Node.js — `npx`를 사용하는 MCP 서버용
- (선택) Docker — GitHub MCP 서버용

## 시작하기

> **처음이신가요?** 초보자 가이드를 참고하세요:
> - [Getting Started (English)](docs/getting-started.md)
> - [시작하기 (한국어)](docs/getting-started-ko.md)

### Windows (PowerShell)

```powershell
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp

# 전체 설치 (스킬 설치에 관리자 권한 필요)
.\setup.ps1

# 스킬 제외 설치 (관리자 권한 불필요)
.\setup.ps1 -SkipSkills
```

### macOS / Linux

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
chmod +x setup.sh
./setup.sh
```

### 설치 후 수동 설정

1. **글로벌 룰** — `rules/global-rules.md`의 규칙을 Warp의 `/add-rule` 명령으로 복사
2. **MCP 서버** — `mcp/recommended.json`의 설정을 Settings > MCP Servers에 추가
3. **WARP.md** — `templates/WARP.md`를 프로젝트 루트에 복사하고 `[CUSTOMIZE]` 섹션 편집
4. **테마** — Settings > Appearance > Themes에서 "Oz Dark" 선택

> OS별 상세 경로와 제거 방법은 [docs/installation-ko.md](docs/installation-ko.md)를 참고하세요.

## 구성 요소 상세

### `oz-supercharged` 스킬

oh-my-warp의 핵심. Warp 에이전트(Oz)에게 **EXPLORE → PLAN → EXECUTE → VERIFY** 파이프라인을 학습시킵니다:

- **8가지 에이전트 모드** — Explorer, Architect, Executor, Critic, Researcher, Debugger, Security Reviewer, Test Engineer
- **키워드 트리거** — `autopilot`, `ultrawork`, `eco`, `plan`, `deepinit`, `review`, `research`, `debug`, `tdd`, `fix build`, `security review`
- **검증 프로토콜** — BUILD → LINT → TEST → FUNCTIONALITY + QA 사이클
- **Deepinit** — 코드베이스 온보딩을 위한 디렉토리별 `AGENTS.md` 생성
- **에스컬레이션** — 3회 실패 시 서킷 브레이커 + 구조화된 에스컬레이션 규칙

### WARP.md 템플릿

다음을 결합한 범용 프로젝트 규칙 템플릿:

- Warp 공식 구조 (Project Overview, Core Architecture, Key Components 등)
- OMC 원칙 (Workflow Phases, Verification Protocol, Goal-Driven Execution)
- Karpathy 가이드라인 (Simplicity First, Surgical Changes)
- 베스트 프랙티스 (Testing, Security, Git Workflow)

### 워크플로우

Warp Command Palette에서 사용 가능한 YAML 워크플로우 (`oh-my-warp` 태그):

| 워크플로우 | 명령어 |
|------------|--------|
| **git-essentials** | Status+diff, 압축 로그, 컨벤셔널 커밋, stash, 브랜치 정리, 전체 diff |
| **docker-dev** | Compose up/down/logs/rebuild, 시스템 정리, exec shell |
| **project-setup** | Node.js 초기화, Python 초기화, WARP.md 초기화, .gitignore 생성 |

### 테마, 런치 설정, 글로벌 룰, MCP

- **Oz Dark** — Tokyo Night 영감의 틸 액센트 다크 테마
- **Dev Workspace** — 멀티탭 레이아웃 (Code, Server, Tests, Terminal)
- **9개 글로벌 룰** — 에이전트 워크플로우, 코딩 표준, 커뮤니케이션, 보안, Git, 테스팅, 시크릿, 디버깅, 완료 프로토콜
- **7개 MCP 서버** — Context7, GitHub, Notion, Puppeteer, Linear, Sentry, Atlassian

## 작동 원리

oh-my-warp는 Warp가 제공하는 모든 커스터마이징 영역을 활용합니다:

| 영역 | 방법 | 설정 |
|------|------|------|
| Skills | Warp resources 디렉토리의 `SKILL.md` | 자동 (설치 스크립트) |
| Workflows | Warp workflow 디렉토리의 YAML | 자동 (설치 스크립트) |
| Themes | Warp theme 디렉토리의 YAML | 자동 (설치 스크립트) |
| Launch Configs | Warp config 디렉토리의 YAML | 자동 (설치 스크립트) |
| Project Rules | 프로젝트 루트의 `WARP.md` | 템플릿 제공 |
| Global Rules | Warp Drive UI (`/add-rule`) | 복사-붙여넣기 제공 |
| MCP Servers | Warp Settings UI | JSON 설정 제공 |

## 파일 구조

```
oh-my-warp/
├── setup.ps1 / setup.sh        # 설치 스크립트 (Windows / macOS+Linux)
├── skills/oz-supercharged/      # 에이전트 스킬 (SKILL.md + 4개 참고 문서)
├── templates/WARP.md            # 프로젝트 규칙 템플릿
├── workflows/                   # git-essentials, docker-dev, project-setup
├── themes/oz-dark.yaml          # Tokyo Night 영감 다크 테마
├── launch-configs/              # 멀티탭 개발 워크스페이스
├── rules/global-rules.md        # Warp Drive용 9개 규칙
├── mcp/recommended.json         # 7개 MCP 서버 설정
└── docs/                        # 가이드, 팁, 커스터마이징
```

## 커스터마이징

[docs/customization-ko.md](docs/customization-ko.md) — 커스텀 스킬, 워크플로우, 테마, WARP.md 템플릿 만들기.

[docs/tips-ko.md](docs/tips-ko.md) — Agent Profile (YOLO vs Strategic), CLI 자동화, 병렬 에이전트, PR 리뷰 프롬프트, 컨텍스트 버짓 관리, TDD, 디버깅 워크플로우.

## 철학

이 프로젝트는 [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode)의 멀티 에이전트 워크플로우 철학을 Warp의 싱글 에이전트 아키텍처에 맞게 적용합니다. 여러 AI 에이전트를 오케스트레이션하는 대신, 하나의 에이전트(Oz)에게 역할 전환과 체계적인 워크플로우를 가르칩니다:

1. **탐색** 후 행동 — 맥락부터 파악
2. **계획** 후 실행 — 코딩 전에 생각
3. **검증** 후 완료 — 신뢰하되 확인
4. **최소 변경** — 필요한 것만, 그 이상은 없이
5. **증거** 우선 — 보여주기, 말하기가 아닌

## 기여하기

기여를 환영합니다! 스킬, 워크플로우, 테마 만드는 법은 [docs/customization-ko.md](docs/customization-ko.md)를 참고하세요.

1. 저장소 Fork
2. 피처 브랜치 생성 (`git checkout -b feat/my-feature`)
3. 컨벤셔널 형식으로 커밋 (`feat(scope): description`)
4. Pull Request 제출

## 크레딧

**[Yeachan-Heo (Bellman)](https://github.com/Yeachan-Heo)**의 작업에서 영감을 받았습니다:

- **[oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode)** — 30+ 에이전트, 40+ 스킬, EXPLORE → PLAN → EXECUTE → VERIFY 파이프라인을 갖춘 Claude Code용 멀티 에이전트 오케스트레이션.
- **[oh-my-codex](https://github.com/Yeachan-Heo/oh-my-codex)** — 동일한 철학을 OpenAI Codex CLI에 적용.

oh-my-warp가 유용하다면, 위 원본 프로젝트에 스타를 남겨주세요.

## 라이선스

[MIT](LICENSE)
