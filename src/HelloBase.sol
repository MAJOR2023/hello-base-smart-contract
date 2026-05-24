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
    
    function getContractInfo() public view returns (
        string memory returnedMsg,
        address own,
        uint256 chainId
    ) {
        return (message, owner, block.chainid);
    }
    
    function isOnBase() public view returns (bool) {
        return block.chainid == 8453 || block.chainid == 84532;
    }
}
