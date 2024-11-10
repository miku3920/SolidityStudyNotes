// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo3 {
    function localUint256Array(uint8 len) public pure returns (uint256) {
        uint256[] memory a = new uint256[](len);
        return a.length;
    }

    function localByteArray(uint8 len) public pure returns (uint256) {
        byte[] memory b = new byte[](len);
        return b.length;
    }

    function localBytesArray(uint8 len) public pure returns (uint256) {
        bytes memory bs = new bytes(len);
        return bs.length;
    }

    function getValueFromLocalUint256ArrayByIndex(uint8 index) public pure returns (uint256) {
        uint len = 7;
        uint256[] memory a = new uint256[](len);
        a[0] = 5;
        a[1] = 10;
        a[2] = 142857142857;
        return a[index];
    }


    uint256[] members = new uint256[](5);

    function initStorageMembers() public {
        members[0] = 2;
        members[1] = 4;
        members[2] = 8;
        members[3] = 16;
        members[4] = 32;
    }

    function pushValueToStorageMembers(uint256 value) public {
        members.push(value);
    }

    function getValueFromStorageMembersByIndex(uint8 index) public view returns (uint256) {
        return members[index];
    }

    function getStorageMembers() public view returns (uint256[] memory) {
        return members;
    }

}