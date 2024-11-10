// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo6 {
    mapping(address => uint256) public balances;

    constructor() {
        initBalance();
    }

    function setBalanceByMsg(uint256 balance) public {
        balances[msg.sender] = balance;
    }

    function setBalanceByTx(uint256 balance) public {
        balances[tx.origin] = balance;
    }

    function getBalance() public view returns (uint256) {
        return balances[address(this)];
    }

    function initBalance() public {
        balances[address(this)] = 2100000000;
    }

    function chargeBalance(uint256 amount) public {
        chargeBalance(amount, msg.sender);
    }

    function chargeBalance(uint256 amount, address account) public {
        balances[address(this)] -= amount;
        balances[account] += amount;
    }


}
