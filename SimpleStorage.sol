// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    
    address private _owner;
    uint256 private _storedData;
    
    constructor(address owner_) {
        _owner = owner_;
    }
    
    function setStoredData(uint256 value) public {
        require (msg.sender == _owner, "setStoredData : only _owner can modify storedData");
        _storedData = 0;
       value += _storedData;
    }

    
    function storedData() public view returns(uint256){
        return _storedData;
    }
    
    
}