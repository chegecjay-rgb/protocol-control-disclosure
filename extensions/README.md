# ERC-8241 Extensions

Extensions provide OPTIONAL functionality layered on top of the ERC-8241 disclosure standard.

Extensions do NOT affect ERC-8241 compliance.

## Extension Registry

| Extension | Status | Purpose |
| --- | --- | --- |
| Discovery | Optional | Protocol discoverability |
| Safety Interfaces | Experimental | Metadata overlays |
| Audit Evidence | Optional | Evidence attachment |
| Profiles | Optional | Additional metadata profiles |

## Directory Layout

- discovery/
- safety/
- profiles/
- audit-evidence/

## Important Boundary

ERC-8241 defines structural disclosure only.

Verification, interpretation, risk scoring, and execution analysis belong to ETL systems and external tooling.
