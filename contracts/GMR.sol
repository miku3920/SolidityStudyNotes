// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract GMR {
    address public manager;
    address payable[] public players;

    constructor() {
        manager = msg.sender;
    }

    modifier onlyManager() {
        require(msg.sender == manager);
        _;
    }

    function enterGame() public payable {
        require(msg.value > 0.01 ether);
        players.push(msg.sender);
    }

    function chooseByTime() private view returns (uint256) {
        return block.timestamp % players.length;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function drawAndPayMoneyToWinner() public onlyManager {
        uint256 index = chooseByTime();
        players[index].transfer(getBalance());

        players = new address payable[](0);
    }

    function getCurrentPlayers() public view returns (address payable[] memory) {
        return players;
    }
}
