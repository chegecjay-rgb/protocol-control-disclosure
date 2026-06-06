# Cross-Repository Navigation Architecture Matrix v1

## Purpose

This document reconstructs the reviewer navigation topology of the ERC-8241 repository.

The objective is to provide a reviewer-safe navigation model that identifies:

- reviewer entry surfaces
- canonical reading order
- normative discovery paths
- documentation discovery paths
- publication discovery paths
- extension discovery paths
- archive discovery paths
- navigation failure modes
- navigation resolution rules

---

# Navigation Surface Inventory

## Root Entry Surfaces

| Surface | Purpose |
|----------|----------|
| README.md | Primary repository entry point |
| ERC-8241.md | Normative specification |
| COMPLIANCE.md | Compliance definition |
| docs/README.md | Documentation navigation |
| docs/REPOSITORY_NAVIGATION.md | Repository navigation support |

---

## Documentation Surface

| Artifact |
|-----------|
| docs/README.md |
| docs/architecture.md |
| docs/etl-integration.md |
| docs/extensions.md |
| docs/PUBLICATION_ARCHITECTURE_OVERVIEW.md |
| docs/REPOSITORY_NAVIGATION.md |
| docs/migration-history.md |

---

## Publication Surface

| Artifact |
|-----------|
| docs/publication/ERC8241_FREEZE_DRAFT.md |
| docs/publication/ECOSYSTEM_GLOSSARY.md |
| docs/publication/README_TEMPLATE.md |
| docs/publication/FULL_ETL_STACK.mmd |
| docs/publication/AUTHORITY_HIERARCHY_MATRIX_V1.md |
| docs/publication/PUBLICATION_SURFACE_DEPENDENCY_MATRIX_V1.md |
| docs/publication/PUBLICATION_BLAST_RADIUS_MATRIX_V1.md |
| docs/publication/CANONICAL_SPECIFICATION_DESIGNATION_MATRIX_V1.md |

---

## Extension Surface

| Artifact Group |
|----------------|
| extensions/discovery/* |
| extensions/profiles/* |
| extensions/audit-evidence/* |
| extensions/safety/* |

---

## Archive Surface

| Artifact Group |
|----------------|
| research/legacy/* |

---

# Reviewer Entry Point Matrix

| Entry Surface | Reviewer Type | Recommended |
|---------------|---------------|-------------|
| README.md | New Reviewer | Yes |
| ERC-8241.md | Specification Reviewer | Yes |
| COMPLIANCE.md | Compliance Reviewer | Yes |
| docs/README.md | Documentation Reviewer | Yes |
| docs/publication/* | Publication Reviewer | Conditional |

---

# Canonical Reading Order

For first-time reviewers:

README.md

↓

ERC-8241.md

↓

COMPLIANCE.md

↓

docs/README.md

↓

docs/architecture.md

↓

docs/etl-integration.md

↓

docs/extensions.md

↓

docs/publication/*

---

# Normative Discovery Path

README.md

↓

ERC-8241.md

↓

COMPLIANCE.md

Only these artifacts define normative meaning.

---

# Documentation Discovery Path

README.md

↓

docs/README.md

↓

docs/architecture.md

↓

docs/etl-integration.md

↓

docs/extensions.md

Documentation explains but does not define ERC-8241.

---

# Publication Discovery Path

README.md

↓

docs/PUBLICATION_ARCHITECTURE_OVERVIEW.md

↓

docs/publication/*

Publication artifacts inherit authority from normative sources.

---

# Extension Discovery Path

README.md

↓

docs/extensions.md

↓

extensions/*

Extensions are optional.

Extensions do not modify compliance status.

---

# Archive Discovery Path

README.md

↓

research/legacy/*

Archives are historical references only.

Archives are non-normative.

---

# Navigation Failure Modes

## Failure Mode 1

Reviewer begins with publication artifacts.

Risk:

Misinterpreting derived material as authority.

Resolution:

Review normative sources first.

---

## Failure Mode 2

Reviewer begins with extensions.

Risk:

Treating optional functionality as mandatory.

Resolution:

Review ERC-8241.md and COMPLIANCE.md first.

---

## Failure Mode 3

Reviewer begins with archives.

Risk:

Treating historical material as current authority.

Resolution:

Use archives only after normative review.

---

## Failure Mode 4

Documentation conflicts with normative sources.

Risk:

Authority inversion.

Resolution:

Normative sources prevail.

---

# Navigation Resolution Rules

When navigation ambiguity exists:

1. README.md is the canonical repository entry point.
2. ERC-8241.md prevails.
3. COMPLIANCE.md prevails.
4. Documentation is explanatory.
5. Publication artifacts inherit authority.
6. Extensions are optional.
7. Archives are historical only.

---

# Navigation Architecture Summary

Repository Navigation

README.md

↓

Normative Surface

├── ERC-8241.md
└── COMPLIANCE.md

↓

Documentation Surface

├── docs/README.md
├── docs/architecture.md
├── docs/etl-integration.md
└── docs/extensions.md

↓

Publication Surface

└── docs/publication/*

↓

Extension Surface

└── extensions/*

↓

Archive Surface

└── research/legacy/*

---

# TARGET-022 Certification Record

Target:

TARGET-022

Title:

Cross-Repository Navigation Architecture Matrix Construction

Status:

GENERATED

Artifact:

docs/publication/CROSS_REPOSITORY_NAVIGATION_ARCHITECTURE_MATRIX_V1.md

Outcome:

Repository reviewer navigation topology reconstructed and documented.

