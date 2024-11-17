// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo8 {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
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
    uint256 public price;

    constructor(uint256 initPrice) {
        price = initPrice;
    }

    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint256 _price) public onlyOwner {
        price = _price;
    }
}
