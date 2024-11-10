// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo3 {
    function uint256Array(uint8 len) public pure returns (uint256) {
        uint256[] memory a = new uint256[](len);
        return a.length;
    }

    function byteArray(uint8 len) public pure returns (uint256) {
        byte[] memory b = new byte[](len);
        return b.length;
    }

    function bytesArray(uint8 len) public pure returns (uint256) {
        bytes memory bs = new bytes(len);
        return bs.length;
    }

    function getValueUint256Array(uint8 index) public pure returns (uint256) {
        uint len = 7;
        uint256[] memory a = new uint256[](len);
        a[0] = 5;
        a[1] = 10;
        a[2] = 142857142857;
        return a[index];
    }


}