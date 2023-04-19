// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankingSmartContract {
    address public owner;
    mapping(address => uint) public balances;
    mapping(address => uint) public feeCharged;
    mapping(address => uint) public lastTransactionTime;

    uint public constant MAX_FEE_PERCENTAGE = 1; 
    uint public constant MAX_TIME_DIFFERENCE_SECONDS = 5; 

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        
        require(block.timestamp - lastTransactionTime[msg.sender] >= MAX_TIME_DIFFERENCE_SECONDS, "Please wait for some time before making another transaction");

        
        uint fee = (amount * MAX_FEE_PERCENTAGE) / 100;
        require(balances[msg.sender] >= amount + fee, "Insufficient balance to cover the fee");

        
        balances[msg.sender] -= amount + fee;
        feeCharged[msg.sender] += fee;

    
        lastTransactionTime[msg.sender] = block.timestamp;

        
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Failed to send funds");
    }

    function getFeeCharged(address account) public view returns (uint) {
        return feeCharged[account];
    }
}
