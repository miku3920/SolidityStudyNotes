// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract CAC {
    struct SpendingRequest {
        string description;
        uint256 value;
        address vendorAccount;
        bool complete;
    }
    SpendingRequest[] public requests;
    address public manager;
    uint256 public minimumFund;
    address[] public approvers;

    constructor(uint256 minimum) {
        manager = msg.sender;
        minimumFund = minimum;
    }

    modifier onlyManager() {
        require(msg.sender == manager);
        _;
    }

    function join() public payable {
        require(msg.value > minimumFund);
        approvers.push(msg.sender);
    }

    function createRequest(string memory des, uint256 value, address vendor) public onlyManager {
        SpendingRequest memory req = SpendingRequest({
            description: des,
            value: value,
            vendorAccount: vendor,
            complete: false
        });

        requests.push(req);
    }
}