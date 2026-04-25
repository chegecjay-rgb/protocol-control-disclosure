# ERC Semantics Draft

## Status

This document defines the intended semantics for the protocol disclosure architecture implemented by this repository.

The repository is a reference implementation.
It is not, by itself, the standard.

The ERC core standardizes raw protocol control disclosure, while summaries, claims, profiles, diagnostics, and audit evidence are optional extension surfaces or verifier-side interpretations.

The canonical standard surface is the raw core interface.
Aggregate or convenience interfaces do not change that boundary.

## 1. Core-first trust ordering

The trust ordering is:

1. raw core disclosure
2. optional extension surfaces
3. offchain manifests and evidence attachments
4. verifier-side interpretation

This ordering matters because the standard is trying to make raw structure interoperable, not to standardize one universal risk policy.

If an optional extension conflicts with raw core disclosures, the raw core is authoritative.

## 2. Declared facts only

Core outputs are declared facts about the implementation's current disclosure state.

They do not, by themselves, prove:
- safety
- completeness
- honesty
- live-system equivalence
- exact deployment equivalence
- absence of omitted dependencies
- absence of offchain control paths

A malicious implementation can be syntactically compliant and still be incomplete or misleading.

Graph helpers expose the declared model unless an external verifier reconstructs the live system independently.

## 3. Canonical identity

`nodeId` is the canonical identity for authorities and system nodes.

An address binding is optional metadata or a compatibility helper.
It is useful, but it is not sufficient to represent every relevant authority structure.

This is why the semantics do not collapse identity to a single address model.

## 4. Freshness semantics

The core disclosure surface is current-state oriented.

A compliant implementation should expose:
- a monotonic freshness or disclosure nonce
- and update events for core-state changes

The purpose of freshness is operational, not evaluative.
It lets consumers know when cached interpretations may be stale.

Freshness is core because it affects interoperability and cache correctness.

## 5. Lookup semantics

Lookup behavior must be explicit and consistent.

For declared core records:
- undeclared-record lookups should revert unless a specific existence helper says otherwise
- missing records must not be inferred from zero-value structs

Existence helpers and binding helpers may define narrower zero/default return behavior, but that behavior must be explicit.

## 6. Ordering semantics

Where index-based enumeration exists, ordering must be deterministic.

For stable declared records, insertion-order semantics are preferred unless otherwise specified by the implementation.

Consumers should not use numeric indices as long-term identities.
Canonical IDs are stronger than enumeration positions.

## 7. Zero/default semantics

Zero values and empty values do not mean "safe".

Unless a stricter field rule is defined, zero or empty forms mean:
- unset
- undeclared
- unbound
- not applicable
- or no stronger claim made

Examples:
- `bytes32(0)` from an address-binding helper means no declared binding exists
- `address(0)` may mean unbound or not applicable
- empty URIs mean no URI was supplied
- zero delays, counts, or thresholds must be read literally, not optimistically

## 8. What belongs in the core

The core should stay limited to low-interpretation, machine-retrievable structure:
- protocol metadata
- scope commitments
- components
- nodes
- powers
- edges
- canonical identifiers
- existence helpers
- ordering semantics
- default semantics
- freshness boundaries
- ERC-165 discovery

These are structural interoperability primitives.

## 9. What does not belong in mandatory core

The following categories are interpretation-heavy and should not be mandatory core semantics:
- criticality judgments
- custody-critical judgments
- effect-severity or impact scoring
- user-funds sensitivity judgments
- proof-strength ladders as mandatory truth semantics
- review-requirement outputs
- compliance findings
- audit applicability verdicts
- audit issue verdicts
- trust labels
- safety ratings

Those outputs may still exist, but only as optional extension surfaces or verifier-side computations.

## 10. Extension semantics

Optional extensions may expose:
- summaries
- claims
- profiles
- audit/evidence records
- convenience predicates
- implementation-specific helper views

These surfaces are secondary.

They may help UX, dashboards, or policy engines, but they are not canonical truth and they are not required for base compliance.

Evidence-strength distributions and profile semantics are especially extension-only.
They should not be used to define the authoritative v1 story of the ERC core.

## 11. Diagnostics semantics

Diagnostics are useful, but diagnostics are interpretations.

A finding, flag, or profile is downstream of:
- the implementation's modeling choices
- the implementation's disclosed scope
- the implementation's chosen taxonomy
- and the verifier's policy assumptions

For that reason, diagnostics should not be mandatory for core compliance.

A verifier may compute them independently.
An implementation may expose them optionally.
Neither case should redefine the canonical core.

## 12. Audit evidence semantics

Audit evidence is supplementary.

Audit presence does not imply:
- safety
- current applicability
- full coverage
- graph completeness
- absence of unresolved issues

Audit applicability, drift analysis, and evidence-strength interpretation are secondary layers, not core semantics.

## 13. Hash commitments

Every `*Hash` field used by the core should eventually have a canonical serialization rule.

Before publication, the draft should pin:
- what each core hash commits to
- the exact serialization format
- whether hashing is over canonical JSON, ABI encoding, UTF-8 text, or another exact encoding

Without that, cross-implementation interoperability remains weaker than it should be.

## 14. Non-goals

The ERC core does not:
- certify safety
- guarantee honesty
- force one universal risk taxonomy
- replace independent verification
- collapse offchain authority into addresses
- turn self-disclosure into a safety badge
