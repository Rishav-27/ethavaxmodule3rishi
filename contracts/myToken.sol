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
    function mint(address _address, uint _value) public onlyOwner {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // burn function
    function burn(address _address, uint _value) public onlyOwner {
        if (balances[_address] >= _value) {
            totalSupply -= _value;
            balances[_address] -= _value;
        }
    }

    // transfer function
    function transfer(address _to, uint _value) public {
        require(_to != address(0), "Invalid address");
        require(_value <= balances[msg.sender], "Insufficient balance");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
}
