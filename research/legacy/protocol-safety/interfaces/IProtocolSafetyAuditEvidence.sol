// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {SafetyTypes} from "src/libraries/SafetyTypes.sol";

/// @title IProtocolSafetyAuditEvidence
/// @notice Optional audit/evidence metadata extension for protocol safety disclosures.
/// @dev This interface exposes supplementary audit-related records and derived helper views over
/// attached audit/evidence metadata.
///
/// Audit/evidence metadata is not canonical truth.
/// It does not, by itself, prove:
/// - safety
/// - completeness
/// - present-day contextual relevance
/// - exact live-system equivalence
/// - privilege graph completeness
/// - absence of unresolved or undisclosed issues
///
/// Audit/evidence metadata may be partial, drifted, disputed, time-lagged, or context-mismatched relative to the
/// live deployment. If any audit-derived output conflicts with raw disclosures from
/// `IProtocolSafetyCore`, the raw core disclosures remain authoritative.
///
/// Audit records and audit findings are declared records. Audit issues and evidence
/// summaries are derived current-state helper views and must not be treated as stable
/// historical identities unless separately versioned by an implementation.
interface IProtocolSafetyAuditEvidence is IERC165 {
    /// @notice Optional secondary audit and evidence interface.
    /// @dev Audit and evidence records are contextual and evidentiary only.
    /// They do not replace or control the canonical meaning of raw core disclosures.

    /// @notice Emitted when an audit record is created or updated.
    /// @dev Audit existence does not imply current applicability or full coverage.
    event AuditRecordSet(
        bytes32 indexed auditId,
        string auditorName,
        string reportURI,
        bytes32 reportHash,
        bytes32 coveredManifestHash,
        SafetyTypes.AuditScope scope
    );

    /// @notice Emitted when audit context metadata is created or updated for `auditId`.
    /// @dev Context metadata is distinct from audit existence. A present audit may still be
    /// drifted, partial, time-lagged, or not representative of the live deployment.
    event AuditContextSet(
        bytes32 indexed auditId,
        SafetyTypes.AuditContextStatus status,
        bool liveMatchesManifest,
        bool liveMatchesDeployment,
        bool stale
    );

    /// @notice Emitted when an audit finding record is created or updated.
    /// @dev Audit findings are supplementary evidence-layer records. They do not override the
    /// canonical raw protocol disclosures or independently certify live behavior.
    event AuditFindingSet(
        bytes32 indexed findingId,
        bytes32 indexed auditId,
        SafetyTypes.AuditFindingStatus status,
        bytes32 indexed subjectId,
        bytes32 powerId,
        bool privilegeRelated,
        bool affectsUserFunds
    );

    /// @notice Emitted when a derived audit issue is recorded for the current declared state.
    /// @dev Audit issues are derived outputs over the current audit-evidence state and are not
    /// stable append-only historical identities unless separately versioned.
    event AuditIssueRecorded(
        SafetyTypes.AuditIssueKind indexed kind,
        bytes32 indexed auditId,
        bytes32 indexed relatedFindingId,
        bytes32 subjectId,
        bytes32 detailsHash
    );

    /// @notice Emitted when derived audit/evidence helper state is recomputed from the current
    /// declared audit records, context metadata, and audit findings.
    /// @dev This event reflects declared-state-derived outputs only.
    /// It must not be interpreted as independently verified truth.
    event AuditDerivedStateRecomputed(
        uint256 auditIssueCount,
        uint256 contextMatchedAuditCount,
        uint256 openDeclaredAuditFindingCount,
        uint256 possiblyStaleAuditCount
    );

    /// @notice Emitted whenever the declared audit/evidence state changes.
    /// @dev The nonce is monotonically increasing for audit-evidence mutations only.
    /// It is intended for cache invalidation, state diffing, and freshness tracking.
    event AuditEvidenceStateUpdated(uint256 indexed auditEvidenceNonce);

    /// @notice Returns the number of declared audit records.
    function auditCount() external view returns (uint256);

    /// @notice Returns the audit record declared at `index`.
    /// @dev Audit records are enumerated in insertion order.
    /// Indices are stable after first insertion within the same live storage instance.
    function auditAt(uint256 index) external view returns (SafetyTypes.AuditRecord memory);

    /// @notice Returns the declared audit record for `auditId`.
    /// @dev Reverts if `auditId` has not been declared.
    /// Missing-record behavior must not be inferred from zero-value structs.
    function auditInfo(bytes32 auditId) external view returns (SafetyTypes.AuditRecord memory);

    /// @notice Returns whether `auditId` has a declared audit record.
    function isRegisteredAudit(bytes32 auditId) external view returns (bool);

    /// @notice Returns the declared audit context record for `auditId`.
    /// @dev Reverts if context metadata has not been declared for `auditId`.
    /// Context metadata is supplementary evidence state and does not, by itself, prove that the
    /// live deployment exactly matches the audited system.
    function auditContextInfo(bytes32 auditId)
        external
        view
        returns (SafetyTypes.AuditContext memory);

    /// @notice Returns the number of declared audit finding records.
    function auditFindingCount() external view returns (uint256);

    /// @notice Returns the audit finding declared at `index`.
    /// @dev Audit findings are enumerated in insertion order.
    /// Indices are stable after first insertion within the same live storage instance.
    function auditFindingAt(uint256 index) external view returns (SafetyTypes.AuditFindingRecord memory);

    /// @notice Returns the declared audit finding record for `findingId`.
    /// @dev Reverts if `findingId` has not been declared.
    /// Missing-record behavior must not be inferred from zero-value structs.
    function auditFindingInfo(bytes32 findingId)
        external
        view
        returns (SafetyTypes.AuditFindingRecord memory);

    /// @notice Returns the number of declared audit findings currently in `status`.
    function auditFindingCountByStatus(SafetyTypes.AuditFindingStatus status)
        external
        view
        returns (uint256);

    /// @notice Returns the current audit-evidence-state nonce.
    /// @dev This nonce changes only when declared audit/evidence records change.
    /// It is intended for cache invalidation and freshness tracking by downstream tooling.
    function auditEvidenceNonce() external view returns (uint256);

    /// @notice Returns the derived summary of the current audit/evidence metadata state.
    /// @dev This is a helper view only.
    /// It must not be interpreted as an audit certification, trust badge, or overall safety score.
    function auditEvidenceSummary() external view returns (SafetyTypes.AuditEvidenceSummary memory);

    /// @notice Returns the number of derived audit helper issues for the current state.
    /// @dev Audit issues are derived records, not stable append-only historical identities.
    function auditIssueCount() external view returns (uint256);

    /// @notice Returns the derived audit issue at `index` for the current state.
    /// @dev Audit issue ordering is deterministic for the current state but is not a stable
    /// identifier across updates. Consumers must not persist audit issue identity by index.
    function auditIssueAt(uint256 index) external view returns (SafetyTypes.AuditIssue memory);

    /// @notice Returns the number of derived audit helper issues of `kind` for the current state.
    function auditIssueCountByKind(SafetyTypes.AuditIssueKind kind) external view returns (uint256);

    /// @notice Returns whether at least one derived audit issue of `kind` exists for the current state.
    /// @dev This is a convenience predicate over the current derived audit-evidence state only.
    function hasAuditIssue(SafetyTypes.AuditIssueKind kind) external view returns (bool);
}