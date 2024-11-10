// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;

contract Demo4 {
    enum StarbuckSize {SHORT, TALL, GRANDE, VENTI, TRENTA}

    StarbuckSize _size;
    StarbuckSize constant _defaultSize = StarbuckSize.TALL;

    function setSize(StarbuckSize size) public {
        _size = size;
    }

    // view => read contract state
    function getSize() public view returns (StarbuckSize) {
        return _size;
    }

    // pure => no read for the contract state
    function getTrentaSize () public pure returns (StarbuckSize) {
        return StarbuckSize.TRENTA;
    }

    // pure => constant not contract state
    function getDefaultSize() public pure returns (StarbuckSize) {
        return _defaultSize;
    }

    function getSizeUint8() public view returns (uint8) {
        return uint8(_size);
    }

    function getSizeUint256() public view returns (uint256) {
        return uint256(_size);
    }

    function setSizeUint8(uint8 size) public {
        _size = StarbuckSize(size);
    }

}