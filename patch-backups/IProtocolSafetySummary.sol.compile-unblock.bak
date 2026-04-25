// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {SafetyTypes} from "src/libraries/SafetyTypes.sol";

/// @title IProtocolSafetySummary
/// @notice Optional helper-view extension for protocol safety disclosures.
/// @dev This interface exposes derived summaries, convenience predicates, current-state findings,
/// and declared-graph helper views over the current declared disclosure state.
///
/// These outputs are not canonical truth.
/// They do not, by themselves, prove:
/// - safety
/// - completeness
/// - honesty
/// - live-system equivalence
/// - audit applicability
/// - absence of undeclared dependencies
///
/// If any summary output conflicts with raw disclosures from `IProtocolSafetyCore`,
/// the raw core disclosures are authoritative.
///
/// Summary outputs are derived, state-dependent helper views and must not be treated
/// as append-only historical records unless separately versioned by an implementation.
interface IProtocolSafetySummary is IERC165 {
    /// @notice Emitted when derived summary state is recomputed from the current declared graph.
    /// @dev This event reflects declared-state-derived outputs only.
    /// It must not be interpreted as independently verified truth.
    event DerivedStateRecomputed(
        uint256 findingCount,
        uint256 unknownPrivilegeCount,
        uint256 sensitivePowerCount,
        uint256 delayedSensitivePowerCount
    );

    /// @notice Emitted when a derived diagnostic finding is recorded for the current declared state.
    /// @dev Findings are derived outputs over declared state. They must not be conflated with
    /// independently verified findings produced by an external verifier.
    event FindingRecorded(
        SafetyTypes.DiagnosticKind indexed kind,
        bytes32 indexed subjectId,
        bytes32 indexed referenceId,
        bytes32 relatedId,
        SafetyTypes.FindingCategory category,
        SafetyTypes.EvidenceStrength evidenceStrength,
        bytes32 detailsHash
    );

    /// @notice Returns a derived summary of disclosure coverage and disclosure quality.
    /// @dev This is a helper view over the current declared state.
    /// It must not be treated as stronger than the underlying raw disclosures.
    function disclosureSummary() external view returns (SafetyTypes.DisclosureSummary memory);

    /// @notice Returns a derived summary of constraint-related properties.
    /// @dev This is a helper view over the current declared state.
    /// It must not be interpreted as proof that all relevant constraints have been
    /// independently verified or that undeclared bypasses do not exist.
    function constraintSummary() external view returns (SafetyTypes.ConstraintSummary memory);

    /// @notice Returns a derived summary of review cues implied by the current
    /// declared state.
    /// @dev This is a helper view intended for downstream tooling and user interfaces.
    /// It does not replace direct inspection of the underlying findings and disclosures.
    function reviewCueSummary()
        external
        view
        returns (SafetyTypes.ReviewCueSummary memory);

    /// @notice Returns the distribution of proof levels across the current declared state.
    /// @dev This is a helper view only.
    /// It must not be interpreted as an overall trust score or safety certification.
    function evidenceStrengthDistribution()
        external
        view
        returns (SafetyTypes.EvidenceStrengthDistribution memory);

    /// @notice Returns the number of derived findings for the current declared state.
    /// @dev Findings are derived records, not stable append-only historical identities.
    function findingCount() external view returns (uint256);

    /// @notice Returns the derived finding at `index` for the current declared state.
    /// @dev Finding ordering is deterministic for the current state but is not a stable identifier
    /// across updates. Consumers must not persist finding identity by numeric index.
    function findingAt(uint256 index) external view returns (SafetyTypes.DiagnosticFinding memory);

    /// @notice Returns the count of currently derived diagnostic findings of `kind`.
    /// @dev This reflects the current declared state only.
    /// It does not represent independently verified findings unless an external verifier
    /// reconstructs and confirms the same result.
    function findingCountByKind(SafetyTypes.DiagnosticKind kind) external view returns (uint256);

    /// @notice Returns whether there is at least one currently derived diagnostic finding of `kind`.
    /// @dev This is a convenience predicate over the current declared state only.
    function hasFinding(SafetyTypes.DiagnosticKind kind) external view returns (bool);

    /// @notice Returns whether the declared graph contains a transitive control path from
    /// `fromNodeId` to `toNodeId`.
    /// @dev This helper reflects the declared graph only. It does not prove the absence of
    /// undeclared, offchain, or independently discovered control paths.
    function hasTransitiveControlPath(bytes32 fromNodeId, bytes32 toNodeId)
        external
        view
        returns (bool);

    /// @notice Returns whether the declared graph contains a transitive path from `fromNodeId`
    /// to a declared power of kind `powerKind` over `target`.
    /// @dev This helper reflects the declared graph only. It does not prove the absence of
    /// undeclared, offchain, or independently discovered declaredAuthority paths.
    function hasTransitivePowerPath(
        bytes32 fromNodeId,
        address target,
        SafetyTypes.PowerKind powerKind
    ) external view returns (bool);

    /// @notice Returns whether the declared power identified by `powerId` is flagged by the
    /// implementation's current summary heuristics as review-sensitive.
    /// @dev This is a convenience interpretation of declared state for review routing.
    /// It must not override the canonical raw power descriptor or be treated as canonical severity truth.
    function isPowerSensitive(bytes32 powerId) external view returns (bool);
}
