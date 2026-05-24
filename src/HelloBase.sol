// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HelloBase {
    string public message;
    address public owner;
    
    event MessageUpdated(string newMessage, address indexed updatedBy, uint256 timestamp);
    
    constructor(string memory _initialMessage) {
        message = _initialMessage;
        owner = msg.sender;
    }
    
    function updateMessage(string memory _newMessage) public {
        require(msg.sender == owner, "Only owner can update message");
        message = _newMessage;
        emit MessageUpdated(_newMessage, msg.sender, block.timestamp);
    }
}
