// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {SafetyClaimsTypes} from "src/libraries/SafetyClaimsTypes.sol";

/// @title IProtocolSafetyClaims
/// @notice Optional extension for machine-readable public claims, linked assumptions,
/// verifiability classes, and evidence attachments.
/// @dev This extension must not be interpreted as a safety score or trust verdict.
/// It only exposes what is being claimed, how it is classified, and what it points to.
interface IProtocolSafetyClaims is IERC165 {
    event ClaimsStateUpdated(uint256 claimsNonce);

    event ClaimRecordSet(
        bytes32 indexed claimId,
        SafetyClaimsTypes.ClaimType claimType,
        SafetyClaimsTypes.ClaimSubjectType subjectType,
        bytes32 indexed subjectId,
        SafetyClaimsTypes.VerifiabilityClass verifiability,
        SafetyClaimsTypes.ClaimStatus status,
        bytes32 supersedesClaimId
    );

    event AssumptionRecordSet(
        bytes32 indexed assumptionId,
        bytes32 indexed claimId,
        SafetyClaimsTypes.AssumptionKind kind,
        SafetyClaimsTypes.ClaimStatus status
    );

    event ClaimEvidenceLinkSet(
        bytes32 indexed linkId,
        bytes32 indexed claimId,
        SafetyClaimsTypes.EvidenceLinkKind kind,
        bytes32 referenceId
    );

    function claimsNonce() external view returns (uint256);

    function claimCount() external view returns (uint256);
    function claimIdAt(uint256 index) external view returns (bytes32);
    function claimRecord(bytes32 claimId) external view returns (SafetyClaimsTypes.ClaimRecord memory);

    function assumptionCount() external view returns (uint256);
    function assumptionIdAt(uint256 index) external view returns (bytes32);
    function assumptionRecord(bytes32 assumptionId) external view returns (SafetyClaimsTypes.AssumptionRecord memory);

    function claimAssumptionCount(bytes32 claimId) external view returns (uint256);
    function claimAssumptionIdAt(bytes32 claimId, uint256 index) external view returns (bytes32);

    function claimEvidenceLinkCount() external view returns (uint256);
    function claimEvidenceLinkIdAt(uint256 index) external view returns (bytes32);
    function claimEvidenceLink(bytes32 linkId) external view returns (SafetyClaimsTypes.ClaimEvidenceLink memory);

    function claimEvidenceLinkCountForClaim(bytes32 claimId) external view returns (uint256);
    function claimEvidenceLinkIdAtForClaim(bytes32 claimId, uint256 index) external view returns (bytes32);
}
