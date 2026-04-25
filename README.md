# Protocol Control Disclosure Core

**ERC proposal** for a canonical, machine-readable standard for raw protocol control disclosure.

> Real protocol control is not flat. This standard makes it legible.

## What this repository is

This repository contains:
- the canonical ERC draft
- supporting standards notes
- a Solidity reference implementation
- active Foundry test suites

The ERC core standardizes raw protocol control disclosure, while summaries, claims, profiles, diagnostics, and audit evidence are optional extension surfaces or verifier-side interpretations.

## Canonical draft

The canonical specification in this repository is:

- [`erc-draft_protocol_control_disclosure_core.md`](./erc-draft_protocol_control_disclosure_core.md)

## Public discussion

Ethereum Magicians thread:

- https://ethereum-magicians.org/t/protocol-control-disclosure-core/28343

## What the mandatory core contains

- protocol metadata
- disclosure scope commitments
- components
- graph nodes
- privileged powers
- control edges
- canonical identifiers
- lookup semantics
- ordering semantics
- zero/default semantics
- freshness boundaries
- ERC-165 discovery

## What is intentionally not in the mandatory core

- safety scores
- trust scores
- criticality labels
- canonical policy conclusions
- mandatory audit truth claims
- verifier-side risk judgments

Those belong in optional extensions or external interpretation layers.

## Repository layout

- `erc-draft_protocol_control_disclosure_core.md` — canonical ERC draft
- `docs/` — supporting architecture, semantics, compliance, and versioning notes
- `src/` — Solidity reference implementation
- `schema/` — schemas and related artifacts
- `test/` — active test suites

## Build and test

```bash
forge build
forge test -vvv
