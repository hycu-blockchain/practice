// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint256 public count;          // 상태변수 — public이 자동 getter 생성
    address public owner;          // 권한 주체

    event Increased(address by, uint newValue);  // 외부 로그 채널
    event Reset(address by);

    constructor() { owner = msg.sender; }   // 배포자가 owner (9주차 복습)

    modifier onlyOwner() {                // 반복 require에 이름 붙이기
        require(msg.sender == owner, "not owner");
        _;
    }

    function increase() public {           // 쓰기 — 트랜잭션·가스
        count += 1;
        emit Increased(msg.sender, count);
    }

    function reset() public onlyOwner {   // 권한 검증 후 초기화
        count = 0;
        emit Reset(msg.sender);
    }

    function getCount() public view returns (uint) {  // 읽기 — 무료 조회
        return count;
    }
}
