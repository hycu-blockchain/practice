// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScorePad {
    mapping(address => uint256) public score;   // 주소 → 점수 (ERC-20 잔액 구조와 같은 모양)

    event ScoreAdded(address user, uint256 amount, uint256 newScore);  // 이력은 이벤트 로그로

    function addScore(uint256 amount) public {   // 쓰기 — 트랜잭션·가스
        require(amount > 0, "amount must be positive");   // 입력 검증 (10주차 복습)
        score[msg.sender] += amount;                     // 같은 주소면 누적
        emit ScoreAdded(msg.sender, amount, score[msg.sender]);
    }

    function getScore(address user) public view returns (uint256) {  // 읽기 — 무료 조회
        return score[user];
    }
}
