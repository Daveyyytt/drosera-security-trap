// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockSTETH is ERC20 {
    constructor() ERC20("Mock stETH", "mstETH") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function simulateBufferDrain(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
