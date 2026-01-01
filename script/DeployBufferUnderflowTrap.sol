// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {BufferUnderflowTrap} from "../src/BufferUnderflowTrap.sol";

contract DeployBufferUnderflowTrap is Script {
    function run() external {
        // Start broadcasting
        vm.startBroadcast();
        
        // Deploy the trap contract
        BufferUnderflowTrap trap = new BufferUnderflowTrap();
        
        console.log("BufferUnderflowTrap deployed at:", address(trap));
        
        vm.stopBroadcast();
    }
}
