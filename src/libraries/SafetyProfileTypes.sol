// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {SafetyTypes} from "src/libraries/SafetyTypes.sol";

/// @title SafetyProfileTypes
/// @notice Optional helper-profile types for disclosed interpretive attributes.
/// @dev These types are extension-layer metadata only. They do not redefine the
/// canonical core disclosure layer and they do not express trust guarantees.
library SafetyProfileTypes {
    struct DisclosureProfile {
        bool publisherAssertedManifestClosure;
        bool publisherAssertedCoveredComponentsCompleteness;
        bool publisherAssertedCoveredAssetsCompleteness;
    }

    struct ComponentProfile {
        address component;
        bool declaredReviewSensitive;
        bool declaredFundsSensitive;
        bool declaredExactVerified;
        SafetyTypes.EvidenceStrength evidenceStrength;
    }

    struct NodeProfile {
        bytes32 nodeId;
        bool declaredAuthority;
        bool declaredReviewSensitive;
        SafetyTypes.EvidenceStrength evidenceStrength;
    }

    struct PowerProfile {
        bytes32 powerId;
        SafetyTypes.ImpactLevel declaredImpactLevel;
        bool declaredCanTouchUserFunds;
        SafetyTypes.EvidenceStrength evidenceStrength;
    }

    struct EdgeProfile {
        bytes32 edgeId;
        bool declaredCanBypassDelay;
        bool declaredTouchesUserFunds;
        SafetyTypes.EvidenceStrength evidenceStrength;
    }
}
