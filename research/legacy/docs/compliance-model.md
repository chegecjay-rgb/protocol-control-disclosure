# Compliance Model

This repository separates compliance into a narrow mandatory core and optional secondary surfaces.

The ERC core standardizes raw protocol control disclosure, while summaries, claims, profiles, diagnostics, and audit evidence are optional extension surfaces or verifier-side interpretations.

## 1. What core compliance means

Core compliance means that an implementation:
- implements ERC-165 discovery for the core interface
- implements the mandatory raw disclosure surface
- exposes current-state metadata and scope commitments
- exposes raw structural records for components, nodes, powers, and edges
- obeys the core lookup, ordering, default-value, and freshness semantics

Core compliance does not mean that a protocol is safe.
It means the protocol exposes the standardized raw disclosure surface.

## 2. What core compliance does not mean

A protocol does not become trustworthy, low-risk, or independently verified merely by implementing the interface.

Core compliance does not imply:
- complete disclosure
- honest disclosure
- good security design
- safe governance
- constrained authority
- sufficient decentralization
- audit applicability
- exact deployment matching

The standard is about machine-readable disclosure, not automatic approval.

## 3. Mandatory core layer

The mandatory core is the canonical disclosure layer.

It should be limited to raw, low-interpretation structure:
- protocol metadata
- disclosure scope
- components
- nodes
- powers
- edges
- canonical IDs
- existence helpers
- freshness boundaries

This is the source of truth for the standard surface.

## 4. Optional extension layers

Optional layers may exist on top of the core.

Typical extension categories include:
- summaries
- claims
- profiles
- audit evidence
- capabilities or convenience helpers
- implementation-specific auxiliary views

These layers are allowed because they are useful.
They are not required because they carry more interpretation and policy.

## 5. Verifier-side interpretation layer

A verifier, wallet, explorer, scanner, or auditor may compute additional outputs from the raw core facts.

Those outputs can include:
- diagnostics
- risk labels
- danger patterns
- audit applicability analysis
- profile scoring
- policy conclusions

Those are legitimate outputs.
They simply should not be confused with mandatory core compliance.

## 6. Honest claims about support

A protocol can honestly say:
- it implements the raw disclosure core
- it implements optional summaries
- it implements optional audit evidence
- it implements optional claims or profiles

A protocol should not imply:
- "safe because compliant"
- "verified because disclosed"
- "trustworthy because summarized"
- "audited therefore low-risk"

Compliance claims should stay factual and scoped.

## 7. Why findings are not mandatory core

Findings are not raw facts.
They are interpreted outputs derived from:
- the declared graph
- the declared scope
- selected taxonomies
- threshold choices
- modeling assumptions

Two reasonable verifiers can compute different findings from the same raw graph.
That is exactly why findings should be optional or verifier-side.

## 8. Why evidence-strength/profile semantics are not part of the v1 core story

Evidence-strength distributions, profile semantics, and similar evaluation-heavy outputs may still be useful, but they should not define the first consensus story of the ERC core.

They are secondary because they depend on:
- extra taxonomies
- evaluator assumptions
- stronger interpretation rules
- implementation-specific policy choices

The base standard is stronger when it standardizes the raw facts first.

## 9. Compliance ladder

A good way to think about conformance is:

### Level 1: Core disclosure compliance
Raw structural disclosure only.

### Level 2: Extension compliance
Optional summaries, claims, profiles, or audit evidence.

### Level 3: External verification
Independent reconstruction, validation, or policy analysis performed by third parties.

Only Level 1 should be required for the ERC core.

## 10. Anti-patterns

The following are compliance anti-patterns:
- treating self-disclosure as proof
- making policy taxonomies mandatory for all implementations
- collapsing summaries into canonical truth
- collapsing audit presence into safety
- requiring one universal risk model in the core
- turning the ERC into a safety-rating standard
