// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo10 {
    int256[] public myArray;

    constructor() {
        myArray.push(100);
    }

    function editByStorage() public {
        myArray.push(200);
        myArray.push(300);

        int256[] storage myArray2 = myArray;
        // 會改變原陣列
        myArray2[0] = 123;
        modifyArrayByStorage(myArray);
    }

    function editByMemory() public {
        myArray.push(200);
        myArray.push(300);

        int256[] memory myArray2 = myArray;
        // 不改變原陣列
        myArray2[0] = 123;
        modifyArrayByMemory(myArray);
    }

    function modifyArrayByStorage(int256[] storage array) private {
        array[1] = 234;
    }

    function modifyArrayByMemory(int256[] memory array) pure private {
        array[1] = 234;
    }

    function getArray() public view returns (int256[] memory) {
        return myArray;
    }
}
