# ERC-8241 - Protocol Control Disclosure

## Overview

ERC-8241 defines a standardized structural disclosure interface for Ethereum protocols.

The standard provides machine-readable protocol disclosure without prescribing governance legitimacy, operational safety, or verification policy.

## Design Philosophy

ERC-8241 intentionally separates:
- declaration
- execution
- verification

## Layer Model

| Layer | Responsibility |
| --- | --- |
| ERC-8241 | Structural declaration |
| Proof of Operation (PoO) | Execution disclosure |
| Ethereum Transparency Layer (ETL) | Verification |

## Canonical Specification Surface

Normative repository components:

- ERC-8241.md
- COMPLIANCE.md
- core/
- extensions/
- docs/

## Repository Layout

- core/
- extensions/
- docs/
- examples/
- schema/
- research/
- src/
- test/

## Extensions

All extensions are organized under:

- extensions/

Extension categories:
- discovery
- safety
- profiles
- audit-evidence

Extensions remain OPTIONAL and do not affect compliance status.

## Research Preservation

Historical ProtocolSafety and experimental ETL research are preserved under:

- research/legacy/

These materials are archived for historical and architectural reference only.
