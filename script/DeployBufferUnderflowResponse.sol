// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {BufferUnderflowResponse} from "../src/BufferUnderflowResponse.sol";

contract DeployBufferUnderflowResponse is Script {
    function run() external {
        // Start broadcasting (will use the private key from command line)
        vm.startBroadcast();
        
        // Deploy the response contract
        BufferUnderflowResponse response = new BufferUnderflowResponse();
        
        console.log("BufferUnderflowResponse deployed at:", address(response));
        
        vm.stopBroadcast();
    }
}
