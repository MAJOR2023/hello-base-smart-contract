// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {HelloBase} from "../src/HelloBase.sol";

contract HelloBaseTest is Test {
    HelloBase public helloBase;
    address public owner;
    address public user;
    
    function setUp() public {
        owner = address(this);
        user = address(0x123);
        helloBase = new HelloBase("Initial Message");
    }
    
    function test_InitialState() public view {
        assertEq(helloBase.message(), "Initial Message");
        assertEq(helloBase.owner(), owner);
    }
    
    function test_UpdateMessage_ByOwner() public {
        string memory newMsg = "Updated on Base!";
        helloBase.updateMessage(newMsg);
        assertEq(helloBase.message(), newMsg);
    }
    
    function test_UpdateMessage_NonOwner_Reverts() public {
        vm.prank(user);
        vm.expectRevert("Only owner can update message");
        helloBase.updateMessage("Hacked!");
    }
}
