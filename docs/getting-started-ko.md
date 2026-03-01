# oh-my-warp 시작하기

oh-my-warp를 처음 사용하는 분을 위한 한국어 가이드입니다.

## oh-my-warp란?

oh-my-warp는 Warp 터미널의 AI 에이전트(Oz)를 더 똑똑하고 체계적으로 만들어주는 도구 모음입니다. 단순히 "이거 해줘"라고 요청하는 대신, 에이전트에게 전문 개발 방법론을 가르칩니다:

1. **탐색(Explore)** — 코드베이스를 먼저 파악 (이해한 뒤 행동)
2. **계획(Plan)** — 변경 전에 계획 수립 (생각한 뒤 코딩)
3. **실행(Execute)** — 최소한의 정확한 변경만 수행
4. **검증(Verify)** — 모든 것이 작동하는지 확인 (완료 전에 테스트)

## 사전 요구사항

- [Warp 터미널](https://warp.dev) 설치 및 실행
- Git 설치
- 기본적인 터미널 명령어 이해

## 설치 방법 (단계별)

### 1단계: 저장소 복제

```bash
git clone https://github.com/hongvincent/oh-my-warp.git
cd oh-my-warp
```

### 2단계: 설치 스크립트 실행

**Windows** (PowerShell):
```powershell
# PowerShell을 관리자 권한으로 실행 (스킬 설치에 필요)
.\setup.ps1

# 관리자 권한 없이 설치 (스킬 제외):
.\setup.ps1 -SkipSkills
```

**macOS / Linux**:
```bash
chmod +x setup.sh
./setup.sh
```

### 3단계: 글로벌 룰 설정 (수동)

글로벌 룰은 모든 프로젝트에서 에이전트의 행동 방식을 정의합니다.

1. Warp를 엽니다
2. 채팅창에 `/add-rule`을 입력합니다
3. `rules/global-rules.md`의 각 룰을 하나씩 복사해서 붙여넣습니다

총 9개 룰: 워크플로우, 코딩 표준, 커뮤니케이션, 보안, Git, 테스팅, 시크릿 보호, 디버깅 프로토콜, 완료 프로토콜

### 4단계: MCP 서버 설정 (선택, 권장)

MCP 서버는 에이전트에게 외부 도구(문서, GitHub, 이슈 트래커 등)에 대한 접근 권한을 부여합니다.

1. Warp 설정 > MCP Servers 열기
2. `mcp/recommended.json`의 설정 추가
3. 최소한 **Context7** (라이브러리 문서 조회)은 추가하세요

### 5단계: 프로젝트에 WARP.md 추가

WARP.md는 프로젝트별 규칙 파일로, 에이전트에게 해당 코드베이스의 맥락을 알려줍니다.

```bash
# 템플릿을 프로젝트에 복사
cp templates/WARP.md /path/to/your/project/WARP.md
```

파일에서 `[CUSTOMIZE]` 섹션을 프로젝트에 맞게 편집하세요:
- Project Overview — 프로젝트 설명
- Core Architecture — 기술 스택
- Key Components — 주요 파일과 디렉토리
- Development Commands — 빌드, 테스트, 린트 명령어

## 사용 방법

### 기본 사용

Warp의 에이전트(Oz)와 평소처럼 대화하면 됩니다. 설치된 스킬이 관련 상황에서 자동으로 활성화됩니다.

### 키워드 트리거

특정 모드를 활성화하는 키워드들:

| 키워드 | 기능 |
|--------|------|
| `autopilot` | 전체 자율 워크플로우 — 탐색, 계획, 실행, 검증 |
| `ultrawork` | 최대 정밀도 — 더 많은 파일 읽기, 더 많은 엣지 케이스 확인 |
| `eco` | 빠르고 효율적 — 최소 탐색, 필수 검증만 |
| `plan` | 계획만 수립 후 사용자 승인 대기 |
| `debug` | 구조화된 디버깅 — 재현, 가설, 수정 |
| `tdd` | 테스트 주도 개발 — 테스트 먼저, 코드 나중 |
| `fix build` | 빌드/컴파일 오류를 최소 변경으로 수정 |
| `review` | 최근 코드 변경사항 품질 검토 |
| `security review` | OWASP 기반 보안 취약점 점검 |
| `deepinit` | 코드베이스 문서화용 AGENTS.md 생성 |
| `research` | 문서 및 API 조사 |

### 대화 예시

**기능 구현:**
```
autopilot: Express API에 JWT 토큰 기반 사용자 인증 추가해줘
```

**디버깅:**
```
debug: /api/profile 엔드포인트에서 500 에러가 발생하고 있어
```

**테스트 주도 개발:**
```
tdd: 회원가입 폼에 이메일 유효성 검사 추가해줘
```

**빠른 수정:**
```
eco: README 제목의 오타 수정해줘
```

**계획만 세우기:**
```
plan: 데이터베이스 레이어를 커넥션 풀링으로 리팩터링할 계획 세워줘
```

## 에이전트 모드 이해하기

oh-my-warp에는 8가지 에이전트 모드가 있습니다. 작업에 따라 자동으로 전환됩니다:

| 모드 | 사용 시점 | 역할 |
|------|---------|------|
| **Explorer** | 코드 파악 | 파일 검색, 패턴 발견 |
| **Architect** | 솔루션 설계 | 코드 분석, 계획 수립 |
| **Executor** | 코드 작성 | 최소한의 정확한 변경 |
| **Critic** | 작업 검증 | 빌드/테스트/린트 확인 |
| **Researcher** | 문서 조사 | MCP를 통한 문서 조회 |
| **Debugger** | 버그 수정 | 근본 원인 분석, 증거 기반 |
| **Security Reviewer** | 보안 감사 | OWASP 점검, 시크릿 스캔 |
| **Test Engineer** | 테스트 작성 | TDD, 커버리지 분석, 플레이키 수정 |

## 구성 요소

| 구성 요소 | 설명 |
|----------|------|
| `skills/oz-supercharged/` | 메인 에이전트 스킬 (5개 파일) |
| `templates/WARP.md` | 프로젝트 규칙 템플릿 |
| `workflows/` | Git, Docker, 프로젝트 설정 단축키 |
| `themes/oz-dark.yaml` | 틸 액센트 다크 테마 |
| `launch-configs/` | 멀티탭 워크스페이스 레이아웃 |
| `rules/global-rules.md` | Warp Drive용 9개 룰 |
| `mcp/recommended.json` | 7개 MCP 서버 설정 |
| `docs/tips.md` | 고급 팁과 기법 |

## 문제 해결

### 스킬이 활성화되지 않나요?
- `C:\Program Files\Warp\resources\skills\oz-supercharged\`에 파일이 있는지 확인하세요 (Windows)
- 설치 후 Warp를 재시작해보세요

### 에이전트가 룰을 무시하나요?
- `/add-rule`로 글로벌 룰을 추가했는지 확인하세요
- WARP.md가 프로젝트 루트에 있는지 확인하세요 (하위 디렉토리가 아닌)

### 에이전트가 파일을 너무 많이 읽나요?
- WARP.md에 Context Budget 섹션을 추가하세요 (`docs/tips.md` 참고)

## 다음 단계

- [tips.md](tips.md)에서 고급 기법 확인 (Agent Profile, CLI 자동화, 병렬 에이전트)
- [customization.md](customization.md)에서 나만의 스킬과 워크플로우 만들기
- 이 프로젝트에 영감을 준 [원본 프로젝트](https://github.com/Yeachan-Heo/oh-my-claudecode)에 스타 남기기
