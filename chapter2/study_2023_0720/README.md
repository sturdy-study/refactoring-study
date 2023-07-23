# 7월 20일 스터디

> 7월 20일 스터디 시작 전, 본인이 리팩터링 코드를 업로드 할 디렉토리 입니다.

- 7월 20일 **스터디 전**까지 `study_2023_0720` 디렉토리에 본인이 만든 코드를 업로드 해주세요.
  - Ex) `230518_kimjaejun/main.rb`
  - 코드를 작성하며 느낀점도 적으면서 나중에 다시 돌이켜보는 것도 좋을 수 있어요! (강제 아님)
- 7월 20일 **스터디 진행 후** 느낀점도 추가해주세요! (강제 아님)

<hr>

# 7월 20일 스터디 진행

- 일시 : 7월 20일 21:30
- 범위 : 2.6장 ~ 2.11장 (100p ~ 111p)
- 진행자 : 김재현(재준님 불참으로 교체)
- 참여자 : 김도훈, 이가은, 김재현
- 불참(사유) : 김재준(선약), 황종욱(이직준비)

<br>

## 진행 내용
### 101 page
> 리팩터링을 미루면 훨씬 힘들어진다는 확신이 들 때만 유연성 매커니즘을 미리 추가한다.
- 가은님 : 유연성 매커니즘이 무엇인지 이해가 되지 않았다. 다른 분들의 의견이 궁금하다.
- 재현님 : 지금 당장은 필요 없을지 모르지만, 나중에 필요할지 모르는 코드를 미리 만드는 것이라 이해했다. 예를 들어 계산기를 만드는데, 사측연산 외에 나머지를 구하는 기능 등이 필요하다면 기존의 사측연산에서 조합, 재활용하여 사용할 수 있는것을 만들어 놓는다. 근데 좀 설명이 모호하다고 느껴졌다. 기능을 확장한다는 것에 중점을 둔다.
- 도훈님 : 모든 타입들을 받아드릴 수 있도록 기능들을 세팅해놓게 유연성 매커니즘이라고 이해했다.
- 재현님 : 제네릭하게 이용해서 기능을 확장시켜, 정말 이런 기능이 있을거라 확신이 설때 유연성 매커니즘을 적용한다.
- 도훈님 : 동의한다. 오버엔지니어링을 초반에 하지 않는 것이 중요하다.

> 나는 나중에 문제를 더 깊이 이해하게 됐을 때 처리하는 쪽이 훨씬 낫다고 생각하는 편이다.
- 재현님 : 당장의 과제만 수정하고 해결하려고 할 때, 기존의 문제가 어느 정도의 크기인지 확인하고 뛰어들어야 한다. 본질 자체가 큰 경우에 산으로 갈 수 있다.
- 도훈님 : 엔지니어링을 하는 포인트, 시점이 필요하다.

### 102 page
> XP의 두드러진 특징은 지속적 통합, 자가 테스트 코드, 리펙토링 등의 개성이 강하면서 상호 의존하는 기법들을 하나로 묶은 프로세스라는 점이다.
- 재현님 : 익스트림 프로그래밍에 대해 처음 알게 되었다.
- 도훈님 : 애자일하게 대응하지만 문서작업과 같은 다른것들을 무시한 채 개발을 주도하는 애자일 프로세스의 한 방법이다. (위키 참조) XP로 개발하게 된다면 자신만의 개성이 강한 방법으로 개발하게 된다.
- 재현님 : 오래된 개발자가 있는 회사들이나, 문서화가 중요하지 않은 개발 프로젝트에서 많이 사용하는 방법론 같다.

> 자가 테스트 코드와 리팩터링을 묶어서 테스트 주도 개발(TDD)이라 한다,
- 가은님 : TDD가 중요하다 생각하여 리펙토링과 의존성이 높을거라 이해했다. 근데 그 이후에 TDD의 이야기가 없는걸 보니 잘못생각한 것 같다. 다른 분들의 의견이 궁금하다.
- 재현님 : TDD는 테스트 위주, 테스트 의존 개발방식이어서 리펙토링과 1대1 매칭은 아니라고 생각한다. TDD는 중요하지만 실제로 회의적인 시선이 많다.
- 도훈님 : 바로 사용자에게 반응해야하는 서비스를 개발하는 회사는 TDD가 적합하지 않다. 따라서 리소스가 넘치는 대기업들이 TDD를 사용하기 좋다.
  
> 지속적 통합을 적용하면 팀원 각자가 수행한 리팩터링 결과를 빠르게 동료와 공유할 수 있다. 그래서 조만간 삭제될 인터페이스를 이용하여 새로운 기능을 추가하는 일을 방지할 수 있고, 리팩터링한 결과가 다른 팀원의 작업에 문제를 일으키면 즉시 알아낼 수 있다.
- 도훈님 : 내가 짠 코드가 어떻게 영향을 줄 지 모르니, 서로의 코드를 빠르게 공유하는 주기적인 CI 가 중요하다.
- 재현님 : PR과는 다른 점이 있는가?
- 도훈님 : PR이 통과되야 통합이 이루어지니 PR단계에서 한번 걸러지기때문에 PR은 CI를 강화시킬 수 있는 좋은 방법이다.

### 103 page
> 수많은 유연성 메커니즘을 갖춘 시스템보다는 단순한 시스템이 변경하기가 훨씬 쉽기 때문이다.
- 도훈님 : 어려운 문제를 어떻게 하면 쉽게 풀어 나갈 것인가? 가 코드를 짜는데에 중요한 초점이라 생각한다.
- 재현님 : 연차가 낮을수록 코드가 화려하다. 방법론, 조건론으로 덕지덕지 붙여진 코드들이 많다.
- 가은님 : 이것은 시간과 경험이 해결해줄 수 있는 문제라 생각한다.
- 도훈님 : 시간과 경험, 그리고 습관도 중요하다.

> 지속적인 배포는 소프트웨어를 언제든 릴리스할 수 있는 상태로 유지해준다.
- 도훈님 : 항상 준비된 상태를 유지해야 대응이 가능한 완벽한 상태이다.

> 기술적인 졔약보다는 비즈니스 요구에 맞춰 릴리스 일정을 계획할 수 있다.
- 가은님 : 과연 실제로 적용 가능한 이야기 인걸까? 너무 이상적이기만 한 것 같다.
- 재현님 : 동의한다. 이번 신규 프로젝트 때 기능 구현에만 급급하였다. 보통은 어떤 것을 알려줄 때 정도만 알려주고, 상황에 따라 유동적으로 사용하는 것은 우리들이라고 생각한다. 그래서 저자도 이상적인 기준만 알려주는 것이다.

### 104 page
> 성능을 개선하기 위해 코드를 수정하다 보면 프로그램은 다루기 어려운 형태로 변하기 쉽고, 결국 개발이 더뎌진다.
- 도훈님 : 성능 개선을 하다보면 회의감이 느껴진다. 하드웨어가 나날이 발전하니 어느정도 코드가 보기 좋은 유지보수가 쉬운 그런 개발을 하고싶다.
- 재현님 : 성능때문에 지저분한 코드가 될 필요는 없다고 생각한다.

> 결과적으로 소프트웨어가 더 빨라지만 충분한 보상을 얻겠지만 실제로 그런 경우는 별로 없다.
- 가은님 : 실제로 회사나 나나 서비스 측면에서 모두 보상을 얻을 수 있는 경우가 있다고 생각한다.
- 재현님 : 기준에 따라 다를 것 같다. 정말로 속도가 너무 느린 경우라면 소프트웨어가 더 빨라진다면 충분한 보상이 있는 것이고, 그게 아니라 정말 작은 개선이라면 미비할 것 같다.

### 105 page
> 성능에 대한 흥미로운 사실은, 대부분 프로그램은 전체 코드 중 극히 일부에서 대부분의 시간을 소비한다는 것이다. 그래서 코드 전체를 고르게 최적화한다면 그중 90%는 효과가 거의 없기 때문에 시간 낭비인 셈이다. 속도를 높이기 위해 투자한 시간(다른 관점에서 보자면 코드를 덜 명료하게 바꾸느라 투자한 시간)을 모두 날리는 행위다.
- 가은님 : 실제로 하루 이틀 고민했던 코드들이 있었는데 알고보니 시간낭비였던 적이 있었다.
- 재현님 : 동의한다. 나도 코드 한줄 개선을 위해 이틀을 고민했던 경험이 있다. 뼈아픈 경험이었다.

<hr>

## 다음 스터디
- 7월 27일 목요일 21:30
- 진행자 : 김도훈
- 분량 : 3.1 ~ 3.5장 (105p ~ 118p)
- 준비해야할 사항 : 미리 읽어오기!

### 참고
- 점점 스터디 시간이 1시간을 넘어가는 일이 많이 발생되서 다음 분량을 줄였다. 다음 스터디 때 줄인 분량으로 진행해 보고 다시 조율 하는 것으로 결정.