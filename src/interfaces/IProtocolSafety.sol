// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IProtocolSafetyAuditEvidence} from "src/interfaces/IProtocolSafetyAuditEvidence.sol";
import {IProtocolSafetyCore} from "src/interfaces/IProtocolSafetyCore.sol";
import {IProtocolSafetySummary} from "src/interfaces/IProtocolSafetySummary.sol";
import {SafetyTypes} from "src/libraries/SafetyTypes.sol";

/// @title IProtocolSafety
/// @notice Aggregate compatibility interface for protocol safety disclosures.
/// @dev This interface aggregates:
/// - IProtocolSafetyCore
/// - IProtocolSafetySummary
/// - IProtocolSafetyAuditEvidence
///
/// It exists as a convenience and compatibility surface for consumers that prefer a single
/// interface and for address-oriented integrations.
///
/// This interface is not the canonical identity model.
/// The canonical standard surface remains:
/// - IProtocolSafetyCore
/// - optional IProtocolSafetySummary
/// - optional IProtocolSafetyAuditEvidence
///
/// In the canonical model, `nodeId` is authoritative.
/// Address-based helpers in this interface are compatibility sugar only and are not sufficient
/// to represent all declaredAuthority structures, especially non-address-native or partly offchain ones.
interface IProtocolSafety is IProtocolSafetyCore, IProtocolSafetySummary, IProtocolSafetyAuditEvidence {
    /// @notice Compatibility lookup for address-backed nodes.
    /// @dev Reverts if `nodeAddress` is not bound to a declared node.
    /// This helper exists for address-oriented consumers only.
    /// `nodeId` remains the canonical node identity in the core interface.
    function nodeInfo(address nodeAddress) external view returns (SafetyTypes.GraphNode memory);

    /// @notice Returns whether `nodeAddress` is bound to a declared node for compatibility use.
    /// @dev This helper does not imply that every relevant declaredAuthority can be represented by an
    /// address binding.
    function isRegisteredNode(address nodeAddress) external view returns (bool);

    /// @notice Compatibility helper returning whether the declared graph contains a transitive
    /// control path from `fromAddress` to `toAddress`.
    /// @dev This reflects the declared graph only and only for address-bound nodes.
    /// It does not prove the absence of undeclared, offchain, or non-address-native control paths.
    function hasTransitiveControlPath(address fromAddress, address toAddress) external view returns (bool);

    /// @notice Compatibility helper returning whether the declared graph contains a transitive
    /// path from `fromAddress` to a declared power of kind `powerKind` over `target`.
    /// @dev This reflects the declared graph only and only for address-bound nodes.
    /// It does not prove the absence of undeclared, offchain, or non-address-native declaredAuthority paths.
    function hasTransitivePowerPath(
        address fromAddress,
        address target,
        SafetyTypes.PowerKind powerKind
    ) external view returns (bool);
}
