// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";

contract VerifyScript is Script {
    function run() external {
        string memory contractName = vm.envOr("CONTRACT_NAME", string("HelloBase"));
        string memory contractAddress = vm.envString("CONTRACT_ADDRESS");
        
        console.log("Verifying %s at address %s...", contractName, contractAddress);
        console.log("Run: forge verify-contract %s src/%s.sol:%s --chain 84532", contractAddress, contractName, contractName);
    }
}
