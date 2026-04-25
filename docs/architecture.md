# Architecture

This repository implements a protocol control disclosure architecture built around a narrow canonical core and optional secondary surfaces.

The ERC core standardizes raw protocol control disclosure, while summaries, claims, profiles, diagnostics, and audit evidence are optional extension surfaces or verifier-side interpretations.

## 1. Architectural shape

The architecture is intentionally layered:

### A. Canonical raw core
The authoritative layer for:
- protocol metadata
- disclosure scope
- components
- nodes
- powers
- edges
- canonical identifiers
- freshness boundaries

### B. Optional onchain extensions
Secondary layers for:
- summaries
- claims
- profiles
- audit evidence
- convenience helpers
- aggregate compatibility surfaces

### C. Offchain and verifier-side interpretation
External layers for:
- diagnostics
- risk policy
- independent graph reconstruction
- audit applicability analysis
- user-facing warnings and labels

This separation is deliberate.
It keeps the interoperable standard surface narrow while still leaving room for richer tooling.

## 2. Core model

The raw core is graph-native.

That matters because real protocol control often propagates through:
- upgrade admins
- timelocks
- multisigs
- executor contracts
- modules
- guards
- bridge adapters
- fallback handlers
- operational authorities

A graph-native disclosure layer can represent those relationships more faithfully than a flat checklist.

## 3. Core records

The stable architectural center is the raw structural record set:

### Protocol metadata
Identifies the disclosure surface and its manifest anchor.

### Disclosure scope
States what the implementation claims to cover, exclude, and assume.

### Components
Declared deployed contracts or equivalent system elements.

### Graph nodes
Declared authority-bearing or system-relevant nodes identified canonically by `nodeId`.

### Power descriptors
Declared privileged capabilities attached to controllers and targets.

### Graph edges
Declared control relationships between nodes.

These records are the authoritative substrate.
Everything else should build on top of them.

## 4. Freshness and cache correctness

Because the architecture is current-state oriented, freshness matters.

The core should expose:
- a disclosure nonce or equivalent freshness boundary
- and update events for core-state changes

This lets tools know when cached interpretations may need recomputation.

## 5. Optional extensions

The architecture can still support richer secondary surfaces.

Useful optional extensions include:
- summary views for UI convenience
- claims surfaces for self-asserted attestations
- profile surfaces for grouped or derived descriptors
- audit evidence surfaces for third-party review metadata
- compatibility helpers for broader tooling access

These are allowed precisely because they are secondary.
They should not redefine the authoritative core.

## 6. What moved out of the core story

The architecture should no longer center mandatory:
- findings
- proof-strength ladders
- criticality classifications
- custody-risk classifications
- impact scoring
- review-requirement semantics
- audit applicability verdicts

Those outputs may still exist in extensions or external tools, but they are not the core standard story.

## 7. Offchain artifacts

Offchain artifacts still matter.

Manifests, metadata documents, and evidence attachments can carry richer context than an onchain interface alone.
The right architectural pattern is:
- anchor them from the raw core where useful
- keep them secondary to the core
- let verifiers decide how much trust to assign them

## 8. Intended verifier workflow

A serious verifier should typically:

1. fetch the raw core records
2. reconstruct or validate the live control graph independently where possible
3. compare live observations against declared scope and manifest commitments
4. compute diagnostics or policy outputs separately
5. ingest audit evidence as supplementary context, not canonical truth

That workflow preserves the boundary between disclosure and interpretation.

## 9. Why this architecture is more consensus-friendly

This narrower architecture has a better chance of ecosystem adoption because it asks integrators to agree on:
- what raw facts can be fetched
- how those facts are identified
- how missing data behaves
- how freshness is communicated

It does not force every wallet, explorer, or security team to accept one shared risk taxonomy.
