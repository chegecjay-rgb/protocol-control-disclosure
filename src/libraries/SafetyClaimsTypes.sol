// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @title SafetyClaimsTypes
/// @notice Optional machine-readable claims / assumptions / verifiability types.
/// @dev Extension layer only. This does not redefine the canonical core disclosure layer
/// and does not express safety verdicts, trust scores, or policy conclusions.
library SafetyClaimsTypes {
    enum ClaimType {
        GENERIC,
        CONTROL_CONSTRAINT,
        ASSET_HANDLING,
        UPGRADE_PROCESS,
        FAILURE_BEHAVIOR,
        DEPENDENCY_STATEMENT,
        AUDIT_SCOPE_STATEMENT,
        OTHER
    }

    enum ClaimSubjectType {
        PROTOCOL,
        COMPONENT,
        NODE,
        POWER,
        EDGE,
        ASSET,
        DEPENDENCY,
        OTHER
    }

    enum ClaimStatus {
        ACTIVE,
        WITHDRAWN,
        SUPERSEDED
    }

    enum VerifiabilityClass {
        DIRECTLY_VERIFIABLE,
        CONDITIONALLY_VERIFIABLE,
        EXTERNALLY_ASSUMED,
        NOT_PRESENTLY_VERIFIABLE
    }

    enum AssumptionKind {
        ONCHAIN_DEPENDENCY,
        OFFCHAIN_OPERATOR,
        MULTISIG_BEHAVIOR,
        ORACLE_INPUT,
        LEGAL_ENFORCEMENT,
        GOVERNANCE_PROCESS,
        SOCIAL_COORDINATION,
        EXTERNAL_INFRASTRUCTURE,
        OTHER
    }

    enum EvidenceLinkKind {
        CORE_DISCLOSURE_REFERENCE,
        AUDIT_RECORD_REFERENCE,
        AUDIT_FINDING_REFERENCE,
        EXTERNAL_ARTIFACT,
        TEST_ARTIFACT,
        PROOF_ARTIFACT,
        POLICY_ARTIFACT,
        LEGAL_ARTIFACT,
        OTHER
    }

    struct ClaimRecord {
        bytes32 claimId;
        bytes32 subjectId;
        ClaimSubjectType subjectType;
        ClaimType claimType;
        ClaimStatus status;
        VerifiabilityClass verifiability;
        bytes32 statementHash;
        string statementURI;
        bytes32 scopeHash;
        bytes32 supersedesClaimId;
    }

    struct AssumptionRecord {
        bytes32 assumptionId;
        bytes32 claimId;
        AssumptionKind kind;
        ClaimStatus status;
        bytes32 statementHash;
        string statementURI;
    }

    struct ClaimEvidenceLink {
        bytes32 linkId;
        bytes32 claimId;
        EvidenceLinkKind kind;
        bytes32 referenceId;
        bytes32 artifactHash;
        string artifactURI;
    }
}
