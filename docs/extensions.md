# ERC-8241 Extensions

Extensions provide OPTIONAL functionality layered on top of ERC-8241 structural disclosure.

Extensions do NOT affect compliance status.

## Extension Registry

| Extension | Status | Purpose |
| --- | --- | --- |
| Discovery | Optional | Protocol discoverability |
| Safety Interfaces | Experimental | Metadata overlays |
| Audit Evidence | Optional | Evidence attachment |
| Profiles | Optional | Additional metadata profiles |

## Extension Boundary

Extensions may:
- expose metadata
- improve interoperability
- support indexing systems
- improve discoverability

Extensions may NOT redefine:
- ERC-8241 compliance
- core disclosure semantics
- ETL verification policy

## Canonical Extension Layout

- extensions/discovery/
- extensions/safety/
- extensions/profiles/
- extensions/audit-evidence/
