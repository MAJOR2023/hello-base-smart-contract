// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HelloBase {
    string public message;
    address public owner;
    
    event MessageUpdated(string newMessage, address indexed updatedBy, uint256 timestamp);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    constructor(string memory _initialMessage) {
        message = _initialMessage;
        owner = msg.sender;
    }
    
    function updateMessage(string memory _newMessage) public onlyOwner {
        message = _newMessage;
        emit MessageUpdated(_newMessage, msg.sender, block.timestamp);
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
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
