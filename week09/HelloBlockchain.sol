// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloBlockchain {
    string private greeting;

    constructor(string memory _initial) {
        greeting = _initial;
    }

    function getGreeting() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
    }
}
