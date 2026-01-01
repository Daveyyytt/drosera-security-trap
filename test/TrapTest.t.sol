// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {BufferUnderflowTrap} from "../src/BufferUnderflowTrap.sol";

contract TrapTest is Test {
    BufferUnderflowTrap trap;
    
    function setUp() public {
        trap = new BufferUnderflowTrap();
    }
    
    function testCollect() public {
        bytes memory data = trap.collect();
        uint256 balance = abi.decode(data, (uint256));
        assertEq(balance, 5000);
    }
    
    function testShouldRespond() public {
        // Create mock data
        bytes[] memory data = new bytes[](1);
        data[0] = abi.encode(uint256(5000)); // Below threshold
        
        (bool shouldRespond, bytes memory response) = trap.shouldRespond(data);
        
        assertTrue(shouldRespond);
        assertGt(response.length, 0);
    }
    
    function testShouldNotRespond() public {
        // Create mock data
        bytes[] memory data = new bytes[](1);
        data[0] = abi.encode(uint256(15000)); // Above threshold
        
        (bool shouldRespond, bytes memory response) = trap.shouldRespond(data);
        
        assertFalse(shouldRespond);
    }
}
