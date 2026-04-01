# 고급 팁

[English](tips.md) | **한국어**

이 문서는 **공식 로컬 Oz 기능**을 가장 효과적으로 활용하는 방법에 집중합니다.

## 1. 적절한 Agent Profile 만들기

프로필을 이용하면 자율성, 모델, 명령 권한, MCP 접근 범위를 작업 상황에 맞게 조절할 수 있습니다.

### Prod mode 프로필

낯선 저장소나 민감한 환경에 적합합니다.

**권장 설정**
- Code diffs: `Always ask`
- Read files: `Agent decides`
- Create plans: `Agent decides`
- Execute commands: `Always ask`
- Full Terminal Use writes: `Always ask`
- MCP servers: 신뢰하는 서버만 허용

### Default 프로필

신뢰하는 로컬 저장소에서 일반적인 개발 작업을 할 때 적합합니다.

**권장 설정**
- Code diffs: `Agent decides`
- Read files: `Always allow`
- Create plans: `Always allow`
- Execute commands: `Agent decides`
- Full Terminal Use writes: `Ask on first write`

### YOLO mode 프로필

버려도 되는 환경이나 충분히 신뢰하는 로컬 샌드박스에서만 사용하세요.

**권장 설정**
- 대부분 권한: `Always allow`
- 절대 자동 승인하고 싶지 않은 파괴적 명령은 denylist로 차단

### 유용한 allowlist 시작점

```regex
which .*
ls(\s.*)?
grep(\s.*)?
find .*
git (status|log|diff|branch|show|blame).*
npm (run|test|list|outdated).*
python -m pytest.*
ruff .*
```

### CLI 사용 예시

```bash
# 프로필 목록 보기
oz agent profile list

# 특정 프로필로 실행
oz agent run --profile <PROFILE_ID> --prompt "이 저장소를 분석해줘"
```

## 2. `/plan` 과 Task Lists 적극 활용

Warp의 내장 Planning 과 Task Lists 는 큰 변경을 가장 안전하게 구조화하는 방법입니다.

- 다단계이거나 불확실한 작업에는 `/plan` 사용
- 복잡한 요청에서는 Oz가 task list를 만들도록 두기
- 작업 중에도 plan과 task list를 다시 열어 상태 확인
- 작업의 형태가 바뀌면 plan도 같이 수정

예시 프롬프트:

```text
/plan 로컬 설치 흐름을 공식 스킬 탐색 경로 기준으로 리팩터링하는 계획을 세워줘.
```

```text
현재 plan의 1단계만 구현하고, 문서 수정 후 멈춰줘.
```

## 3. 인터랙티브 작업에는 Full Terminal Use 사용

Full Terminal Use 는 REPL, debugger, database shell, dev server처럼 실시간 상태가 있는 터미널에서 Oz를 작업시키는 공식 방법입니다.

잘 맞는 예:
- `npm run dev`
- `python`
- `psql`
- `gdb`
- 오래 실행되는 로컬 서버

유용한 조작:
- macOS의 `⌘I` / Windows·Linux의 `Ctrl+I`: 필요할 때 shell 입력과 agent 입력 전환
- macOS의 `⌘⇧I` / Windows·Linux의 `Ctrl+Shift+I`: 작업 실행 중 auto-accept 토글

정적 파일만 읽어서는 안 되는 작업일 때 써야 합니다.

## 4. 의미 있는 변경은 Code Review로 확인

Git 저장소라면 Oz가 만든 diff를 Warp의 코드 리뷰 흐름으로 검토해보세요.

권장 방식:
- 무조건 적용보다 먼저 diff를 보게 하기
- 중요한 hunk에 inline comment 남기기
- 코멘트를 모아 한 번에 반영 요청하기
- 수정 후 다시 검증하기

예시 프롬프트:

```text
/code-review-local 현재 diff를 리뷰해서 논리 위험과 추가 코멘트 후보를 알려줘.
```

## 5. Codebase Context 상태 관리

Codebase Context 는 로컬 Oz 품질을 크게 좌우합니다.

권장 사항:
- Git 저장소 안에서 작업하기
- Warp의 코드 인덱싱을 켜두기
- 너무 큰 저장소나 생성 파일이 많으면 `.warpindexingignore` 추가
- 여러 저장소를 쓸 때는 정확한 저장소 이름을 언급하기

큰 저장소에서는 ignore 파일을 적극적으로 쓰세요:
- `.gitignore`
- `.warpindexingignore`
- `.cursorignore`
- `.cursorindexingignore`

## 6. MCP를 도구 계층으로 사용

MCP 서버는 로컬 Oz의 플러그인 계층처럼 생각하면 됩니다.

추천 구성:
- **Context7** — 최신 공식 문서
- **GitHub** — 저장소, PR, 이슈 컨텍스트
- **Linear / Sentry / Atlassian / Notion** — 실제로 쓰는 경우에만 연결

CLI 예시:

```bash
oz agent run --mcp ./mcp/recommended.json --prompt "Context7로 최신 Warp skills 문서를 확인해줘."
```

전부 필요 없다면 더 작은 JSON 파일을 만들어 넘기면 됩니다.

## 7. 헤드리스 로컬 작업에는 `oz agent run` 사용

로컬 CLI는 반복 작업, 스크립트형 검증, 프로필별 비교 실행에 유용합니다.

예시:

```bash
oz agent run --prompt "현재 디렉토리를 요약해줘"
```

```bash
oz agent run --profile <PROFILE_ID> --prompt "테스트를 실행하고 실패 이유를 설명해줘"
```

```bash
oz agent run --mcp ./mcp/recommended.json --prompt "코드 수정 전에 현재 SDK 문서를 먼저 찾아줘"
```

## 8. 탭과 Launch Configuration으로 안전하게 병렬화

문서화되지 않은 오케스트레이션 없이도, 여러 Warp 탭과 런치 설정으로 충분히 안전한 로컬 병렬 작업이 가능합니다.

실전 패턴:
1. 탭 1: 실제 코딩 작업
2. 탭 2: 테스트 또는 dev server
3. 탭 3: 문서 조사나 별도 분석 작업

이 구성을 launch configuration으로 저장하면 재사용이 쉽습니다.

## 9. `WARP.md`는 구체적으로 작성

결과 품질을 가장 빠르게 올리는 방법은 `WARP.md`를 구체적으로 적는 것입니다.

### Development Commands

```markdown
## Development Commands

### Setup
npm install

### Dev
npm run dev

### Build
npm run build

### Test
npm run test

### Lint
npm run lint
npm run typecheck
```

### Key Components

```markdown
## Key Components
- `src/auth/` — 인증 및 세션 로직
- `src/api/routes/` — HTTP 라우트
- `src/db/models/` — 데이터베이스 모델
- `src/lib/` — 공용 유틸리티
```

## 10. 번들 스킬을 의도적으로 사용

이 저장소의 스킬 팩은 일부러 작게 유지했습니다.

- `/local-workflow` — 구조화된 로컬 구현
- `/research-local` — 문서와 코드베이스 조사
- `/debug-local` — 버그 재현과 진단
- `/tdd-local` — 테스트 우선 작업
- `/build-fix-local` — 빌드 및 타입체크 오류 수정
- `/code-review-local` — 로컬 diff 리뷰

먼저 Oz의 내장 기능을 활용하고, 스킬은 그 기능을 더 일관되게 호출하기 위한 도구로 쓰는 편이 좋습니다.
