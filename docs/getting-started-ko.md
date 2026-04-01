# oh-my-warp 시작하기

[English](getting-started.md) | **한국어**

공식 **로컬 Oz 워크플로우**를 위한 초보자 가이드입니다.

## oh-my-warp란?

oh-my-warp는 문서화되지 않은 기능에 기대지 않고도 Warp의 로컬 환경을 더 강하게 구성할 수 있게 돕습니다.

제공하는 구성은 다음과 같습니다:

1. 작은 **native-only 스킬 팩**
2. 재사용 가능한 **글로벌 룰**
3. 추천 **MCP 서버 설정**
4. 실전형 **WARP.md 템플릿**
5. **워크플로우** 와 **런치 설정** 기반 로컬 자동화

## 사전 요구사항

- [Warp 터미널](https://warp.dev) 설치 및 실행
- Git
- 기본적인 터미널 워크플로우 이해

## 설치 방법 (단계별)

### 1단계: 저장소 복제

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
```

### 2단계: 설치 스크립트 실행

**Windows**

```powershell
.\setup.ps1
```

**macOS / Linux**

```bash
chmod +x setup.sh
./setup.sh
```

### 3단계: 글로벌 룰 추가

1. Warp를 엽니다
2. `/add-rule`을 입력합니다
3. `rules/global-rules.md` 내용을 붙여넣습니다

이 규칙들이 프로젝트 전반에서 Oz의 기본 행동을 잡아줍니다.

### 4단계: MCP 서버 추가

1. Warp의 MCP 서버 설정을 엽니다
2. `mcp/recommended.json`을 가져오거나 내용을 복사합니다
3. 처음에는 **Context7** 하나만 추가해도 충분합니다

### 5단계: 프로젝트에 `WARP.md` 추가

```powershell
Copy-Item "$HOME\.warp\templates\WARP.md" "C:\path\to\your\project\WARP.md"
```

```bash
cp ~/.warp/templates/WARP.md /path/to/your/project/WARP.md
```

그 다음 `[CUSTOMIZE]` 섹션을 채워서 프로젝트의 명령어, 구조, 주요 디렉토리를 알려주세요.

### 6단계: 프로필 선택 또는 생성

로컬 작업 방식에 맞는 프로필을 준비하세요:
- **Prod mode** — 신중하거나 민감한 작업
- **Safe** — 신중한 작업
- **Default** — 일반적인 로컬 개발
- **YOLO mode** — 충분히 신뢰하는 로컬 샌드박스

## 사용 방법

### 번들 스킬을 직접 호출하기

슬래시 명령이나 자연어로 사용할 수 있습니다:

| 스킬 | 적합한 용도 |
|------|-------------|
| `/local-workflow` | 구조화된 로컬 구현 작업 |
| `/research-local` | 문서와 API 조사 |
| `/debug-local` | 버그 재현과 원인 분석 |
| `/tdd-local` | 테스트 우선 구현 |
| `/build-fix-local` | 빌드, 린트, 타입체크 오류 수정 |
| `/code-review-local` | 현재 로컬 diff 리뷰 |

### 내장 Oz 기능과 함께 쓰기

실제 효율은 스킬과 Warp의 내장 로컬 기능을 함께 쓸 때 가장 높습니다:

- 다단계 작업을 위한 `/plan`
- 자동 **Task Lists**
- dev server, REPL, interactive tool을 위한 **Full Terminal Use**
- Git 기반 변경 검토를 위한 **Interactive Code Review**
- 로컬 코드 인덱싱을 위한 **Codebase Context**

## 예시 프롬프트

**리팩터링 계획 세우기**

```text
/plan 로컬 설치 흐름을 공식 스킬 탐색 디렉토리 기준으로 바꾸는 계획을 세워줘.
```

**구조화된 구현 실행**

```text
/local-workflow README와 setup 스크립트를 문서화된 로컬 Oz 기능만 사용하도록 업데이트해줘.
```

**로컬 문제 디버깅**

```text
/debug-local 설정 페이지를 열면 dev server가 죽습니다. 재현하고 원인을 찾아줘.
```

**테스트 우선 작업**

```text
/tdd-local 빈 이메일 입력 검증을 추가해줘.
```

**현재 diff 리뷰**

```text
/code-review-local 현재 diff를 검토해서 위험 요소와 빠진 검증을 알려줘.
```

## 구성 요소

| 구성 요소 | 설명 |
|-----------|------|
| `.agents/skills/` | native-only 로컬 Oz 스킬 |
| `templates/WARP.md` | 프로젝트 규칙 템플릿 |
| `workflows/` | Git, Docker, 프로젝트 설정 단축키 |
| `themes/oz-dark.yaml` | 테마 |
| `launch-configs/` | 멀티탭 워크스페이스 레이아웃 |
| `rules/global-rules.md` | Warp Drive용 규칙 |
| `mcp/recommended.json` | 유효한 MCP 서버 설정 |
| `docs/tips-ko.md` | 로컬 파워유저 가이드 |

## 문제 해결

### 스킬이 보이지 않나요?

- 스킬이 `~/.agents/skills/` 또는 저장소의 `.agents/skills/` 아래에 있는지 확인하세요
- 방금 설치했다면 Warp를 재시작해보세요

### 룰이 적용되지 않나요?

- `/add-rule`로 다시 추가해보세요
- 프로젝트 루트에 구체적인 `WARP.md`가 있는지 확인하세요

### Oz가 코드베이스를 잘 못 보나요?

- Codebase Context가 활성화되어 있는지 확인하세요
- 큰 저장소라면 인덱싱이 끝날 때까지 기다리세요
- 인덱싱이 과하면 ignore 파일을 추가하세요

## 다음 단계

- [tips-ko.md](tips-ko.md)에서 고급 로컬 워크플로우 확인
- [customization-ko.md](customization-ko.md)에서 나만의 스킬과 워크플로우 만들기
- 템플릿과 스킬 팩을 자신의 저장소에 맞게 조정하기
