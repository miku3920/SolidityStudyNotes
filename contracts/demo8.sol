// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo8 {
    address _owner;

    constructor() {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    modifier costs(uint256 price) {
        if (msg.value >= price) {
            _;
        }
    }
}

contract Register is Demo8 {
    mapping (address => bool) public registeredAddresses;
    uint256 public _price;

    constructor(uint256 initPrice) {
        _price = initPrice;
    }

    function register() public payable costs(_price) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint256 price) public onlyOwner {
        _price = price;
    }
}
