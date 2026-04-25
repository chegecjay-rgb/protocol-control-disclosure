# Protocol Safety Standard Prototype

This repository is a Foundry prototype for a machine-readable protocol safety standard focused on protocol power and constraints. It now exposes an ERC-shaped core disclosure graph in `IProtocolSafetyCore`, a derived-summary extension in `IProtocolSafetySummary`, and a separate audit-evidence extension in `IProtocolSafetyAuditEvidence`, with `IProtocolSafety` retained as an aggregate compatibility surface.

The model is intentionally conservative:
- ERC-165 support means interface support only.
- Declared metadata is not treated as proof by itself.
- Structural facts about control paths, delays, upgradeability, and privileged reach remain the primary input.
- Audit evidence is a secondary evidence layer that can support or weaken confidence, but it does not override structural red flags.

## Current Layer Coverage

| Layer | Status | Notes |
| --- | --- | --- |
| 1. Exact source verification | Partial | `Component.exactVerified`, proof levels, verification references, and missing-verification findings exist, but verification is still declared rather than independently derived onchain. |
| 2. Standardized interface detection | Present | `IProtocolSafetyCore`, `IProtocolSafetySummary`, `IProtocolSafetyAuditEvidence`, `IProtocolSafety`, and `IProtocolSafetyRegistry` are ERC-165 detectable and tested. |
| 3. Proxy / upgrade transparency | Present | Components expose upgradeability, implementation, and admin controller fields; powers and edges expose upgrade paths. |
| 4. Privilege disclosure | Present | Structured powers, graph nodes, graph edges, and manifest closure checks are implemented and tested. |
| 5. Enforced delays on dangerous actions | Partial | Delay fields and zero-delay findings exist, but the module reports constraints rather than enforcing them. |
| 6. No single-key critical control | Partial | Single-EOA critical powers are detected, but signer-set introspection is still declared rather than independently computed. |
| 7. Explicit risk flags | Present | Machine-readable `FailureKind` findings and summary structs are exposed onchain and in schema form. |
| 8. Independently computed safety / risk signals | Partial | The module computes summaries from declared facts and the schema supports verifier reports, but a standalone verifier is still a next step. |
| 9. Audit evidence and applicability | Present | Audit records, applicability, finding status, aggregate audit summaries, and audit issues are implemented without collapsing them into safety badges. |

## Core Outputs

### Core disclosure outputs
- `protocolMetadata()`
- `componentAt()` / `componentInfo()`
- `nodeAt()` / `nodeInfo()`
- `powerAt()` / `powerInfo()`
- `edgeAt()` / `edgeInfo()`
- `findingAt()` / `findingCount()`
- `hasTransitiveControlPath()` / `hasTransitivePowerPath()`
- `disclosureScope()`

### Summary-extension outputs
- `disclosureSummary()`
- `constraintSummary()`
- `reviewRequirementSummary()`
- `proofLevelDistribution()`
- `findingCountByKind()` / `hasFinding()`

### Audit-evidence outputs
- `auditAt()` / `auditInfo()`
- `auditApplicabilityInfo()`
- `auditFindingAt()` / `auditFindingInfo()`
- `auditEvidenceSummary()`
- `auditIssueAt()` / `auditIssueCountByKind()`

## Repository Layout

- `src/core`: reference module and registry contracts
- `src/interfaces`: ERC-165-detectable interfaces
- `src/libraries`: enums, structs, and power helpers
- `src/mocks`: unsafe and constrained protocol mocks
- `test/unit`: unit coverage for data registration and summaries
- `test/integration`: unsafe vs constrained protocol examples
- `schema`: JSON schema and example manifests
- `docs`: architecture, compliance model, closure rules, forbidden patterns, audit evidence, and limitations

## Build And Test

```bash
cd '/home/cjay/anti-rug pull protocol'
~/.foundry/bin/forge build --skip test
~/.foundry/bin/forge test
```

## What This Prototype Does Not Claim

It does not certify safety. It does not prove honesty. It does not replace exact verification, independent graph reconstruction, or live control-path analysis. The strongest honest reading is that it standardizes how a protocol can publish power, constraint, and audit-evidence surfaces so verifiers can compute more reliable risk signals.

## Additional Reading

- `docs/architecture.md`
- `docs/compliance-model.md`
- `docs/manifest-closure.md`
- `docs/forbidden-patterns.md`
- `docs/audit-evidence.md`
- `docs/limitations.md`

