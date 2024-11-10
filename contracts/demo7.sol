// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo7 {
    function multiple(uint256 a, uint256 b)
        public
        pure
        returns (uint256 product, uint256 sum)
    {
        product = a * b;
        sum = a + b;
    }

    function multipleAnonymous(uint256 a, uint256 b)
        public
        pure
        returns (uint256, uint256)
    {
        return (a * b, a + b);
    }
}
