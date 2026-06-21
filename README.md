# 블록체인 실습 코드 (practice)

한양사이버대학교 **블록체인** 강의(AI응용소프트웨어공학과)의 Solidity 실습 스타터 코드 모음이다.
9~14주차 후반부 실습에서 사용하며, **빈 파일에서 시작하지 않고 여기 준비된 코드를 읽고 한 줄씩 수정**하는 방식으로 진행한다.

## 실습 코드를 여는 방법 — Remix에서 바로 열기

설치할 것은 없다. 아래 **`Remix에서 열기`** 링크를 클릭하면 브라우저의 [Remix IDE](https://remix.ethereum.org)에 해당 파일이 바로 열린다.

| 주차 | 주제 | 컨트랙트 | Remix에서 열기 |
|---|---|---|---|
| 9주 | 스마트 컨트랙트 입문 | `HelloBlockchain.sol` | [열기](https://remix.ethereum.org/#url=https://raw.githubusercontent.com/hycu-blockchain/practice/main/week09/HelloBlockchain.sol) |
| 10주 | 함수와 제어 구조 | `Counter.sol` (스타터) | [열기](https://remix.ethereum.org/#url=https://raw.githubusercontent.com/hycu-blockchain/practice/main/week10/Counter.sol) |
| | | `CounterComplete.sol` (완성본) | [열기](https://remix.ethereum.org/#url=https://raw.githubusercontent.com/hycu-blockchain/practice/main/week10/CounterComplete.sol) |

> 11~14주차 코드는 학기 진행에 따라 추가된다. 10주차처럼 스타터(받아서 한 줄씩 추가)와 완성본(정답 대조용)을 함께 두는 주차도 있다.

링크가 동작하지 않으면, Remix에서 새 파일을 만들고 이 저장소의 코드를 복사해 붙여 넣어도 된다.
저장소 전체를 내려받으려면:

```bash
git clone https://github.com/hycu-blockchain/practice.git
```

## 폴더 구조

```
practice/
├── week09/
│   └── HelloBlockchain.sol
└── week10/
    ├── Counter.sol            # 스타터 (한 줄씩 추가해 완성)
    └── CounterComplete.sol    # 완성본 (정답 대조용)
```

주차마다 `weekNN/` 폴더 하나를 두고, 그 안에 해당 주차의 컨트랙트를 넣는다.

## 실습 안전 원칙

후반부 실습 전체에서 다음 원칙을 지킨다.

- **실습 전용 지갑을 실제 자산 지갑과 분리한다.** 강의용 계정에는 메인넷 자산을 넣지 않는다.
- **Secret Recovery Phrase(니모닉)·개인키는 누구에게도 공유하지 않는다.** 강의·실습 자료에 절대 노출하지 않는다.
- **테스트넷의 테스트 ETH로만 실습한다.** 테스트넷 ETH는 실제 가치가 없다 — "테스트넷 ETH를 사라·팔라"는 안내는 모두 사기 신호다.
- 같은 지갑과 같은 테스트넷을 9주차부터 14주차까지 그대로 유지한다. 매주 배포한 컨트랙트 주소·트랜잭션 hash·실행 결과를 기록한다.

## 문의

김종광 · 한양사이버대학교 AI응용소프트웨어공학과 · 4250031@hycu.ac.kr
