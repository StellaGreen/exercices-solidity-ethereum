// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract PayableCalculator {
    
    using Address for address payable;
    
    mapping(address => uint256) private _balances;
    
    event Withdrew(address indexed recipient, uint256);
    event Added(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Subed(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Muled(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Dived(address indexed account, int256 nb1, int256 nb2, int256 res);
    event Moded(address indexed account, int256 nb1, int256 nb2, int256 res);
    
    
     function withdraw() public {
        uint256 amount = _balances[msg.sender];
        _withdraw(msg.sender, amount);
    }
    
    function add(int256 nb1, int256 nb2) public payable returns (int256){
        require(msg.value > 10**15, "PayableCalculator: Not enough ether sent");
        emit Added(msg.sender, nb1, nb2, nb1 + nb2);
        return nb1 + nb2;
    }
    
    function sub(int256 nb1, int256 nb2) public payable returns (int256){
        require(msg.value > 10**15, "PayableCalculator: Not enough ether sent");
        emit Subed(msg.sender, nb1, nb2, nb1 - nb2);
        return nb1 - nb2;
    }
    
    function mul(int256 nb1, int256 nb2) public payable returns (int256){
        require(msg.value > 10**15, "PayableCalculator: Not enough ether sent");
        emit Muled(msg.sender, nb1, nb2, nb1 * nb2);
        return nb1 * nb2;
    }
    
    function div(int256 nb1, int256 nb2) public payable returns (int256){
        require(msg.value > 10**15, "PayableCalculator: Not enough ether sent");
        emit Dived(msg.sender, nb1, nb2, nb1 / nb2);
        return nb1 / nb2;
    }
    
    function mod(int256 nb1, int256 nb2) public payable returns (int256){
        require(msg.value > 10**15, "PayableCalculator: Not enough ether sent");
        emit Moded(msg.sender, nb1, nb2, nb1 % nb2);
        return nb1 % nb2;
    }
    
        function _withdraw(address recipient, uint256 amount) private {
        require(_balances[recipient] > 0, "SmartWallet: can not withdraw 0 ether");
        require(_balances[recipient] >= amount, "SmartWallet: Not enough Ether");
        _balances[recipient] -= amount;
        payable(msg.sender).sendValue(amount);
        emit Withdrew(msg.sender, amount);
    }
}