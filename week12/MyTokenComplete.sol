// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;   // 컴파일러 버전 지정

// OpenZeppelin이 검증한 ERC20 구현을 가져온다
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 템플릿의 세 곳을 본인 정보로 바꾼 예 — 이름 "Alice Token" · 심볼 "ALT" · 발행량 1000
contract MyToken is ERC20 {
    constructor() ERC20("Alice Token", "ALT") {
        _mint(msg.sender, 1000 * 10**decimals());
    }
}
