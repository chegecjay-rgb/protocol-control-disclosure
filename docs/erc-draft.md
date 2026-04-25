---
eip: TBD
title: Protocol Control Disclosure Core
description: A machine-readable ERC for canonical raw protocol control disclosure covering metadata, scope commitments, components, nodes, powers, edges, and freshness boundaries.
author: TBD
discussions-to: TBD
status: Draft
type: Standards Track
category: ERC
created: 2026-03-23
requires: 165
---

# Abstract

This ERC defines a machine-readable interface for canonical raw protocol control disclosure.

The ERC core standardizes raw protocol control disclosure, while summaries, claims, profiles, diagnostics, and audit evidence are optional extension surfaces or verifier-side interpretations.

The mandatory core is limited to current-state structural disclosure:
- protocol metadata
- disclosure scope commitments
- declared components
- declared graph nodes
- declared powers
- declared control edges
- lookup semantics
- ordering semantics
- zero/default semantics
- freshness boundaries
- ERC-165 interface discovery

This ERC does not standardize a safety rating, trust score, or authoritative risk verdict.

# Motivation

Wallets, explorers, security tools, auditors, AI agents, and users need a common way to fetch raw protocol control facts without having to parse bespoke UIs, marketing language, or project-specific schemas.

Today, some protocols disclose pieces of this information informally, but there is no common ERC for:
- what contracts are claimed in scope
- what authorities are declared
- how privileged control is modeled
- how canonical identifiers and lookup semantics work
- how freshness is communicated
- how optional helper layers remain separate from the authoritative core

The goal of this ERC is narrow interoperability:
a standard raw disclosure surface that downstream tools can interpret, compare, and verify independently.

# Specification

## 1. Scope

This ERC standardizes raw current-state protocol control disclosure.

It does not require a protocol to publish:
- safety verdicts
- criticality judgments
- custody-risk labels
- impact severity labels
- proof-strength distributions
- compliance findings
- audit applicability judgments
- review-requirement summaries
- trust scores
- policy conclusions

Those may exist as optional extension surfaces or offchain verifier outputs, but they are not part of mandatory core compliance.

## 2. Compliance

A compliant implementation:
- **MUST** implement ERC-165
- **MUST** implement `IProtocolSafetyCore`
- **MUST** expose the required raw structural records and core behaviors defined by this ERC

An implementation **MAY** additionally expose optional extension surfaces, including but not limited to:
- `IProtocolSafetySummary`
- `IProtocolSafetyClaims`
- `IProtocolSafetyProfiles`
- `IProtocolSafetyAuditEvidence`
- aggregate convenience interfaces

Optional extensions are not required for base compliance.

## 3. Canonical identity model

The canonical identity model is `nodeId`-based.

Address bindings are optional metadata or compatibility helpers.
They are useful for address-native nodes, but they are not sufficient to represent every real authority structure, including:
- multisig groups
- signer sets
- committees
- legal custodians
- operational roles
- hybrid onchain/offchain controllers

A compliant implementation **MUST NOT** treat address identity as the only canonical authority identity where a `nodeId` is available.

## 4. Core records

The mandatory core consists of raw machine-retrievable records.

## 4.1 Protocol metadata

The core **MUST** expose current protocol metadata sufficient to identify the disclosure surface, including:
- protocol name
- claimed `standardVersion`
- chain ID
- manifest anchor or equivalent commitment
- optional manifest URI
- optional metadata URI
- whether manifest closure is claimed

Metadata is declarative.
It is not, by itself, proof of correctness or completeness.

## 4.2 Disclosure scope

The core **MUST** expose current factual scope commitments, including:
- what components are claimed covered
- what assets are claimed covered
- what dependencies are explicitly excluded
- what assumptions are explicitly declared
- whether the implementation claims closure over privilege-relevant components
- whether the implementation claims closure over user-facing assets

Scope is a factual boundary statement, not a safety verdict.

## 4.3 Components

A `Component` is a declared deployed contract or equivalent system element.

The core component record **MUST** identify raw structural facts such as:
- component address
- associated `nodeId` where declared
- declared node type
- manifest inclusion status
- upgradeability status where applicable
- implementation address where applicable
- admin/controller node ID where applicable
- metadata commitment hash where applicable

The core does not require criticality labels, custody-risk labels, or proof-strength judgments.

## 4.4 Graph nodes

A `GraphNode` is a declared authority-bearing or system-relevant node.

A core node record **MUST** identify:
- canonical `nodeId`
- declared node type
- optional address binding
- manifest inclusion status
- metadata commitment hash where applicable

The core does not require criticality labels or authority-quality judgments.

## 4.5 Power descriptors

A `PowerDescriptor` is a declared privileged capability.

A core power record **MUST** identify raw structural facts such as:
- canonical `powerId`
- declared `PowerKind`
- enabled status
- target address
- target node ID where applicable
- controller node ID
- raw execution parameters where explicitly modeled, such as threshold count, controller count, delay, or commitment hashes for scope/notes

The core does not require impact scoring, funds-sensitivity judgments, revocability policy, or canonical danger classifications.

## 4.6 Graph edges

A `GraphEdge` is a declared control or authority relationship.

A core edge record **MUST** identify:
- canonical `edgeId`
- declared `EdgeKind`
- related `PowerKind` where applicable
- source node ID
- destination node ID
- raw relationship flags explicitly modeled by the implementation, such as direct vs transitive classification
- notes commitment hash where applicable

The core does not require canonical risk labels or proof-strength labels on edges.

## 4.7 Freshness boundary

The core **MUST** expose a freshness boundary for current-state disclosure, such as:
- a monotonic disclosure nonce
- and update events for core-state changes

Consumers must be able to distinguish:
- the current disclosed state
- whether a previously cached interpretation may now be stale

Freshness belongs in core because it affects interoperability and cache correctness, not policy interpretation.

## 5. Core semantics

## 5.1 Declared facts only

Core outputs are declared facts about the implementation's current disclosure state.

They do not, by themselves, prove:
- safety
- completeness
- honesty
- exact live-system equivalence
- absence of undeclared dependencies
- absence of offchain control

Consumers **MUST NOT** treat disclosure presence alone as independent verification.

## 5.2 Lookup behavior

For declared-record lookup functions, undeclared records **MUST** revert unless a specific existence helper defines another behavior.

Missing-record behavior **MUST NOT** be inferred from zero-value structs.

## 5.3 Ordering behavior

Where index-based enumeration exists, ordering **MUST** be deterministic.
For stable declared records, insertion order is preferred unless otherwise specified.

Consumers **SHOULD** prefer canonical IDs over numeric indices.

## 5.4 Zero/default semantics

Unless a stricter field rule is defined:
- zero values mean unset, undeclared, unbound, or no stronger claim made
- zero values **MUST NOT** be interpreted as affirmative safety guarantees

## 5.5 Hash commitments

Fields ending in `Hash` are commitment fields.

Before final ERC publication, the standard **MUST** define the canonical serialization rule for each commitment class relied on by the core.

Until then, consumers must not assume that similarly named hash fields across independent implementations commit to identical encodings.

## 6. Extension model

This ERC is intentionally modular.

The core is authoritative for raw structural disclosure.

Optional extensions may provide:
- summaries
- claims
- profiles
- audit evidence
- compatibility helpers
- implementation-specific convenience views

If an optional extension conflicts with raw core disclosures, the raw core disclosures are authoritative.

Optional extensions are secondary by design.
They are not required for base interoperability.

## 7. Out of scope for the mandatory core

The following are intentionally out of scope for mandatory core compliance:
- safety verdicts
- trust scores
- criticality judgments
- custody-critical judgments
- impact levels
- maximum-impact values
- review-requirement summaries
- proof-strength distributions
- diagnostic findings
- audit applicability verdicts
- audit issue classifications
- canonical policy conclusions

These belong either in optional extension surfaces, offchain artifacts, or verifier-side interpretation layers.

# Rationale

The ERC is graph-native because protocol control is not flat.
Real authority often propagates through:
- proxies
- admins
- timelocks
- multisigs
- executors
- modules
- guards
- bridge adapters
- fallback paths
- offchain-linked authorities

A graph-native raw disclosure layer is therefore more useful than a checklist.

The ERC is narrow because standards consensus is more likely around raw retrievability than around normative risk taxonomies.
Different integrators can build different policy engines on top of the same core facts.

# Backwards Compatibility

This ERC is additive.

It does not change token behavior, governance semantics, proxy mechanics, or custody mechanics.
It defines a disclosure surface over existing deployments.

# Security Considerations

This ERC standardizes disclosure, not truth.

A malicious implementation can still:
- omit relevant dependencies
- misdeclare controllers
- under-report powers
- publish incomplete scope
- publish stale or misleading metadata

For that reason, optional summaries, claims, profiles, and audit evidence must remain secondary, and independent verification remains necessary.

# Reference Implementation

This repository provides a reference architecture for:
- split core and optional extension surfaces
- graph-native raw disclosure
- freshness boundaries
- optional secondary views

The repository is a reference implementation, not a substitute for independent verification.

# Copyright

Copyright and related rights waived via CC0.
