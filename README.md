# ERC-8241: Protocol Control Disclosure Standard

## Overview

ERC-8241 defines a canonical, minimal standard for disclosing protocol control operations.

It enables deterministic verification of whether a protocol behaves as declared.

---

## Core Principle

ERC-8241 answers:

> "What operations can this protocol perform?"

It does NOT:
- enforce safety
- guarantee correctness
- interpret intent

---

## Architecture

- Core Standard → defines disclosure structure
- Discovery Extension → defines where disclosure is located

---

## Discovery Extension (Optional)

Contracts MAY implement:

- IERC8241Disclosure
- disclosureURI()

This allows external systems to locate disclosure data.

---

## Minimal Integration

1. Publish disclosure data
2. Optionally expose URI via IERC8241Disclosure
3. Use external verifier to compare behavior vs disclosure

---

## Example

See:

protocol-control-disclosure/examples/ExampleDisclosureProtocol.sol

---

## Status

- Core: Stable
- Discovery Extension: Optional
- Verifier: External

---

## Design Constraints

- Minimal
- Deterministic
- Local-first
- Composable

---

## Summary

ERC-8241 does not create trust.

It enables verification.
