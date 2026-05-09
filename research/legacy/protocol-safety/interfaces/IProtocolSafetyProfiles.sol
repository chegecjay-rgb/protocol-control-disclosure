// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {SafetyProfileTypes} from "src/libraries/SafetyProfileTypes.sol";
import {SafetyTypes} from "src/libraries/SafetyTypes.sol";

/// @title IProtocolSafetyProfiles
/// @notice Optional helper-profile extension for disclosed interpretive attributes.
/// @dev This surface exists to hold publisher-declared helper metadata that should not
/// be treated as canonical core truth.
interface IProtocolSafetyProfiles {
    event ProfilesStateUpdated(uint256 profilesNonce);

    event DisclosureProfileSet(
        bool publisherAssertedManifestClosure,
        bool publisherAssertedCoveredComponentsCompleteness,
        bool publisherAssertedCoveredAssetsCompleteness
    );

    event ComponentProfileSet(
        address indexed component,
        bool declaredReviewSensitive,
        bool declaredFundsSensitive,
        bool declaredExactVerified,
        SafetyTypes.EvidenceStrength evidenceStrength
    );

    event NodeProfileSet(
        bytes32 indexed nodeId,
        bool declaredAuthority,
        bool declaredReviewSensitive,
        SafetyTypes.EvidenceStrength evidenceStrength
    );

    event PowerProfileSet(
        bytes32 indexed powerId,
        SafetyTypes.ImpactLevel declaredImpactLevel,
        bool declaredCanTouchUserFunds,
        SafetyTypes.EvidenceStrength evidenceStrength
    );

    event EdgeProfileSet(
        bytes32 indexed edgeId,
        bool declaredCanBypassDelay,
        bool declaredTouchesUserFunds,
        SafetyTypes.EvidenceStrength evidenceStrength
    );

    function profilesNonce() external view returns (uint256);

    function disclosureProfile() external view returns (SafetyProfileTypes.DisclosureProfile memory);

    function componentProfile(address component) external view returns (SafetyProfileTypes.ComponentProfile memory);

    function nodeProfile(bytes32 nodeId) external view returns (SafetyProfileTypes.NodeProfile memory);

    function powerProfile(bytes32 powerId) external view returns (SafetyProfileTypes.PowerProfile memory);

    function edgeProfile(bytes32 edgeId) external view returns (SafetyProfileTypes.EdgeProfile memory);
}
