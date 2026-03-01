# 고급 팁

[English](tips.md) | **한국어**

Warp 에이전트 기능을 최대한 활용하기 위한 고급 기법들입니다.

## Agent Profile: YOLO vs Strategic

Warp에서 자율성 수준이 다른 Agent Profile을 여러 개 만들 수 있습니다. 상황에 맞게 두 가지 프로필을 설정하세요:

### YOLO 프로필 (높은 자율성)

신뢰할 수 있는 환경(로컬 개발, 샌드박스 컨테이너)용. 대부분의 명령을 자동 승인합니다.

**Settings > AI > Agents > New Profile:**
- Name: `YOLO`
- Autonomy: High
- Command Allowlist (정규식 패턴):

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

### Strategic 프로필 (신중한 자율성)

민감한 환경용. 읽기 전용 명령만 자동 승인합니다.

**Settings > AI > Agents > New Profile:**
- Name: `Strategic`
- Autonomy: Low
- Command Allowlist (최소):

```regex
which .*
ls(\s.*)?
grep(\s.*)?
echo(\s.*)?
```

- Command Denylist (위험한 명령 차단 — denylist가 우선):

```regex
rm -rf.*
sudo.*
chmod 777.*
curl.*\| sh
wget.*\| sh
```

### CLI에서 프로필 사용

```bash
# 프로필 목록
warp agent profile list

# YOLO 프로필로 실행
warp agent run --profile <YOLO_PROFILE_ID> --prompt "auth 모듈 리팩터링해줘"

# Strategic 프로필로 프로덕션 작업
warp agent run --profile <STRATEGIC_PROFILE_ID> --prompt "데이터베이스 마이그레이션 업데이트해줘"
```

## CLI 자동화

Warp CLI (`warp agent run`)를 사용하면 에이전트 작업을 스크립트로 작성하고 헤드리스로 실행할 수 있습니다.

### 기본 사용법

```bash
# 간단한 프롬프트
warp agent run --prompt "이 코드베이스 분석해줘"

# API 키 사용 (CI/자동화용)
export WARP_API_KEY="wk-xxx..."
warp agent run --prompt "테스트 실행하고 실패 수정해줘"

# 저장된 프롬프트 사용
warp agent run --saved-prompt <PROMPT_ID>

# MCP 서버 지정
warp agent run --mcp-server "<MCP_UUID>" --prompt "에러 확인해줘"

# 노트북 컨텍스트 사용
warp agent run --prompt "Follow the instructions in <notebook:ID>"
```

### 에이전트 체이닝

CLI로 순차적 에이전트 작업 실행:

```bash
# 1단계: 분석
warp agent run --prompt "auth 모듈을 분석하고 모든 보안 이슈를 나열해줘"

# 2단계: 수정 (1단계 출력 검토 후)
warp agent run --prompt "auth 모듈에서 발견된 보안 이슈를 수정해줘"

# 3단계: 검증
warp agent run --prompt "모든 테스트를 실행하고 회귀가 없는지 확인해줘"
```

## 병렬 에이전트 실행

Warp는 탭 간 여러 에이전트를 동시에 실행할 수 있습니다. 독립적인 작업에 활용하세요:

**예시: 3개 에이전트 병렬 실행**
1. 탭 1: `지난 1시간의 Cloud Run 로그 요약해줘`
2. 탭 2: `나에게 할당된 열린 PR 전부 분석해줘`
3. 탭 3: `UI 컴포넌트 스타일 업데이트해줘`

각 탭이 독립적인 에이전트 인스턴스를 실행합니다. Launch Configuration으로 이를 위한 멀티탭 레이아웃을 설정할 수 있습니다.

## PR 리뷰 프롬프트 템플릿

체계적인 풀 리퀘스트 리뷰를 위한 구조화된 프롬프트. Warp 저장 프롬프트에 복사하거나 직접 사용하세요:

```
이 PR을 리뷰하고 빠른 스캔에 최적화된 형식으로 정리해줘:

### 1. 위험도 평가
전체 위험도: HIGH | MEDIUM | LOW
복잡도: Simple | Moderate | Complex
영향 범위: Isolated | Module-wide | System-wide

### 2. 치명적 이슈
각 항목: 파일:줄번호, 영향, 수정 제안

### 3. 우려사항
접두사: [SECURITY], [PERFORMANCE], [LOGIC], [STYLE]

### 4. 메인테이너 결정 가이드
머지 신뢰도: 0-100%
권장 조치: merge / fix blockers / needs discussion / split PR
리뷰 소요 시간: ~X분

### 5. 규칙
- 블로커는 상세히, 나머지는 간결하게
- 코드 예시는 블로커에만 포함
- PR이 괜찮으면: "이 PR은 현재 상태로 머지해도 안전합니다."
```

## 시크릿 보호

비밀 정보의 우발적 노출을 방지하기 위해 Warp 글로벌 룰로 추가하세요:

```
Rule: Protect Secrets
- 코드나 명령 생성 시 시크릿을 절대 포함하거나 노출하지 않습니다.
- 출력 표시 전에 민감한 문자열을 자동으로 마스킹합니다.
- 시크릿은 환경 변수에 저장하며, 절대 인라인하지 않습니다.
- CLI 도구: 시크릿을 이전 단계에서 계산하고 $VAR로 참조합니다.
```

## 효과적인 WARP.md 팁

### Development Commands 채우기

WARP.md에서 가장 영향력 있는 섹션은 Development Commands입니다. 구체적으로 작성하세요:

```markdown
## Development Commands

### Setup
npm install

### Dev
npm run dev        # localhost:3000에서 시작

### Build
npm run build

### Test
npm run test       # Jest, 전체 테스트 실행
npm run test:watch # 워치 모드

### Lint
npm run lint       # ESLint + Prettier
npm run typecheck  # tsc --noEmit
```

### Key Component 설명 추가

에이전트가 코드를 더 빠르게 찾을 수 있도록 주요 파일을 나열하세요:

```markdown
## Key Components
- `src/auth/` — 인증 (JWT + OAuth)
- `src/api/routes/` — REST API 엔드포인트
- `src/db/models/` — Prisma 모델
- `src/lib/` — 공유 유틸리티
```

## MCP 서버 팁

### Context7으로 문서 조회

항상 Context7 MCP를 활성화해두세요. 익숙하지 않은 라이브러리 작업 시 에이전트가 최신 문서를 가져올 수 있습니다:

```
구현 전에 Context7 MCP로 최신 Next.js App Router 문서를 조회해줘.
```

### GitHub MCP로 PR 워크플로우

GitHub MCP가 활성화되면 에이전트가:
- 열린 PR 목록 및 분석
- 적절한 설명이 포함된 PR 생성
- CI 상태 확인
- 코드 변경 리뷰

### Linear/Sentry로 이슈 트래킹

Linear 또는 Sentry MCP를 연결하면 에이전트가:
- 이슈 세부사항 및 인수 기준 읽기
- 구현 후 티켓 상태 업데이트
- PR을 이슈에 자동 연결

## 컨텍스트 버짓 관리

대용량 파일은 에이전트의 컨텍스트 윈도우를 빠르게 소모합니다. 버짓을 보호하세요:

### 대용량 파일 읽기 전

1. **크기 먼저 확인** — 파일이 클 수 있으면, 전체를 읽기 전에 구조(함수명, 클래스 개요)를 먼저 스캔
2. **특정 섹션만 읽기** — 200줄 이상 파일은 줄 범위를 지정하여 관련 함수나 섹션만 읽기
3. **현명하게 배치** — 한 번에 5개 이상 파일을 병렬로 읽지 않기. 나머지는 큐에 대기
4. **구조적 도구 선호** — 전체 파일 읽기보다 grep/search 사용. 보일러플레이트 없이 매칭된 줄만 반환

### WARP.md에 추가

```markdown
## Context Budget
- 200줄 이상 파일: 구조 먼저 스캔, 그 후 특정 섹션 읽기
- 전체 파일 읽기보다 grep/search 선호
- 파일 읽기 배치: 최대 5개 병렬
```

## TDD 빠른 시작

테스트 주도 개발은 더 나은 설계를 만들고 버그를 조기에 잡습니다. Warp에서 사용하는 방법:

### TDD 모드 트리거

`tdd` 또는 `test first`를 말하면 활성화됩니다. 에이전트가 RED → GREEN → REFACTOR를 따릅니다:

1. **RED**: 다음 동작에 대한 실패하는 테스트 작성
2. **GREEN**: 테스트를 통과시키는 최소한의 코드 작성
3. **REFACTOR**: 동작 변경 없이 정리
4. **REPEAT**: 다음 실패 테스트

### 예시 프롬프트

```
tdd: 회원가입 폼에 이메일 유효성 검사 추가해줘. 잘못된 이메일 형식 테스트부터 시작해줘.
```

### 핵심 규칙

- 실패하는 테스트 없이 프로덕션 코드를 작성하지 않음
- 각 테스트는 하나의 동작만 검증
- 테스트 이름은 기대 동작을 설명: `@ 기호 없는 이메일을 거부한다`
- 프로젝트의 기존 테스트 프레임워크와 패턴을 따름

## 디버깅 워크플로우 팁

### 디버그 모드 트리거

`debug` 또는 `diagnose`를 말하면 구조화된 디버깅이 활성화됩니다:

1. **재현** — 버그를 트리거하는 최소 단계 찾기
2. **증거 수집** — 에러 메시지, 스택 트레이스, git blame
3. **가설 수립** — 증거와 함께 한 번에 하나의 이론
4. **수정** — 최소 변경, 그 후 같은 패턴이 다른 곳에 있는지 확인

### 서킷 브레이커

3번의 수정 시도가 실패하면, 에이전트는 변형을 계속 시도하지 않고:
- 시도한 내용 요약
- 아키텍처 분석으로 전환
- 또는 사용자에게 도움 요청

### 예시 프롬프트

```
debug: /api/profile 엔드포인트에서 500 에러가 발생하고 있어.
에러 로그: [에러 붙여넣기]
```

### WARP.md에 디버그 컨텍스트 추가

에이전트가 더 빠르게 디버깅할 수 있도록 일반적인 문제를 문서화하세요:

```markdown
## Common Issues
- 인증 에러: src/middleware/auth.ts에서 JWT 만료 확인
- DB 연결: .env의 DATABASE_URL 확인, src/db/pool.ts에서 커넥션 풀 확인
- 빌드 실패: `npm run clean` 먼저 실행, 그 후 `npm run build`
```
