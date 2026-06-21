// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Counter 스타터 코드 — owner·constructor·onlyOwner 골격이 들어 있다.
// 강의 슬라이드의 단계 ①②③을 따라 한 줄씩 추가해 완성한다.
// 막히면 같은 폴더의 CounterComplete.sol(완성본)과 대조한다.
contract Counter {
    uint256 public count;          // 상태변수
    address public owner;          // 권한 주체

    // TODO ②: Increased·Reset 이벤트를 선언한다

    constructor() { owner = msg.sender; }   // 배포자가 owner

    modifier onlyOwner() {                  // 반복 require에 이름 붙이기
        require(msg.sender == owner, "not owner");
        _;
    }

    function increase() public {
        count += 1;
        // TODO ②: Increased 이벤트를 emit 한다
    }

    function reset() public {        // TODO ①: onlyOwner modifier를 적용한다
        count = 0;
        // TODO ②: Reset 이벤트를 emit 한다
    }

    // TODO ③: getCount() view 함수를 추가한다
}
