// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HelloBase {
    string public message;
    address public owner;
    
    event MessageUpdated(string newMessage, address indexed updatedBy, uint256 timestamp);
}
