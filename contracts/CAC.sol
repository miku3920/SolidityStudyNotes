// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract CAC {
    address public manager;
    uint256 public minimumFund;
    address[] approvers;

    constructor(uint256 minimum) {
        manager = msg.sender;
        minimumFund = minimum;
    }

    function join() public payable {
        require(msg.value > minimumFund);
        approvers.push(msg.sender);
    }
}