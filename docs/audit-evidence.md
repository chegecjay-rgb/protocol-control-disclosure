# Audit Evidence

Audit evidence is a secondary layer.

The ERC core standardizes raw protocol control disclosure, while summaries, claims, profiles, diagnostics, and audit evidence are optional extension surfaces or verifier-side interpretations.

Audit evidence can be useful, but it is not a new trust base and it must not override the canonical raw core.

## 1. What this layer is for

The audit-evidence layer is for exposing supplementary review context such as:
- whether a report exists
- who produced it
- where it is published
- report and metadata hashes
- what code, manifest, commit, build, or deployment target the report claims to cover
- whether the report claims full-scope or partial coverage
- whether specific review areas were claimed covered

These are useful disclosures.
They remain secondary.

## 2. What belongs here

Reasonable audit-evidence records include:
- audit record metadata
- publisher or firm identity strings
- report URI
- report hash
- metadata hash
- declared scope notes
- declared coverage commitments
- issue lists or report-linked references
- optional helper records about applicability or drift, if the implementation chooses to expose them

If applicability or drift helpers are exposed, they should still be treated as secondary helper views, not as canonical truth.

## 3. What this layer does not prove

Audit evidence does not, by itself, prove:
- safety
- current applicability
- live deployment equivalence
- privilege-graph completeness
- absence of hidden control paths
- absence of unresolved issues
- correctness of the underlying disclosure

An audit record can exist and still be:
- partial
- outdated
- drifted
- disputed
- misunderstood
- mismatched to the live deployment

## 4. Relationship to the core

The core remains authoritative for raw structural disclosure.

Audit evidence must not:
- erase a raw control path
- downgrade a live raw power
- replace scope commitments
- convert self-disclosure into certification
- become the canonical interpretation layer

If an audit-facing helper conflicts with the raw core, the raw core wins.

## 5. Applicability and drift

Applicability and drift are legitimate questions, but they are not a reason to widen the core.

A protocol may expose optional helper records about:
- target matching
- deployment drift
- configuration drift
- module drift
- role drift
- topology drift

Those outputs are still secondary because they depend on:
- comparison method
- declared scope
- artifact quality
- modeling assumptions
- evaluator judgment

They should be presented as helper context, not final truth.

## 6. Honest phrasing

Reasonable phrasing:
- Audit evidence present
- Third-party report linked
- Report claims coverage of declared target
- Audit evidence present, with separate applicability analysis
- Audit evidence present but limited, partial, or stale

Unreasonable phrasing:
- Safe because audited
- Certified safe
- Audit clears structural risk
- Audit replaces raw disclosure review

## 7. Wallet and explorer guidance

Wallets and explorers should display audit evidence beside the raw structural core, not in place of it.

A good UI pattern is:

- raw structural disclosure
- optional summaries or profiles
- audit evidence and linked reports
- verifier-side warnings or interpretations

That ordering preserves the distinction between:
- disclosed structure
- supplementary evidence
- downstream interpretation

## 8. Non-goal

The audit-evidence layer is not a certification layer.

Its job is to expose supplementary review context in machine-readable form without pretending that a report settles the meaning of the live system.
