// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @title SafetyTypes
/// @notice Shared vocabulary for protocol control disclosures and optional helper layers.
/// @dev This library defines the typed disclosure language used by:
/// - IProtocolSafetyCore
/// - IProtocolSafetySummary
/// - IProtocolSafetyAuditEvidence
///
/// These types describe declared disclosures and derived helper views exposed by an implementation.
/// They do not, by themselves, certify safety, completeness, honesty, or live-system equivalence.
///
/// Unless a stricter rule is documented elsewhere:
/// - zero values mean "unset", "not declared", "not bound", or "no stronger claim made"
/// - zero values must not be interpreted as affirmative safety guarantees
/// - hash fields are opaque commitments whose serialization rules are not fully standardized here
library SafetyTypes {
    /// @notice Type of privileged or governance-relevant power disclosed by the implementation.
    /// @dev A power kind identifies the class of capability being described.
    /// It does not, by itself, prove that all live-system powers of that class have been disclosed.
    enum PowerKind {
        /// @dev Upgrade or implementation-replacement capability.
        UPGRADE,
        /// @dev Capability to pause or disable deposits.
        PAUSE_DEPOSITS,
        /// @dev Capability to pause or disable withdrawals.
        PAUSE_WITHDRAWALS,
        /// @dev Capability to mint assets, shares, claims, or equivalent units.
        MINT,
        /// @dev Capability to burn assets, shares, claims, or equivalent units.
        BURN,
        /// @dev Capability to blacklist addresses, users, or equivalent actors.
        BLACKLIST,
        /// @dev Capability to sweep, seize, confiscate, or redirect funds.
        SWEEP_FUNDS,
        /// @dev Capability to move reserves or reserve-like backing assets.
        MOVE_RESERVES,
        /// @dev Capability to change fees or fee-related parameters.
        CHANGE_FEES,
        /// @dev Capability to change oracle addresses, sources, or oracle configuration.
        CHANGE_ORACLE,
        /// @dev Capability to change risk parameters, limits, caps, or related controls.
        CHANGE_RISK_PARAMS,
        /// @dev Capability to execute arbitrary calls or equivalent unrestricted execution.
        ARBITRARY_CALL,
        /// @dev Capability to grant roles, authorities, or equivalent privileges.
        GRANT_ROLE,
        /// @dev Capability to revoke roles, authorities, or equivalent privileges.
        REVOKE_ROLE,
        /// @dev Capability to install or enable modules, plugins, or extensions.
        INSTALL_MODULE,
        /// @dev Capability to introduce delegatecall-based extension behavior.
        DELEGATECALL_EXTENSION,
        /// @dev Capability to bypass timelocks, delays, or equivalent execution friction.
        BYPASS_DELAY
    }

    /// @notice Type of controller or declaredAuthority exercising a disclosed power.
    /// @dev Controller type describes the declared form of declaredAuthority, not the full trustworthiness
    /// of the humans, institutions, or processes behind it.
    enum ControllerType {
        /// @dev No controller type declared.
        NONE,
        /// @dev Externally owned account.
        EOA,
        /// @dev Multisignature controller.
        MULTISIG,
        /// @dev Timelock controller.
        TIMELOCK,
        /// @dev Access-manager-style controller.
        ACCESS_MANAGER,
        /// @dev DAO or governance-controlled declaredAuthority.
        DAO,
        /// @dev Module- or plugin-based controller.
        MODULE,
        /// @dev Guardian or emergency reviewer/controller.
        GUARDIAN,
        /// @dev Bridge or cross-domain controller.
        BRIDGE,
        /// @dev Custom or uncategorized controller.
        CUSTOM
    }

    /// @notice Strength of substantiation for a declared fact.
    /// @dev This is about how strongly a fact is substantiated, not overall protocol safety.
    /// These labels must not be treated as a trust score.
    enum EvidenceStrength {
        /// @dev The implementation declares the fact, but the fact is not represented as
        /// independently derived or externally verified by the standard surface itself.
        SELF_DECLARED,
        /// @dev The fact is derived from observable onchain state or contract relationships,
        /// but not necessarily matched against exact source, build, or deployment commitments.
        ONCHAIN_DERIVED,
        /// @dev The fact is tied to an exact verification claim, such as exact source/build/
        /// deployment matching or another precise matching process adopted by the implementation.
        EXACT_VERIFIED,
        /// @dev The fact is claimed to be supported by formal proof or equivalent high-assurance
        /// reasoning. This does not imply full-system safety.
        FORMALLY_PROVEN
    }

    /// @notice Scope of a disclosed power, limitation, or review surface.
    /// @dev Scope describes the granularity at which a capability or claim applies.
    enum Scope {
        /// @dev Applies globally or system-wide.
        GLOBAL,
        /// @dev Applies to a specific contract or deployed component.
        CONTRACT,
        /// @dev Applies to a specific function selector or equivalent call surface.
        FUNCTION_SELECTOR,
        /// @dev Applies only within a parameter range or bounded input region.
        PARAMETER_RANGE,
        /// @dev Applies to a specific asset or asset class.
        ASSET,
        /// @dev Applies to a specific user set or address class.
        USER_SET,
        /// @dev Applies to a set of modules, plugins, or extensions.
        MODULE_SET,
        /// @dev Applies to a bridge route, lane, or cross-domain pathway.
        BRIDGE_ROUTE,
        /// @dev Applies to a custody pool, reserve pool, or segregated backing pool.
        CUSTODY_POOL,
        /// @dev Applies at another scope not covered by the enum above.
        OTHER
    }

    /// @notice Severity or practical effect level of a disclosed power or finding.
    /// @dev Impact is an interpretive severity label, not a mathematical proof of loss size.
    enum ImpactLevel {
        /// @dev No meaningful impact is declared.
        NONE,
        /// @dev Low impact.
        LOW,
        /// @dev Medium impact.
        MEDIUM,
        /// @dev High impact.
        HIGH,
        /// @dev Sensitive impact.
        CRITICAL,
        /// @dev Impact is unbounded, open-ended, or not meaningfully capped.
        UNBOUNDED
    }

    /// @notice Type of graph node represented in the declaredAuthority/control graph.
    /// @dev `nodeId` is canonical. Address bindings and other declared helper attributes are optional metadata only.
    /// A node type helps consumers interpret the declared role of a node.
    enum NodeType {
        /// @dev Generic contract node.
        CONTRACT,
        /// @dev Proxy contract.
        PROXY,
        /// @dev Implementation contract.
        IMPLEMENTATION,
        /// @dev Proxy-admin contract or equivalent upgrade controller.
        PROXY_ADMIN,
        /// @dev Timelock contract or equivalent delay controller.
        TIMELOCK,
        /// @dev Multisig contract or equivalent threshold execution node.
        MULTISIG,
        /// @dev Module, plugin, or extension node.
        MODULE,
        /// @dev Guard or policy-enforcement node.
        GUARD,
        /// @dev Fallback handler or equivalent low-level handler.
        FALLBACK_HANDLER,
        /// @dev Bridge adapter or cross-domain execution adapter.
        BRIDGE_ADAPTER,
        /// @dev Custodian, reserve holder, or similar externalized custody node.
        CUSTODIAN,
        /// @dev Oracle manager or oracle governance/configuration node.
        ORACLE_MANAGER,
        /// @dev Governance executor or proposal execution node.
        GOVERNANCE_EXECUTOR,
        /// @dev Access manager or generalized permission manager.
        ACCESS_MANAGER,
        /// @dev Role-admin or role-governing node.
        ROLE_ADMIN,
        /// @dev Beacon contract or equivalent implementation indirection node.
        BEACON,
        /// @dev Emergency controller or emergency-override node.
        EMERGENCY_CONTROLLER,
        /// @dev Treasury or treasury-management node.
        TREASURY,
        /// @dev Other or uncategorized node type.
        OTHER
    }

    /// @notice Type of edge in the declared control graph.
    /// @dev Edge kind describes the relationship declared between two nodes.
    /// It does not prove the absence of undeclared edges or offchain control paths.
    enum EdgeKind {
        /// @dev Generic control relationship.
        CONTROLS,
        /// @dev Capability to upgrade.
        CAN_UPGRADE,
        /// @dev Capability to pause.
        CAN_PAUSE,
        /// @dev Capability to mint.
        CAN_MINT,
        /// @dev Capability to burn.
        CAN_BURN,
        /// @dev Capability to blacklist.
        CAN_BLACKLIST,
        /// @dev Capability to sweep funds.
        CAN_SWEEP_FUNDS,
        /// @dev Capability to move reserves.
        CAN_MOVE_RESERVES,
        /// @dev Capability to change fees.
        CAN_CHANGE_FEES,
        /// @dev Capability to change oracle configuration.
        CAN_CHANGE_ORACLE,
        /// @dev Capability to change risk parameters.
        CAN_CHANGE_RISK_PARAMS,
        /// @dev Capability to perform arbitrary calls.
        CAN_ARBITRARY_CALL,
        /// @dev Capability to grant roles.
        CAN_GRANT_ROLE,
        /// @dev Capability to revoke roles.
        CAN_REVOKE_ROLE,
        /// @dev Capability to install modules.
        CAN_INSTALL_MODULE,
        /// @dev Capability to introduce or use delegatecall-like extension behavior.
        CAN_DELEGATECALL,
        /// @dev Capability to bypass delay or timelock protections.
        CAN_BYPASS_DELAY
    }

    /// @notice Standardized helper diagnostic kinds derived from the declared disclosure state.
    /// @dev These are declared-state-derived findings, not independently verified universal truths.
    enum DiagnosticKind {
        /// @dev The manifest-closure claim conflicts with the declared graph or known components.
        MANIFEST_CLOSURE_VIOLATION,
        /// @dev A privileged path exists but its controller or structure remains unknown.
        UNKNOWN_PRIVILEGED_PATH,
        /// @dev A single EOA retains especially sensitive control according to the current heuristics.
        SINGLE_EOA_SENSITIVE_CONTROL,
        /// @dev A funds-sensitive upgrade path has zero declared delay according to the current heuristics.
        ZERO_DELAY_FUNDS_SENSITIVE_UPGRADE,
        /// @dev A delegatecall extension exists or is suspected but is undisclosed.
        UNDISCLOSED_DELEGATECALL_EXTENSION,
        /// @dev A reserve custodian is relevant but omitted from disclosure.
        OMITTED_RESERVE_CUSTODIAN,
        /// @dev A bridge adapter is relevant but omitted from disclosure.
        OMITTED_BRIDGE_ADAPTER,
        /// @dev A module with meaningful execution rights is omitted from disclosure.
        HIDDEN_MODULE_WITH_EXECUTION_RIGHTS,
        /// @dev A fallback handler is relevant but omitted from disclosure.
        OMITTED_FALLBACK_HANDLER,
        /// @dev A guard is relevant but omitted from disclosure.
        OMITTED_GUARD,
        /// @dev An admin controller exists but is undisclosed.
        UNDISCLOSED_ADMIN_CONTROLLER,
        /// @dev A review-sensitive component lacks the expected exact verification claim under the current helper logic.
        MISSING_EXACT_VERIFICATION_SENSITIVE_COMPONENT
    }

    /// @notice Broad category of compliance finding.
    /// @dev This helps downstream tools group findings by meaning.
    enum FindingCategory {
        /// @dev Finding primarily concerns incomplete or misleading disclosure.
        DISCLOSURE,
        /// @dev Finding primarily concerns insufficient constraint or power limitation.
        CONSTRAINT,
        /// @dev Finding primarily concerns manifest-boundary or closure claims.
        MANIFEST_CLOSURE,
        /// @dev Finding primarily concerns verification or proof-strength expectations.
        VERIFICATION
    }

    /// @notice Declared audit scope.
    /// @dev Scope describes breadth of audit coverage, not the quality or correctness of the audit.
    enum AuditScope {
        /// @dev Audit scope is unknown or not clearly declared.
        UNKNOWN,
        /// @dev Audit scope is partial or limited.
        PARTIAL,
        /// @dev Audit scope is claimed to be full relative to the implementation's stated target.
        FULL
    }

    /// @notice Current applicability status of an audit relative to the live deployment.
    /// @dev Applicability is separate from audit existence.
    enum AuditContextStatus {
        /// @dev Applicability is unknown.
        UNKNOWN,
        /// @dev Audit is declared to match the live deployment.
        MATCHES_LIVE_DEPLOYMENT,
        /// @dev Audit partially matches, but not completely.
        PARTIAL_MATCH,
        /// @dev Audit target has drifted relative to the live deployment.
        DRIFTED,
        /// @dev Audit does not apply to the current live deployment.
        DOES_NOT_APPLY
    }

    /// @notice Current status of a declared audit finding.
    /// @dev This reflects the implementation's declared current state of that finding.
    enum AuditFindingStatus {
        /// @dev Status is unknown.
        UNKNOWN,
        /// @dev Finding is declared resolved.
        RESOLVED,
        /// @dev Finding is declared unresolved.
        UNRESOLVED,
        /// @dev Finding is disputed.
        DISPUTED,
        /// @dev Finding is acknowledged but not fully resolved.
        ACKNOWLEDGED,
        /// @dev Finding is stale or no longer reliably applicable as stated.
        STALE
    }

    /// @notice Derived issue kinds for the audit-evidence layer.
    /// @dev These are current-state helper findings over audit evidence, not stable historical logs.
    enum AuditIssueKind {
        /// @dev No audit evidence is present.
        NO_AUDIT_EVIDENCE,
        /// @dev Audit target or target boundary is unspecified.
        AUDIT_TARGET_UNSPECIFIED,
        /// @dev Audit scope is partial.
        AUDIT_PARTIAL_SCOPE,
        /// @dev Audit applicability is unknown.
        AUDIT_APPLICABILITY_UNKNOWN,
        /// @dev Audit does not apply to the live deployment.
        AUDIT_NOT_APPLICABLE,
        /// @dev Drift between audit target and live deployment is detected.
        AUDIT_DRIFT_DETECTED,
        /// @dev Audit evidence is stale.
        STALE_AUDIT_EVIDENCE,
        /// @dev At least one unresolved audit finding exists.
        UNRESOLVED_AUDIT_FINDING,
        /// @dev At least one disputed audit finding exists.
        DISPUTED_AUDIT_FINDING,
        /// @dev At least one acknowledged-but-not-resolved audit finding exists.
        ACKNOWLEDGED_AUDIT_FINDING,
        /// @dev Audit does not clearly cover privilege-graph review.
        AUDIT_MISSING_PRIVILEGE_GRAPH_REVIEW,
        /// @dev Audit does not clearly cover proxy/upgrade review.
        AUDIT_MISSING_PROXY_REVIEW,
        /// @dev Audit does not clearly cover admin-role review.
        AUDIT_MISSING_ADMIN_ROLE_REVIEW,
        /// @dev Audit does not clearly cover modules/extensions review.
        AUDIT_MISSING_MODULE_REVIEW,
        /// @dev Audit does not clearly cover control-path review.
        AUDIT_MISSING_CONTROL_PATH_REVIEW
    }

    /// @notice Current metadata declaration for the implementation.
    /// @dev This is a current-state declaration, not a certification of truth.
    struct ProtocolMetadata {
        /// @dev Human-readable protocol or module name.
        string protocolName;
        /// @dev Claimed version of the disclosure standard implemented by this module.
        uint64 standardVersion;
        /// @dev Chain identifier for which this disclosure is intended.
        uint256 chainId;
        /// @dev Opaque commitment to the disclosed manifest.
        bytes32 manifestHash;
        /// @dev Optional URI for a manifest artifact.
        string manifestURI;
        /// @dev Optional URI for additional metadata.
        string metadataURI;    }

    /// @notice Current disclosure-scope declaration.
    /// @dev Scope defines what is claimed to be covered, excluded, or assumed.
    /// Hash fields are commitments only; their exact serialization is not fully standardized here.
    struct DisclosureScope {
        /// @dev Commitment to the overall disclosure-scope artifact or tuple.
        bytes32 scopeHash;
        /// @dev Commitment to the covered-components set or declaration.
        bytes32 coveredComponentsHash;
        /// @dev Commitment to the covered-assets set or declaration.
        bytes32 coveredAssetsHash;
        /// @dev Commitment to declared exclusions/dependencies outside scope.
        bytes32 excludedDependenciesHash;
        /// @dev Commitment to assumptions relied on by the disclosure.
        bytes32 assumptionsHash;
        /// @dev Optional URI describing the scope artifact.
        string scopeURI;
        /// @dev Optional URI describing what is covered.
        string coverageURI;
        /// @dev Optional URI describing exclusions.
        string exclusionsURI;
        /// @dev Optional URI describing assumptions.
        string assumptionsURI;
        /// @dev Whether the implementation claims all privilege-relevant components are included.
        bool publisherAssertedCoveredComponentsCompleteness;
        /// @dev Whether the implementation claims all user-facing assets are included.
        bool publisherAssertedCoveredAssetsCompleteness;
    }

    /// @notice Declared component record.
    /// @dev Component identity is keyed by `component`. Canonical declaredAuthority identity remains
    /// `nodeId`-based.
    struct Component {
        /// @dev Component contract or deployed address.
        address component;
        /// @dev Canonical node identifier associated with the component.
        bytes32 nodeId;
        /// @dev Declared node type for the component.
        NodeType nodeType;
        /// @dev Whether the component is included in the declared manifest.
        bool inManifest;
        /// @dev Whether the component is declared upgradeable.
        bool upgradeable;
        /// @dev Declared implementation address if applicable, else zero when not applicable
        /// or not declared.
        address implementation;
        /// @dev Canonical node identifier of the admin/controller for this component if declared.
        bytes32 adminNodeId;
        /// @dev Opaque commitment to additional component metadata.
        bytes32 metadataHash;
    }

    /// @notice Declared graph node.
    /// @dev `nodeId` is canonical. `nodeAddress` is optional metadata or a convenience binding.
    /// A zero address does not imply invalidity.
    struct GraphNode {
        /// @dev Canonical node identifier.
        bytes32 nodeId;
        /// @dev Declared node type.
        NodeType nodeType;
        /// @dev Optional bound address for address-native nodes.
        address nodeAddress;
        /// @dev Whether the node is included in the declared manifest.
        bool inManifest;        /// @dev Opaque commitment to additional node metadata.
        bytes32 metadataHash;
    }

    /// @notice Declared privileged-power descriptor.
    /// @dev This is a declared capability record, not proof that every relevant live-system power
    /// has been disclosed.
    struct PowerDescriptor {
        /// @dev Canonical power identifier.
        bytes32 powerId;
        /// @dev Category of power being described.
        PowerKind powerKind;
        /// @dev Whether the power is currently enabled according to the declaration.
        bool enabled;
        /// @dev Target contract or component address.
        address target;
        /// @dev Canonical node identifier associated with the target when applicable.
        bytes32 targetNodeId;
        /// @dev Declared controller form.
        ControllerType controllerType;
        /// @dev Canonical node identifier for the declared controller.
        bytes32 controllerNodeId;
        /// @dev Threshold required for execution where applicable. Zero means unset or not
        /// applicable unless a stricter implementation rule says otherwise.
        uint16 threshold;
        /// @dev Controller count or signer/controller cardinality where applicable. Zero means
        /// unset or not applicable unless a stricter implementation rule says otherwise.
        uint16 controllerCount;
        /// @dev Declared execution delay in seconds. Zero means no declared delay.
        uint32 executionDelaySeconds;
        /// @dev Whether an emergency bypass to normal delay/approval flow exists.
        bool emergencyBypass;
        /// @dev Scope granularity of the power.
        Scope scope;        /// @dev Maximum impact value where applicable; zero may mean none, unset, or not applicable.
        uint256 maxImpactValue;        /// @dev Declared rate limit where applicable; zero may mean none, unset, or not applicable.
        uint128 rateLimit;
        /// @dev Declared rate-limit window in seconds where applicable.
        uint32 rateLimitWindowSeconds;
        /// @dev Whether the power is revocable.
        bool revocable;        /// @dev Opaque commitment to scope-specific supporting data.
        bytes32 scopeHash;
        /// @dev Opaque commitment to notes or supporting metadata.
        bytes32 notesHash;
    }

    /// @notice Declared graph edge.
    /// @dev Edge records describe declared relationships in the disclosed graph only.
    struct GraphEdge {
        /// @dev Canonical edge identifier.
        bytes32 edgeId;
        /// @dev Type of relationship between nodes.
        EdgeKind edgeKind;
        /// @dev Related power kind where applicable.
        PowerKind powerKind;
        /// @dev Canonical source node identifier.
        bytes32 fromNodeId;
        /// @dev Canonical destination node identifier.
        bytes32 toNodeId;
        /// @dev Whether the relationship is direct.
        bool direct;/// @dev Opaque commitment to notes or supporting metadata.
        bytes32 notesHash;
    }

    /// @notice Derived disclosure summary over the current declared state.
    /// @dev This is a helper view and is not canonical truth.
    struct DisclosureSummary {
        /// @dev Whether the interface is reported as supported.
        bool interfaceSupported;
        /// @dev Whether a closed-manifest claim is made.
        bool manifestClaimedClosed;
        /// @dev Whether the current declared state satisfies the implementation's manifest-closure logic.
        bool manifestClosed;
        /// @dev Whether all declared nodes are included in the manifest.
        bool allNodesInManifest;
        /// @dev Whether all declared powers have known controllers according to the implementation.
        bool allPowersHaveKnownControllers;
        /// @dev Whether all relevant edges are known according to the implementation's logic.
        bool allEdgesKnown;
        /// @dev Whether review-sensitive components satisfy the expected exact-verification condition
        /// under the current helper logic.
        bool declaredExactVerifiedSensitiveComponents;
        /// @dev Current declared component count.
        uint256 componentCount;
        /// @dev Current declared node count.
        uint256 nodeCount;
        /// @dev Current declared edge count.
        uint256 edgeCount;
        /// @dev Current declared power count.
        uint256 powerCount;
        /// @dev Count of currently derived unknown-privilege findings or equivalents.
        uint256 unknownPrivilegeCount;
    }

    /// @notice Derived constraint summary over the current declared state.
    /// @dev This is a helper view and must not override raw disclosures.
    struct ConstraintSummary {
        /// @dev Whether no single-key especially sensitive control is currently derived.
        bool noSingleKeySensitiveControl;
        /// @dev Whether no zero-delay funds-sensitive upgrade is currently derived.
        bool noZeroDelayFundsSensitiveUpgrade;
        /// @dev Whether no undisclosed delegatecall extension is currently derived.
        bool noUndisclosedDelegatecall;
        /// @dev Whether no undisclosed custodian is currently derived.
        bool noUndisclosedCustodian;
        /// @dev Whether no undisclosed bridge adapter is currently derived.
        bool noUndisclosedBridgeAdapter;
        /// @dev Whether powers flagged as especially sensitive by the current helper logic are delayed.
        bool sensitivePowersDelayed;
        /// @dev Whether user funds are currently considered isolated by the implementation's logic.
        bool userFundsIsolated;
        /// @dev Current count of powers flagged as especially sensitive by the current helper logic.
        uint256 sensitivePowerCount;
        /// @dev Current count of delayed powers flagged as especially sensitive by the current helper logic.
        uint256 delayedSensitivePowerCount;
    }

    /// @notice Derived summary of review requirements over the current declared state.
    /// @dev This is a helper view for downstream tooling and review routing.
    struct ReviewCueSummary {
        /// @dev Whether privilege-graph review is recommended or required.
        bool privilegeGraphReviewRequired;
        /// @dev Whether proxy/upgrade review is recommended or required.
        bool proxyUpgradeReviewRequired;
        /// @dev Whether admin-role review is recommended or required.
        bool adminRoleReviewRequired;
        /// @dev Whether module review is recommended or required.
        bool moduleReviewRequired;
        /// @dev Whether control-path review is recommended or required.
        bool controlPathReviewRequired;
    }

    /// @notice Derived compliance finding over the current declared state.
    /// @dev This is not an independently verified finding unless separately reconstructed
    /// and confirmed by an external verifier.
    struct DiagnosticFinding {
        /// @dev Standardized failure kind.
        DiagnosticKind kind;
        /// @dev Broad category of the finding.
        FindingCategory category;
        /// @dev Whether the finding is currently active in the implementation's derived state.
        bool active;
        /// @dev Primary subject identifier.
        bytes32 subjectId;
        /// @dev Secondary related identifier.
        bytes32 relatedId;
        /// @dev Reference identifier used by the implementation to anchor or group the finding.
        bytes32 referenceId;        /// @dev Opaque commitment to finding details or supporting notes.
        bytes32 detailsHash;
    }

    /// @notice Count distribution of proof levels across a selected current-state surface.
    /// @dev This is a helper aggregation, not an assurance score.
    struct EvidenceStrengthDistribution {
        /// @dev Count of SELF_DECLARED items.
        uint256 selfDeclared;
        /// @dev Count of ONCHAIN_DERIVED items.
        uint256 onchainDerived;        /// @dev Count of FORMALLY_PROVEN items.
        uint256 formallyProven;
    }

    /// @notice Declared audit record.
    /// @dev Audit presence does not imply present-day applicability or full coverage.
    struct AuditRecord {
        /// @dev Canonical audit identifier.
        bytes32 auditId;
        /// @dev Human-readable auditor name.
        string auditorName;
        /// @dev Optional report URI.
        string reportURI;
        /// @dev Commitment to the report artifact.
        bytes32 reportHash;
        /// @dev Commitment to audit metadata or report-side metadata.
        bytes32 reportMetadataHash;
        /// @dev Commitment to the manifest the audit claims to cover.
        bytes32 coveredManifestHash;
        /// @dev Commitment to the build the audit claims to cover.
        bytes32 coveredBuildHash;
        /// @dev Commitment to the commit or source revision the audit claims to cover.
        bytes32 coveredCommitHash;
        /// @dev Commitment to the deployment the audit claims to cover.
        bytes32 coveredDeploymentHash;
        /// @dev Declared issuance time.
        uint64 issuedAt;
        /// @dev Declared scope breadth.
        AuditScope scope;
        /// @dev Whether the report is public.
        bool publicReport;
        /// @dev Whether the audit is declared to cover privilege-graph review.
        bool coversPrivilegeGraph;
        /// @dev Whether the audit is declared to cover proxy/upgrade paths.
        bool coversProxyUpgradePaths;
        /// @dev Whether the audit is declared to cover admin roles.
        bool coversAdminRoles;
        /// @dev Whether the audit is declared to cover modules/extensions.
        bool coversModules;
        /// @dev Whether the audit is declared to cover control-path analysis.
        bool coversControlPaths;
        /// @dev Whether the audit is declared to cover oracle configuration.
        bool coversOracleConfig;
        /// @dev Whether the audit is declared to cover runtime configuration.
        bool coversRuntimeConfig;        /// @dev Opaque commitment to notes or additional supporting metadata.
        bytes32 notesHash;
    }

    /// @notice Declared applicability record for an audit relative to the live deployment.
    /// @dev Applicability is distinct from audit existence.
    struct AuditContext {
        /// @dev Audit identifier to which this applicability record relates.
        bytes32 auditId;
        /// @dev Applicability status classification.
        AuditContextStatus status;
        /// @dev Whether the live system is declared to match the audited manifest.
        bool liveMatchesManifest;
        /// @dev Whether the live system is declared to match the audited build.
        bool liveMatchesBuild;
        /// @dev Whether the live system is declared to match the audited deployment.
        bool liveMatchesDeployment;
        /// @dev Whether the live system is declared to match the audited runtime configuration.
        bool liveMatchesRuntimeConfig;
        /// @dev Whether the live system is declared to match the audited role configuration.
        bool liveMatchesRoleConfig;
        /// @dev Whether the live system is declared to match the audited module set.
        bool liveMatchesModules;
        /// @dev Whether the live system is declared to match the audited proxy topology.
        bool liveMatchesProxyTopology;
        /// @dev Whether the live system is declared to match the audited oracle configuration.
        bool liveMatchesOracleConfig;
        /// @dev Whether the live system is declared to match the audited controller structure.
        bool liveMatchesControllers;
        /// @dev Whether the audit is declared stale.
        bool stale;        /// @dev Opaque commitment to notes or supporting metadata.
        bytes32 notesHash;
    }

    /// @notice Declared audit-finding record.
    /// @dev These are supplementary evidence-layer records and do not override raw disclosures.
    struct AuditFindingRecord {
        /// @dev Canonical finding identifier.
        bytes32 findingId;
        /// @dev Audit identifier to which this finding belongs.
        bytes32 auditId;        /// @dev Declared finding status.
        AuditFindingStatus status;
        /// @dev Whether the finding is privilege-related.
        bool privilegeRelated;
        /// @dev Whether the finding affects user funds.
        bool affectsUserFunds;
        /// @dev Primary subject identifier.
        bytes32 subjectId;
        /// @dev Related power identifier where applicable.
        bytes32 powerId;        /// @dev Opaque commitment to the finding title or headline.
        bytes32 titleHash;
        /// @dev Opaque commitment to notes or finding metadata.
        bytes32 notesHash;
    }

    /// @notice Derived audit-evidence issue over the current declared audit state.
    /// @dev This is a helper finding over audit evidence, not a stable append-only record.
    struct AuditIssue {
        /// @dev Standardized audit-issue kind.
        AuditIssueKind kind;
        /// @dev Whether the issue is currently active.
        bool active;
        /// @dev Related audit identifier where applicable.
        bytes32 auditId;
        /// @dev Related audit-finding identifier where applicable.
        bytes32 relatedFindingId;
        /// @dev Related subject identifier where applicable.
        bytes32 subjectId;        /// @dev Opaque commitment to issue details or notes.
        bytes32 detailsHash;
    }

    /// @notice Derived summary over the current audit-evidence state.
    /// @dev This is a helper view only and must not be interpreted as a certification.
    struct AuditEvidenceSummary {
        /// @dev Whether any audit evidence is present.
        bool auditEvidencePresent;
        /// @dev Whether at least one audit currently applies according to declared applicability logic.
        bool currentAuditApplies;
        /// @dev Whether at least one current audit is considered an exact live match.
        bool currentAuditExactMatch;
        /// @dev Whether at least one full-scope audit is present.
        bool fullScopeAuditPresent;
        /// @dev Whether privilege-graph coverage is present in at least one audit.
        bool privilegeGraphCoveragePresent;
        /// @dev Whether proxy/upgrade coverage is present in at least one audit.
        bool proxyUpgradeCoveragePresent;
        /// @dev Whether admin-role coverage is present in at least one audit.
        bool adminRoleCoveragePresent;
        /// @dev Whether module coverage is present in at least one audit.
        bool moduleCoveragePresent;
        /// @dev Whether control-path coverage is present in at least one audit.
        bool controlPathCoveragePresent;
        /// @dev Whether any stale or drifted audit is present.
        bool staleOrDriftedAuditPresent;
        /// @dev Whether unresolved findings are present.
        bool unresolvedFindingsPresent;
        /// @dev Whether disputed findings are present.
        bool disputedFindingsPresent;
        /// @dev Whether acknowledged findings are present.
        bool acknowledgedFindingsPresent;
        /// @dev Whether the implementation considers user interpretation risk present.
        bool userInterpretationRisk;
        /// @dev Total audit count.
        uint256 auditCount;
        /// @dev Count of currently applicable audits.
        uint256 contextMatchedAuditCount;
        /// @dev Count of partial-scope audits.
        uint256 partialScopeAuditCount;
        /// @dev Count of audits with unknown applicability.
        uint256 unknownApplicabilityCount;
        /// @dev Count of drifted audits.
        uint256 driftedAuditCount;
        /// @dev Count of unresolved findings.
        uint256 unresolvedFindingCount;
        /// @dev Count of disputed findings.
        uint256 disputedFindingCount;
        /// @dev Count of acknowledged findings.
        uint256 acknowledgedFindingCount;
        /// @dev Count of stale audits.
        uint256 possiblyStaleAuditCount;
    }
}
