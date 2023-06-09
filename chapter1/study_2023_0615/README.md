# 6월 15일 스터디

> 6월 15일 스터디 시작 전, 본인이 리팩터링 코드를 업로드 할 디렉토리 입니다.

- 6월 15일 **스터디 전**까지 `study_2023_0615` 디렉토리에 본인이 만든 코드를 업로드 해주세요.
  - Ex) `230518_kimjaejun/main.rb`
  - 코드를 작성하며 느낀점도 적으면서 나중에 다시 돌이켜보는 것도 좋을 수 있어요! (강제 아님)
- 6월 15일 **스터디 진행 후** 느낀점도 추가해주세요! (강제 아님)

<hr>

# 6월 15일 스터디 진행

- 일시 : 6월 15일 21:45 진행
- 범위 : 1.8장 ~ 1.10장
- 진행자 : 황종욱님
- 참여자 : 김도훈, 이가은, 황종욱
- 불참(사유) : 김재준(여행), 김재현(업무)

<br>

## 진행 내용

### 64 page

> ECMAScript 2015 버전 부터 객체지향을 사용할 수 있는 문법과 구조가 제대로 지원되기 시작했다.

- 도훈님 : 실제로 프론트엔드 분들은 객체지향적으로 코드를 어떻게 작성하고 계신지 궁금합니다.
  - 가은님 : 리액트는 JS 기반이기에 객체지향 프로그래밍에 가깝지 않습니다. 애초에 객체지향이라는 것에도 의견이 분분합니다. 리액트를 클래스 기반 컴포넌트로 개발하시는 분들도 계시고, 함수형 컴포넌트 기반으로 개발하시는 분들도 계십니다. <br>
    여담으로 `2사로 윤석님` 께서 "객체지향이 어떻게 보면 방법론의 일종이기에, 깊이 빠져들고 정답임을 확인하는 것은 지양하는게 좋습니다"라는 말씀을 하셨습니다.
  - 도운님 : 방법론의 일종이라 여러 의견이 생길 수 밖에 없을 것 같네요.

> 조건부 로직을 다형성으로 바꾸기다.

- 가은님 : 비즈니스 로직이랑 UI로직을 분리하는 작업을 실제로 진행하는데, 비슷하여 밑줄을 긋게 됐습니다.
  - 도훈님 : 기능은 변한게 없고, 코드의 이동이 생겼으니 리팩토링이 맞는 것 같습니다!

> 조건부 로직은 코드 수정 횟수가 늘어날수록 골칫거리로 전략하기 쉽다. 이를 방지하려면 프로그래밍 언어가 제공하는 구조적인 요소로 적절히 보완해야 한다.

- 종욱님 : `if-else` 분기 처리 대신에 늘 다형성을 이용하는게 옳은가? 라는 생각이 들어서 시작하게 됐습니다.
  - 가은님 : JS에서 지향하는 내용 중 하나가 `순수 함수` 입니다.


### 70 page

> **타입 코드를 서브클래스로 바꾸기**

- 가은님 : 이 코드를 아마 TS가 적용이 안돼서 이렇게 한 것 같은데, 추후 퓨어 JS만으로 무언가를 만들게 된다면 적용해보고 싶어서 밑줄을 긋게 됐습니다.
  - 종욱님 : TS로 하면, 코드가 바뀌는 부분이 있나요?
  - 가은님 : TS에서는 타입을 적용하게 되면, 다른 타입이 들어갈 수 없게 되기에 재정의가 불가능하게 됩니다.

### 76 ~ 77 page

> 좋은 코드를 가늠하는 확실한 방법은 '얼마나 수정하기 쉬운가'다.

- 도훈님 : 항상 무의식적으로 해당 내용에 대해 생각만 했었습니다. 은연중에 생각만 했던 내용을 문장으로 표현하여 정의해줬기에 밑줄을 그었습니다.

<hr>

## 다음 스터디

- 6월 22일 목요일 21:30
- 진행자 : 김재준
- 분량 : 2.1 ~ 2.3장
- 준비해야할 사항 : 읽어오기

## 의견

- 도훈님 : 전체 챕터를 다 읽고 나서, 1챕터부터 읽기 전후의 생각을 공유하는 것도 재밌을 것 같습니다!
