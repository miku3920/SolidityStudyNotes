// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

library ConvertLib {
    function convert(
        uint amount,
        uint conversionRate
    ) public pure returns (uint convertedAmount) {
        return amount * conversionRate;
    }
}
