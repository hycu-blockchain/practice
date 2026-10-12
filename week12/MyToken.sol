// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;   // 컴파일러 버전 지정

// ERC-20 최소 템플릿 — 스무 줄 안에 ERC-20 토큰이 완성된다.
// 수정할 곳은 단 세 군데: 토큰 이름("MyName Token") · 심볼("MNT") · 발행량(1000).
// 본인 이름이 들어간 토큰으로 바꾼 예시는 같은 폴더의 MyTokenComplete.sol과 대조한다.

// OpenZeppelin이 검증한 ERC20 구현을 가져온다
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// ERC20 상속 — 표준 함수 전부를 그대로 물려받는다
contract MyToken is ERC20 {
    // 배포 시 한 번 실행 — 부모 ERC20에 이름·심볼 전달
    constructor() ERC20("MyName Token", "MNT") {
        // 배포자(msg.sender)에게 1000개를 초기 발행
        _mint(msg.sender, 1000 * 10**decimals());
    }
}
