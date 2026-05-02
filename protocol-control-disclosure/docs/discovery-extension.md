# ERC-8241 Disclosure Discovery Extension

## Overview

The Disclosure Discovery Extension provides a minimal, optional interface
that allows protocols to expose the location of their ERC-8241 disclosure data.

It answers a single question:

> Where is the disclosure stored?

---

## What This Extension Does

- Defines a standard function: disclosureURI()
- Enables wallets, verifiers, and indexers to locate disclosure data
- Supports any URI format (IPFS, HTTPS, Arweave, local file reference)
- Provides ERC-165 compatibility for interface detection

---

## What This Extension Does NOT Do

This extension intentionally does NOT:

- Validate disclosure correctness
- Interpret disclosure semantics
- Provide safety guarantees
- Enforce compliance
- Score or rate protocols
- Interact with Proof of Operation systems

---

## Why This Is Separate From ERC-8241 Core

ERC-8241 core defines what must be disclosed.

This extension defines where disclosure can be found.

Separating these concerns ensures:

- Core remains stable and minimal
- Discovery can evolve independently
- Protocols can opt-in without affecting compliance

---

## Why Discovery Must Be Optional

Not all protocols will:

- Store disclosures on-chain
- Use standardized storage layers
- Want to expose a public URI

Making this optional ensures:

- No forced architecture constraints
- Compatibility with existing systems
- Flexibility in disclosure strategies

---

## Design Principles

- Minimal surface area
- Fully local-first compatible
- No external dependencies
- Composable with any protocol
- Future-indexer friendly (without implementing indexing)

---

## Example Usage

External tools can:

1. Check ERC-165 support for IERC8241Disclosure
2. If supported, call disclosureURI()
3. Fetch disclosure data from returned location
4. Feed into local verifier engine

---

## Summary

This extension is purely a pointer mechanism.

It does not create trust.

It does not enforce truth.

It only answers:

> "Where should I look?"
