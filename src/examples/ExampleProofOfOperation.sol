// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../proof-of-operation/IProofOfOperation.sol";

/// @title ExampleProofOfOperation
/// @notice Minimal contract emitting operational events.
contract ExampleProofOfOperation is IProofOfOperation {

    function executePause(address target) external {
        emit OperationExecuted(
            msg.sender,
            "PAUSE",
            target,
            ""
        );
    }

    function executeUpgrade(address target, bytes calldata data) external {
        emit OperationExecuted(
            msg.sender,
            "UPGRADE",
            target,
            data
        );
    }
}
