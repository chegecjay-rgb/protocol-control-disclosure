# Versioning

This document defines how versioning should be interpreted for the protocol control disclosure standard implemented by this repository.

This repository is a reference implementation.
It is not, by itself, the final standard text.

The ERC core standardizes raw protocol control disclosure, while summaries, claims, profiles, diagnostics, and audit evidence are optional extension surfaces or verifier-side interpretations.

## 1. What `standardVersion` means

`standardVersion` refers to the claimed version of the core disclosure semantics implemented by the module.

It is a statement about the meaning of the canonical raw disclosure surface.

It is not, by itself:
- proof of correctness
- proof of honesty
- proof of full compatibility with every consumer
- proof that optional extensions are present
- proof of semantic equivalence across all deployments
- proof that the live deployment matches a verifier's expectations

## 2. What the version is primarily versioning

The main thing being versioned is the semantics of the canonical core surface.

That core surface is centered on:
- `IProtocolSafetyCore`
- its required raw records
- its lookup behavior
- its ordering rules
- its zero/default semantics
- its freshness behavior
- its canonical identity model

Optional extension presence should be discovered separately through interface detection.

## 3. Core principle

A version number should change when the meaning that downstream consumers rely on for the canonical core changes.

The main thing being versioned is not just ABI shape.
It is the semantic meaning of the core disclosure surface.

## 4. What counts as a breaking core change

A change is breaking when a consumer that correctly understood an earlier core version could draw the wrong conclusion from the same core fields under the new interpretation.

Examples of breaking change include:
- changing the meaning of `nodeId` versus address identity
- changing the meaning of a core enum variant
- changing whether undeclared lookups revert or return defaults
- changing zero/default-value semantics
- changing ordering guarantees
- changing freshness semantics
- changing required core record categories
- changing the canonical interpretation of a core hash commitment field

Those changes should require a version increment that clearly signals incompatibility.

## 5. What is not a breaking core change

A change is non-breaking for the core when older consumers can still interpret the existing canonical core correctly.

Examples include:
- editorial clarification
- documentation improvement
- tighter tests for already-existing meaning
- adding a new optional extension that does not change core meaning
- adding new helper views that are explicitly secondary
- implementation bug fixes that restore intended core semantics

## 6. Optional extensions and version interpretation

A matching core `standardVersion` does not mean every optional extension is present.

Consumers should separately check:
- ERC-165 support
- available extension interfaces
- actual fields exposed by those interfaces

Optional extensions may evolve without changing the meaning of the core.
That is exactly why the extension boundary matters.

## 7. Extension changes versus core changes

A change to summaries, claims, profiles, diagnostics, or audit evidence should not redefine the meaning of the core version unless it also changes canonical core semantics.

That means:
- helper-surface evolution does not automatically imply a core major bump
- extension presence should not be inferred from the core version
- extension semantics should not be allowed to silently widen the core version meaning

If extension-specific versioning is introduced later, it should remain clearly separate from the core version.

## 8. Interface presence versus semantic compatibility

Two implementations can expose similar ABIs and still differ semantically.

Therefore:
- ABI similarity is not enough
- interface support is not enough
- version equality is useful, but still not full proof of semantic equivalence

Consumers should combine:
- version inspection
- interface detection
- field-level interpretation
- implementation-specific validation where necessary

## 9. Declared version versus independently verified understanding

`standardVersion` is a declared metadata field.

By itself, it remains self-disclosed metadata.

An implementation can claim a version incorrectly or dishonestly.
Independent tooling should still prefer:
- interface detection
- semantic conformance checks
- verifier-side validation
- exact deployment/source matching
when high assurance matters.

## 10. Relationship to docs and tests

Docs and tests help stabilize semantic meaning, but they are not the version by themselves.

In practice, semantic understanding is shaped by:
- interfaces
- shared types
- normative docs
- conformance expectations
- tests that enforce those expectations

A version bump should be considered whenever that combined interpretation changes in a way that matters to downstream consumers of the core.

## 11. Recommended interpretation for this repository right now

At the current stage of this repository:

- the version should be interpreted as the version of the canonical raw disclosure semantics
- the core interface is canonical
- optional extensions are secondary
- `nodeId` is canonical identity
- zero/default values are not affirmative guarantees
- summaries do not override raw disclosures
- audit evidence is supplementary, not certifying
- helper-surface semantics do not define the core version boundary

That is the center of gravity a reviewer or integrator should use.

## 12. Future work before final proposal publication

Before final proposal publication, the standard should tighten:
- exact version format
- explicit bump rules
- core versus extension version separation
- canonical hash serialization rules
- treatment of enum additions
- deprecation and migration guidance

## 13. Non-goal

Versioning is not a substitute for verification.

A higher or matching version number does not mean:
- safer
- more honest
- more complete
- independently verified
- automatically suitable for every consumer
