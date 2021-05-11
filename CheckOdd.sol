// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd {
    
    function check (uint256 value) public pure returns(bool) {

        return (value % 2 == 0) ? true : false;
        
    }
}