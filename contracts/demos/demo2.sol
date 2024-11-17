// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo2 {
    function getResult(uint256 a, uint256 b) public pure returns (string memory) {
        return integerToString(a + b);
    }

    function integerToString(uint i) private pure returns (string memory) {
        if (i == 0) {
            return "0";
        }
        uint j = i;
        uint k;
        while (j != 0) {
            k++;
            j /= 10;
        }
        bytes memory bstr = new bytes(k--);
        while (i != 0) {
            bstr[k--] = bytes1(uint8(48 + (i % 10)));
            i /= 10;
        }
        return string(bstr);
    }
}
