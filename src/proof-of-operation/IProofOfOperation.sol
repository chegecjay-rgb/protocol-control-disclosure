// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IProofOfOperation
/// @notice Minimal interface for emitting verifiable operational events.
/// @dev Separate from ERC-8241. Describes behavior, not capabilities.
interface IProofOfOperation {
    /// @notice Emitted when a privileged or sensitive operation is executed.
    /// @param operator The address performing the action.
    /// @param operation A short identifier of the action (e.g. "PAUSE", "UPGRADE").
    /// @param target The contract or system affected.
    /// @param data Optional opaque data describing the operation.
    event OperationExecuted(
        address indexed operator,
        string operation,
        address indexed target,
        bytes data
    );
}
