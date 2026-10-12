// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// ScorePad 스타터 코드 — 주소별 포인트를 기록하는 mapping 한 줄로 출발한다.
// 강의 슬라이드의 기본 산출물 단계 ①②를 따라 한 줄씩 추가해 완성한다.
// 막히면 같은 폴더의 ScorePadComplete.sol(완성본)과 대조한다.
contract ScorePad {
    mapping(address => uint256) public score;

    // TODO ①: ScoreAdded(address user, uint256 amount, uint256 newScore) 이벤트를 선언한다

    function addScore(uint256 amount) public {
        require(amount > 0, "amount must be positive");
        score[msg.sender] += amount;
        // TODO ①: ScoreAdded 이벤트를 emit 한다
    }

    function getScore(address user) public view returns (uint256) {
        return score[user];
    }
}
