// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Token {
    // public variables here
    string public tokenName = "LAKIENGS";
    string public abbrv = "LKS";
    uint public totalSupply = 0;
    address public owner;

    // mapping variable here
    mapping(address => uint) public balances;

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Constructor to set the owner
    constructor() {
        owner = msg.sender;
    }

    // mint function
    function mint(address _add, uint _val) public onlyOwner {
        totalSupply += _val;
        balances[_add] += _val;
    }

    // burn function
    function burn(address _add, uint _val) public onlyOwner {
        if (balances[_add] >= _val) {
            totalSupply -= _val;
            balances[_add] -= _val;
        }
    }

    // transfer function
    function transfer(address _trans, uint _val) public {
        require(_trans != address(0), "Invalid address");
        require(_val <= balances[msg.sender], "Insufficient balance");
        
        balances[msg.sender] -= _val;
        balances[_trans] += _val;
    }
}
