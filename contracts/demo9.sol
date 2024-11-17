// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;
pragma experimental ABIEncoderV2; // 加這段才能使用雙重陣列

contract Demo9 {
    string[] public myArray;

    constructor() {
        myArray.push("Hi");
    }

    function push(string calldata _item) public {
        myArray.push(_item);
    }

    function getArray() public view returns (string[] memory) {
        return myArray;
    }
}

contract Demo9int {
    uint[][] public myArray;

    constructor() {
        // myArray[0].push(0);
        myArray.push([1, 2]);
    }

    function push(uint _item1, uint _item2) public {
        myArray.push([_item1, _item2]);
    }

    function getArray() public view returns (uint[][] memory) {
        return myArray;
    }
}