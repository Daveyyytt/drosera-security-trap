// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ITrap} from "../lib/drosera-contracts/interfaces/ITrap.sol";

contract BufferUnderflowTrap is ITrap {
    // Mock buffer contract address
    address public constant BUFFER_ADDRESS = 0x0000000000000000000000000000000000000001;
    
    // Threshold: 10,000 wei (very low for testing)
    uint256 public constant THRESHOLD = 10000;
    
    function collect() external pure override returns (bytes memory) {
        uint256 mockBalance = 5000;
        return abi.encode(mockBalance);
    }
    
    function shouldRespond(bytes[] calldata data) external pure override returns (bool, bytes memory) {
        if (data.length == 0) {
            return (false, bytes("No data"));
        }
        
        uint256 balance = abi.decode(data[0], (uint256));
        
        if (balance < THRESHOLD) {
            return (true, abi.encode("Buffer underflow detected", balance, THRESHOLD));
        }
        
        return (false, bytes("Balance OK"));
    }
}
