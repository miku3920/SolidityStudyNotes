// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo1 {
    string public message;

    constructor(string memory initialMessage) {
        message = initialMessage;
    }

    function setMessage(string memory newMessage) public {
        message = newMessage;
    }
}
