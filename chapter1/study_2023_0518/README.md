# 5월 18일 스터디

> 5월 18일 스터디 시작 전, 본인이 리팩터링 코드를 업로드 할 디렉토리 입니다.

- 5월 18일 **스터디 전**까지 `study_2023_0518` 디렉토리에 본인이 만든 코드를 업로드 해주세요.
  - Ex) `230518_kimjaejun/main.rb`
  - 코드를 작성하며 느낀점도 적으면서 나중에 다시 돌이켜보는 것도 좋을 수 있어요! (강제 아님)
- 5월 18일 **스터디 진행 후** 느낀점도 추가해주세요! (강제 아님)

<hr>

# 5월 18일 스터디 진행

- 일시 : 21:40 ~ 22:45 (약 1시간 진행)
- 범위 : 1.1장 ~ 1.3장 (24p ~ 29p)
- 진행자 : 김재준
- 진행
  - 책 읽기 - 10분
  - 토론 및 발표 - 45분
  - 다음 분량 및 리딩할 사람 정하기 - 5분

<br>

## 진행 내용

> 줄 그은 내용은 `${page}p_${line(위에서)}` 으로 표현

### 1.1장 - 자, 시작해보자!

- 가은님

  - `25p_12(code)` : JS를 쓰지만 처음보는 기능. 궁금해서 줄 그음.

    ```javascript
    const format = new Intl.NumberFormat("en-US",
                                        { style: "currency", currency: "USD",
                                        minimunFractionDigits: 2 }).format;
    ```

<br>

### 1.2장 - 예시 프로그램을 본 소감

> 컴파일러는 코드가 깔끔하든 지저분하든 개의치 않으니 말이다. - 26p 밑에서 3번째 줄

- 가은님 : 컴파일러 자체는 우리가 리팩터링을 한다고 하더라도, 크게 상관이 없을 수 있는데 굳이 리팩터링을 해야할지? 라는 생각이 잠깐 들었습니다.

<br>

> 프로그램이 새호운 기능을 추가하기에 편한 구조가 아니라면, 먼저 기능을 추가하기 쉬운 형태로 리팩터링하고 나서 원하는 기능을 추가한다.

- 재현님 : 약간 글 자체가 '무책임'하다라는 생각이 들었습니다. MVP처럼 빠르게 개발해야하는 경우 리팩터링을 고려한 설계는 쉽지 않기에 이렇게 '구조 바꾸고 하시면 됩니다~'가 약간 무책임해 보였습니다.
- 종욱님 : 끊임없이 리팩터링을 해야할지?라는 생각이 들었습니다. 그래서 어떤 기준에서 리팩터링을 해야하고, 언제까지 해야할지에 대해 스터디를 진행하며 알아가보고 싶습니다.

<br>

> 이 변경이 어느 부분에 영향을 줄 지 생각해보자

- 가은님 : 리팩터링의 핵심이라고 생각했습니다. 이 점을 생각하며 리팩터링을 진행해야 한다고 생각합니다.
  - 영향의 의미
    - 가은님 : 성능의 영향?
    - 도훈님 : 다른 로직에게로의 영향

<br>

> 정책이 복잡해질수록 수정할 부분을 찾기 어려워지고, 수정 과정에서 실수할 가능성도 커진다.

- 도훈님 : 정책이 복잡해지면 그에 따라 비즈니스 로직도 복잡해지고 비즈니스 로직이 복잡해지면 코드가 복잡해질 수 있으며, 복잡한 코드에서 수정할 부분을 찾는 것은 어렵고 수정과정에서 실수할 가능성이 높아진다고 생각했습니다.
  따라서, 정책은 운영측면 뿐만 아니라 유지보수 측면에서 보았을때도 간단한게 좋다고 생각합니다.
  
  > ***Simple is best!***
  
  - 재준님 : 여기서 말하는 '정책'을 저는 비지니스라고 생각했어요!

<br>

> 잘 작동하고 나중에 변경할 일이 절대 없다면 코드를 현재 상태로 놔둬도 아무런 문제가 없다.

- 재준님 : 진짜 변경할 일이 없다면, 굳이 리팩터링이 필요할까요?
  - 도훈님 : '절대'라는 것은 없어요! 그래서 리팩터링은 꼭 필요합니다...!
  - 재준님 : 리팩터링은 필요하지만, 실제 업무와 관련하여 우선순위가 어떻게 될지는 궁금하긴 합니다 ㅎㅎ

<br>

### 1.3장 리팩터링의 첫 단계

> 리팩터링할 코드 영역을 꼼꼼하게 검사해줄 테스트 코드들부터 마련해야 한다.

- 재현님 : 테스트 코드를 작성하고 있지는 않지만, 테스트 코드 작성 범위에 대해 말씀 나누고 싶긴 했습니다. 그리고 작은 단위에도 테스트를 진행하게 되면 결국엔 로직 개발보다 테스트 코드 개발에 더 많은 리소스를 쏟게 되고, 이는 무엇을 위한 테스트인지? 라는 생각이 들었습니다. 테스트를 위한 테스트라는 느낌이 들었기에..
  - 도훈님 : 현재 테스트 코드 짜면 나중에 시간을 더 절약할 수도 있을거에요!
- 재준님 : 모든 케이스에 대해서 테스트 코드가 필요할지에 대해 말씀을 나누고 싶었어요. 저는 단위 테스트까지 필요하다고는 생각되지 않거든요.
  - 도훈님 : 코드를 변경할 때 영향을 받는 범위에 대해 신경쓰는 대신, 테스트 코드로 그것을 검증하면 더 좋기에 면밀한 테스트가 필요하다고 생각합니다.

<hr>

## 다음 스터디

- 5월 25일 목요일 21:30
- 진행자 : 김도훈
- 분량 : 1.4장
- 준비해야할 사항 : 각자 **1.4장을 모두 읽어오기** (스터디 시간 중 토론시간을 늘리기 위해)
