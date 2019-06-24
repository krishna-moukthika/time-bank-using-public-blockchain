pragma solidity ^0.5.1;

contract creditTransfer {

    mapping(address => uint256) public balanceOf;   //This creates an array with all balances
    function enroll(address _uaddr) public returns (uint) {
            balanceOf[_uaddr] = 100 wei;
        return balanceOf[_uaddr];
    }
    
    function transfer(address to, uint value) public{
        if (balanceOf[msg.sender] >= value) {
            balanceOf[to] += value;
            balanceOf[msg.sender] -= value;
        }
    }
}









