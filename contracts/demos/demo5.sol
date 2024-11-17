// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.4;
pragma experimental ABIEncoderV2;

contract Demo5 {
    struct Course {
        string id;
        string name;
        uint256 duration;
    }

    Course _course;

    function setCourse(string memory id, string memory name, uint256 duration) public {
        _course = Course(id, name, duration);
    }

    function getCourseId() public view returns (string memory) {
        return _course.id;
    }

    function getCourse() public view returns (Course memory) {
        return _course;
    }
}