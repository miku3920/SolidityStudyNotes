// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract GMR {
    address public manager;

    constructor() {
        manager = msg.sender;
    }
}