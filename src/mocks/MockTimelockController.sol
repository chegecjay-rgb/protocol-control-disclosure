// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MockTimelockController {
    error Unauthorized();

    address public immutable admin;
    uint256 public minDelay;

    event MinDelayUpdated(uint256 previousDelay, uint256 newDelay);

    constructor(address admin_, uint256 minDelay_) {
        admin = admin_;
        minDelay = minDelay_;
    }

    function updateDelay(uint256 newDelay) external {
        if (msg.sender != admin) revert Unauthorized();

        uint256 previousDelay = minDelay;
        minDelay = newDelay;

        emit MinDelayUpdated(previousDelay, newDelay);
    }
}