## 대림대학교 모바일 통합 구현

### 2주차 ( 3월 12일 목 ) 
✏️ 수업 내용  <br>
1. .gitignore 사이트를 활용해 프로젝트에 맞는 .gitignore 파일 생성 <br>
2. 마크다운 문법을 활용한 README 작성 연습 <br>
3. pub.dev = Flutter 라이브러리 저장소 개념 확인 <br>
4. intro.dart 생성 후 map, list, int, String, switch, for / while / 람다 반복문 등 기본 Dart 문법 복습

### 3주차 ( 3월 19일 목 )
✏️ 수업 내용  <br>
1. UI 기초 구성 방식 학습 ( StatelessWidget / StatefulWidget ) <br>
2. 상태 변화 없으면 Stateless, 있으면 Stateful 사용 <br>
2-1. `stl` → Stateless, `stf` → Stateful 빠른 생성 가능 <br>
2-2. Dangerous 존 = State(OS 영역), Safe 존 = App 영역으로 이해 <br>
3. Container는 const 사용이 제한될 수 있고, 상황에 따라 다른 위젯보다 무거울 수 있음 <br>
4. `.,` 사용 시 속성 빠르게 이어서 작성 가능

### 4주차 ( 3월 26일 목 ) 
✏️ 수업 내용 <br>
1. progress bar(진행률 표시줄) 구현 <br>
2. `backgroundColor: Colors.white.withValues(alpha: 0.2)` 앞에서 const를 뺀 이유 확인 <br>
3. `Colors.white` 기반으로 값이 가공되면 const처럼 고정 상수로 보기 어려움

### 5주차 ( 4월 2일 )
✏️ 수업 내용 <br>
1. bottom_navigation, process_badge 구현 <br>


### 6주차 ( 4월 9일 ) 
✏️ 수업 내용 <br> 
1. UniTask (대학생용 과제 관리 앱 개발 프로젝트 S.1) 시작 <br>
2. StatefulWidget vs StatelessWidget 다시 정리 <br>
2-1. 입력칸(TextField)처럼 화면 변화가 있으면 Stateful, 없으면 Stateless 사용 <br>
3. `heightBox` / `widthBox` extension 사용법 확인 <br>
4. Ligature 폰트(FiraCode) 개념 확인 <br>
5. pubspec.yaml의 `^` 의미 = 메이저 버전 고정, 그 안에서 최신 버전 허용

### 7주차 ( 4월 16일 ) 
✏️ 수업 내용  <br>
1. Flutter APK 빌드 및 제출 방식 학습 <br>
2. `flutter build apk --release --split-per-abi` 명령어로 apk 3종 생성 <br>
3. 제출 파일은 `app-arm64-v8a-release.apk` 사용 <br>
4. apk 저장 경로(`build/app/outputs/flutter-apk/`) 확인 후 파일 따로 보관 <br>
5. 이후 `flutter clean`으로 정리하고 프로젝트 폴더 압축 제출 방식 확인

### 11주차 ( 5월 14일 )
✏️ 수업 내용 <br>
1. Riverpod `NotifierProvider` 구조 학습 <br>
1-1. `Provider` 로 Service 인스턴스 관리 <br>
1-2. `NotifierProvider<XProvider, AsyncValue<T>>(XProvider.new)` 로 상태 관리 <br>
1-3. Notifier 안에서 `ref.read(serviceProvider).method()` 호출 후 `state = switch(result){...}` 패턴으로 상태 업데이트 <br>
2. `sealed class Result<T>` 로 `Success` / `Failure` 처리 구조 학습 <br>
3. `AuthApiService` 의 `static` 제거 → Riverpod Provider 인스턴스로 관리하는 방식으로 전환 <br>
4. `ConsumerStatefulWidget` / `ConsumerState` 로 로그인·회원가입 페이지 Riverpod 연동 <br>
5. `switch (result) { case Success(): ... case Failure(:final exception): ... }` 패턴으로 API 결과 처리 <br>
6. `ElevatedButton` → `ElevatedButton.icon` 으로 로딩 인디케이터 아이콘 적용 <br>
7. `ProviderScope` 로 앱 루트 감싸기 ( `main.dart` ) <br>

### 12주차 ( 5월 21일 )
✏️ 수업 내용 <br>
1. `TaskCard` 위젯 구조 설계 <br>
1-1. `checked`, `title`, `date`, `category`, `onChecked`, `onSelected` 필드 구성 <br>
1-2. `ValueChanged<bool?>?` 타입으로 `onChecked` 선언 <br>
2. `Checkbox.adaptive` → `Checkbox` 로 변경 <br>
3. `Column` 에 `crossAxisAlignment: .stretch` 추가 <br>
4. `@AppThemePreview` 어노테이션으로 `preview()` 함수 연동 <br>
5. `HighlightButton` 위젯 구현 ( `?leading`, `?trailing` nullable 위젯 조건부 삽입 ) <br>
6. `SelectableChip` 위젯 구현 <br>
7. `flutter widget-preview start` 로 Widget Preview 확인 <br>


---

## Claude 스킬 ( 수업 활용 AI 도구 )

### /caveman 계열 — 토큰 압축 스킬
Claude 출력에서 불필요한 미사여구·관사·공손한 표현을 제거해 토큰을 압축하는 스킬 <br>
기술적 정확도는 유지하면서 응답 속도와 비용을 최적화함 <br>

| 명령어 | 설명 |
|--------|------|
| `/caveman` | 기본 원시인 모드 활성화. 출력 토큰 **65~75% 절감**, 응답 속도 **약 3배** 향상 |
| `/caveman lite` | 문법은 유지하되 인사말·공손한 표현 등 플러프(Fluff)만 제거하는 경량 압축 모드 |
| `/caveman ultra` | 최대 압축 모드. 극도로 간결한 응답 ( 초보자에게 비권장 ) |
| `/caveman-compress @파일명` | 지정 파일 ( 예: `@claude.md` ) 을 caveman 스타일로 재작성해 **입력 토큰 약 46% 절감**. 원본은 `.original.md` 로 백업 |
| `/caveman-help` | caveman 플러그인 사용 가이드 및 지원 모드 목록 확인 |

### /brainstorming — 인터랙티브 학습 스킬
기능이나 아이디어를 요청하면 AI가 분석 후 구현 방식·다음 단계를 **4지선다 ( A, B, C, D )** 객관식으로 출제 <br>
선택 제출 시 선택에 맞는 맞춤형 가이드 제공 <br>

1. `/brainstorming` 입력 후 필요한 기능 설명 <br>
2. AI가 4가지 선택지 제시 <br>
3. 원하는 선택지 제출 → 맞춤 가이드 제공

### /office-hours — 교육 지원 스킬
Claude를 **대학 교수·튜터 페르소나**로 전환하는 교육용 예외 모드 <br>
caveman 모드 활성화 중에도 이 명령어 실행 시 친절하고 상세한 설명·과제 힌트를 제공 <br>
학습 목적의 질문에는 압축 모드보다 상세한 설명이 우선됨


### 13주차 ( 5월 21일 수 )
✏️ 수업 내용 <br>
Flutter Widget Preview 기능 학습 <br>
- `flutter widget-preview start` 명령어로 실행 <br>
- `@AppThemePreview(name: '...', group: '...')` 어노테이션 필수 <br>
- `Widget preview()` 함수 작성 후 실시간 위젯 미리보기 가능 <br>
- `HighlightButton`, `SelectableChip`, `TaskCard` 위젯 preview 연동 <br>
- 람다식 함수 활용 습관 들이기 

1. `?widget` — nullable 위젯은 조건문 없이 `?` 하나로 조건부 삽입 <br>
2. `=>` — 한 줄짜리 함수는 중괄호 대신 람다 표현식으로 작성 <br>
3. `as VoidCallback?` — 함수 타입은 캐스팅으로 간결하게 처리 <br>
4. `this.color = Colors.blue` — 생성자 기본값은 직접 지정 <br>
5. `get _iconColor => diff <= 3 ? Colors.red : Colors.orange` — getter + 삼항 연산자 체이닝으로 조건 분기 <br>
6. `get _formattedDate => DateFormat('yyyy.MM.dd').format(date)` — 날짜 포맷도 getter + 람다로 한 줄 처리 <br>