// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserProfile {
    
    struct User {
        string name;
        string email;
        string profilePicture;
        bytes32 encryptedData;
        uint256 lastUpdated;
    }
    
    mapping (address => User) private users;
    mapping (address => bool) private admins;
    
    event UserRegistered(address userAddress, string name, string email, string profilePicture);
    event UserUpdated(address userAddress, string name, string email, string profilePicture);
    
    constructor() {
        admins[msg.sender] = true;
    }
    
    modifier onlyAdmin() {
        require(admins[msg.sender] == true, "Only admins can call this function");
        _;
    }
    
    function registerUser(string memory _name, string memory _email, string memory _profilePicture, bytes32 _encryptedData) public {
        require(users[msg.sender].encryptedData == 0, "User already registered");
        users[msg.sender] = User({
            name: _name,
            email: _email,
            profilePicture: _profilePicture,
            encryptedData: _encryptedData,
            lastUpdated: block.timestamp
        });
        emit UserRegistered(msg.sender, _name, _email, _profilePicture);
    }
    
    function updateUser(string memory _name, string memory _email, string memory _profilePicture, bytes32 _encryptedData) public {
        require(users[msg.sender].encryptedData != 0, "User not registered");
        require(block.timestamp - users[msg.sender].lastUpdated >= 1 days, "User can only update once per day");
        users[msg.sender].name = _name;
        users[msg.sender].email = _email;
        users[msg.sender].profilePicture = _profilePicture;
        users[msg.sender].encryptedData = _encryptedData;
        users[msg.sender].lastUpdated = block.timestamp;
        emit UserUpdated(msg.sender, _name, _email, _profilePicture);
    }
    
    function getUser(address userAddress) public view returns (string memory name, string memory email, string memory profilePicture) {
        require(users[userAddress].encryptedData != 0, "User not found");
        return (users[userAddress].name, users[userAddress].email, users[userAddress].profilePicture);
    }
    
    function promoteAdmin(address adminAddress) public onlyAdmin {
        admins[adminAddress] = true;
    }
    
    function demoteAdmin(address adminAddress) public onlyAdmin {
        require(msg.sender != adminAddress, "Cannot demote self");
        admins[adminAddress] = false;
    }
    
}
