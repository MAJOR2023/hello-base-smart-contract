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
}
