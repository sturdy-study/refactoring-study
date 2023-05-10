# 챕터 1 - 리팩터링: 첫 번째 예시

## Rule
- 본인의 디렉토리가 아니라면 건들지 말기.
- 필요하다면, 해당 스터디 날짜 디렉토리 안에 본인이름으로 디렉토리 생성하는 것 가능

<br>

## 공통
- invoices.json, plays.json은 책에서 제공하는 함수 실행을 위한 공통적인 데이터다.

<br>

## 코드 실행 - JS
JS 코드는 유트브:`FE재남`님 [영상](https://www.youtube.com/watch?v=MgjwHPF2In8&t=1644s)을 참고하여 만들었습니다.
[FE재남: github](https://github.com/roy-jung/refactoring/tree/master)
- 실행방법 : nodemon 설치 후 실행
```shell
refactoring-study/chapter1 $ yarn run start chapter1/main.js

yarn run v1.22.19
$ nodemon chapter1/main.js
[nodemon] 2.0.22
[nodemon] to restart at any time, enter `rs`
[nodemon] watching path(s): *.*
[nodemon] watching extensions: js,mjs,json
[nodemon] starting `node chapter1/main.js`
청구 내역 (고객명: BigCo)
Hamlet: $650.00 (55석)
As You Like It: $580.00 (35석)
Othello: $500.00 (40석)
총액: $1,730.00
적립 포인트: 47점
```