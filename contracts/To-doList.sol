// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract To-d0List {
    uint256 public _idUser;
    address public ownerofContract;

    address[] public creators;
    string[] public message;
    uint256[] public messageid;

    struct To-d0ListApp{
        address account;
        uint256 userid;
        string message;
        bool completed;
    }

    event To-doEvent(
        address indexed account,
        uint256 indexed userId,
        string message,
        bool completed
    );

    mapping (address => To-doListApp) public to-doListApps;

    constructor(){
        ownerofContract = msg.sender;
    }

    function inc() internal {
        _idUser++;
    }

    function createlist(string calldata _message) external{
        inc();

        uint256 idNumber = _idUser;
        TO-doListApp storage todo = todolistApps[msg.sender];

        toDo.account = msg.sender;
        toDo.message = _message;
        toDo.completed = false;
        toDo.userId = idNumber;

        creators.push(msg.sender);
        message.push(_message);
        messageId.push(idNumber);

        emit To-doEvent(msg.sender, userId, message, completed);
    }

    function getCreatorData(address _address) public view returns(address, uint256, string memory, bool){

        TodolistApps memory singleUserData = todolistApps[_address];

        return (
            singleUserData.account,
            singleUserData.userId,
            singleUserData.message,
            singleUserData.completed
        );
    }

    function getAddress() external view returns (address[] memory){
        return creators;
    }

    function getMessage() external view return ( string[] memory) {
        return message;
    }

    function toggle(address _creator) public {
        TodolistApp storage singleUserData = todolistApps[_creator];
        singleUserData.completed =!singleUserData.completed
    }
    

}