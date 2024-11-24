// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract GMR {
    address public manager;
    address[] public players;

    constructor() {
        manager = msg.sender;
    }

    function enterGame() public payable {
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }
}