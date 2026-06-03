# Authority Hierarchy Matrix v1

## Purpose

This document records the reconstructed authority hierarchy of the ERC-8241 repository.

The objective is to identify:

- normative authority sources
- derived documentation
- optional extension surfaces
- historical archives
- authority dependencies
- reviewer navigation hierarchy

This artifact is the formal output of TARGET-018.

---

# Level 1 — Normative Authority Surface

These artifacts define canonical ERC-8241 meaning and compliance.

| Artifact | Authority Type | Normative |
|-----------|-----------|-----------|
| ERC-8241.md | Specification | Yes |
| COMPLIANCE.md | Compliance Definition | Yes |

## Authority Notes

These documents define:

- canonical specification semantics
- compliance requirements
- normative interpretation boundaries

All repository interpretation ultimately resolves to these sources.

---

# Level 2 — Canonical Documentation Surface

These artifacts explain and organize the normative surface.

| Artifact | Authority Type | Normative |
|-----------|-----------|-----------|
| README.md | Repository Navigation | No |
| docs/README.md | Documentation Navigation | No |
| docs/architecture.md | Architecture Explanation | No |
| docs/extensions.md | Extension Explanation | No |
| docs/etl-integration.md | Ecosystem Mapping | No |
| docs/REPOSITORY_NAVIGATION.md | Repository Navigation | No |
| docs/migration-history.md | Historical Transition Explanation | No |

## Authority Notes

These documents explain the specification.

They do not define compliance.

If conflict exists between documentation and normative sources:

1. ERC-8241.md prevails.
2. COMPLIANCE.md prevails.
3. Documentation is subordinate.

---

# Level 3 — Publication and Freeze Surfaces

Publication artifacts package repository knowledge for external review.

| Artifact | Authority Type | Normative |
|-----------|-----------|-----------|
| docs/publication/ERC8241_FREEZE_DRAFT.md | Publication Draft | No |
| docs/publication/ECOSYSTEM_GLOSSARY.md | Terminology Reference | No |
| docs/publication/README_TEMPLATE.md | Publication Template | No |
| docs/publication/FULL_ETL_STACK.mmd | Ecosystem Visualization | No |
| docs/publication/AUTHORITY_HIERARCHY_MATRIX_V1.md | Authority Reconstruction Artifact | No |

## Authority Notes

Publication artifacts assist review and publication.

They do not modify specification semantics.

---

# Level 4 — Optional Extension Surface

Extensions are explicitly optional.

| Artifact Group | Authority Type | Normative |
|-----------|-----------|-----------|
| extensions/discovery/* | Optional Extension | No |
| extensions/audit-evidence/* | Optional Extension | No |
| extensions/profiles/* | Optional Extension | No |
| extensions/safety/* | Optional Extension | No |

## Authority Notes

Extensions may add functionality.

Extensions do not alter:

- compliance status
- canonical semantics
- normative obligations

---

# Level 5 — Research Draft Surface

Research drafts preserve specification evolution.

| Artifact Group | Authority Type | Normative |
|-----------|-----------|-----------|
| research/drafts/* | Draft Research | No |

## Authority Notes

Drafts are historical development artifacts.

Drafts are not authoritative.

---

# Level 6 — Historical Archive Surface

Legacy systems preserved for historical continuity.

| Artifact Group | Authority Type | Normative |
|-----------|-----------|-----------|
| research/legacy/* | Historical Archive | No |

## Authority Notes

Legacy ProtocolSafety materials are archived.

These materials:

- preserve research history
- preserve design evolution
- preserve abandoned approaches

They are not part of the ERC-8241 normative surface.

---

# Authority Dependency Hierarchy

Level 1
    ├── ERC-8241.md
    └── COMPLIANCE.md

Level 2
    ├── README.md
    ├── docs/README.md
    ├── docs/architecture.md
    ├── docs/extensions.md
    ├── docs/etl-integration.md
    ├── docs/REPOSITORY_NAVIGATION.md
    └── docs/migration-history.md

Level 3
    └── Publication Surfaces

Level 4
    └── Optional Extensions

Level 5
    └── Research Drafts

Level 6
    └── Historical Archives

---

# Authority Resolution Rule

When interpretive conflict exists:

1. ERC-8241.md
2. COMPLIANCE.md
3. Canonical Documentation
4. Publication Surfaces
5. Optional Extensions
6. Research Drafts
7. Historical Archives

Higher levels always supersede lower levels.

---

# TARGET-018 Certification Record

Target:
TARGET-018

Title:
Authority Hierarchy Matrix Construction

Status:
COMPLETE

Artifact:
docs/publication/AUTHORITY_HIERARCHY_MATRIX_V1.md

Outcome:
Repository authority structure reconstructed and formally recorded.
