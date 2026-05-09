# Limitations

This standard is intentionally narrow.

Its value comes from making protocol control structure more visible and machine-retrievable, not from pretending that disclosure alone eliminates trust.

The ERC core standardizes raw protocol control disclosure, while summaries, claims, profiles, diagnostics, and audit evidence are optional extension surfaces or verifier-side interpretations.

## 1. What the core can standardize

The core can standardize current declared raw facts such as:
- protocol metadata
- disclosure scope
- components
- authority or system nodes
- privileged powers
- control edges
- canonical identifiers
- existence and lookup behavior
- ordering behavior
- zero/default-value behavior
- freshness boundaries

That is the strong part of the standard.

## 2. What optional layers can add

Optional extension surfaces can add:
- summaries
- claims
- profiles
- audit evidence
- convenience helpers
- compatibility views

Those extensions may be useful, but they are not the core truth surface.

## 3. What the standard cannot prove by itself

Neither the core nor optional self-exposed extensions can prove:
- that disclosure is complete
- that the publisher did not omit something important
- that every relevant dependency is in scope
- that offchain, social, legal, or operational controllers do not exist
- that a declared configuration exactly matches live reality without independent checking
- that a linked audit still applies to the live deployment
- that a disclosed protocol is safe
- that a clean helper surface equals independent verification

## 4. Why this matters

A dishonest or incomplete publisher can still expose:
- a neat graph
- a neat manifest
- a neat summary
- a neat profile
- a neat audit section

That is why the standard is strongest when paired with:
- independent source and deployment verification
- live proxy/admin-path discovery
- independent graph reconstruction
- third-party verifier reports
- tooling that distinguishes declared facts from independently verified facts

## 5. Core limitation

The core exposes declared structure.

It does not guarantee:
- completeness
- honesty
- safety
- live-system equivalence
- absence of omitted dependencies
- absence of hidden control arrangements

That limitation is fundamental and should be stated plainly.

## 6. Summary and profile limitation

Summary and profile outputs are helper views.

They are not:
- canonical raw truth
- a trust badge
- proof of safety
- stronger than the underlying disclosures

Different tools can legitimately interpret the same raw graph differently.
That is one reason summary and profile logic should remain secondary.

## 7. Audit-evidence limitation

Audit evidence is supplementary, not foundational.

A protocol can have:
- a real audit with narrow scope
- a real audit that no longer matches the live deployment
- a real audit with unresolved issues
- a real audit that omitted relevant control paths
- a real audit that is accurate historically but no longer current

That is why audit evidence must remain separate from the canonical raw core.

## 8. Identity-model limitation

The canonical identity model is `nodeId`-based, not purely address-based.

That is necessary because real authority structures are not always reducible to a single address.
An address may be:
- absent even when real authority exists
- present but incomplete as a control description
- only one projection of a broader authority structure

## 9. Hash and versioning limitation

Hash fields are useful commitments, but until canonical serialization rules are fully fixed, hash equality should not be over-interpreted across implementations.

Likewise, `standardVersion` should not be treated as universal semantic compatibility without a published versioning policy and clear extension boundaries.

## 10. Bottom line

The standard helps consumers ask better questions.
It does not eliminate the need for those questions.
