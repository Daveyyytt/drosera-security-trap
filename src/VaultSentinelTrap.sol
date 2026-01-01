// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ITrap} from "./interfaces/ITrap.sol";

contract VaultSentinelTrap is ITrap {
    address public constant VAULT_ADDRESS = 0x0000000000000000000000000000000000000001;

    function collect() external view returns (bytes memory) {
        return abi.encode(VAULT_ADDRESS.balance);
    }

    function shouldRespond(bytes[] calldata data) external pure returns (bool, bytes memory) {
        if (data.length == 0) return (false, bytes("No data"));
        uint256 currentBalance = abi.decode(data[0], (uint256));
        if (currentBalance < 1 ether) {
            return (true, abi.encode("CRITICAL_LOW_BALANCE"));
        }
        return (false, bytes("Balance Safe"));
    }
}
