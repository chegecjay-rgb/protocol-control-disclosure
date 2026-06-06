# Publication Blast Radius Matrix v1

## Purpose

This document records blast-radius relationships across the ERC-8241 repository.

The objective is to identify:

- specification change impact
- compliance change impact
- documentation change impact
- publication surface impact
- extension impact
- historical archive impact
- required review scope after modifications

This artifact is the formal output of TARGET-020.

---

# Blast Radius Classification Model

| Classification | Meaning |
|-----------|-----------|
| Critical | Repository-wide review required |
| High | Multiple publication artifacts affected |
| Medium | Limited documentation review required |
| Low | Localized impact only |
| None | No downstream effect |

---

# Normative Source Blast Radius

## ERC-8241.md

Authority Class:

Normative Specification

Blast Radius:

Critical

Affected Surfaces:

- COMPLIANCE.md
- architecture documentation
- publication artifacts
- reviewer interpretation
- freeze documentation
- ecosystem terminology

Review Requirement:

Full publication review required.

---

## COMPLIANCE.md

Authority Class:

Normative Compliance Definition

Blast Radius:

High

Affected Surfaces:

- compliance interpretation
- freeze documentation
- publication templates
- authority reconstruction artifacts

Review Requirement:

Compliance review and publication review required.

---

# Documentation Surface Blast Radius

## README.md

Blast Radius:

Medium

Affected Surfaces:

- repository navigation
- reviewer onboarding

Review Requirement:

Documentation review only.

---

## docs/architecture.md

Blast Radius:

High

Affected Surfaces:

- publication explanations
- glossary definitions
- ecosystem interpretation

Review Requirement:

Architecture consistency review.

---

## docs/etl-integration.md

Blast Radius:

Medium

Affected Surfaces:

- ETL ecosystem explanation
- visualization artifacts

Review Requirement:

Documentation review.

---

## docs/extensions.md

Blast Radius:

Medium

Affected Surfaces:

- extension guidance
- extension interpretation

Review Requirement:

Extension documentation review.

---

# Publication Surface Blast Radius

| Artifact | Blast Radius |
|-----------|-----------|
| ERC8241_FREEZE_DRAFT.md | High |
| ECOSYSTEM_GLOSSARY.md | High |
| README_TEMPLATE.md | High |
| FULL_ETL_STACK.mmd | Medium |
| AUTHORITY_HIERARCHY_MATRIX_V1.md | Medium |
| PUBLICATION_SURFACE_DEPENDENCY_MATRIX_V1.md | Medium |

Assessment:

Publication artifacts are dependency consumers.

They inherit meaning from higher-authority sources.

---

# Extension Surface Blast Radius

Extensions are optional.

Extension modifications:

- do not redefine ERC-8241
- do not redefine compliance
- do not alter publication authority

Blast Radius:

Low

Review Requirement:

Local extension review only.

---

# Historical Archive Blast Radius

Historical archives are preserved for continuity.

Archive modifications:

- do not alter specification meaning
- do not alter compliance meaning
- do not alter publication authority

Blast Radius:

Low

Review Requirement:

Archive integrity review only.

---

# Repository Change-Control Matrix

| Changed Artifact Class | Review Scope |
|-----------|-----------|
| ERC-8241.md | Full Repository Review |
| COMPLIANCE.md | Compliance + Publication Review |
| Architecture Documentation | Documentation + Publication Review |
| Publication Artifacts | Publication Review |
| Extensions | Extension Review |
| Historical Archives | Archive Review |

---

# Blast Radius Resolution Rules

1. Specification changes propagate downward.
2. Compliance changes propagate downward.
3. Documentation changes cannot override normative sources.
4. Publication artifacts inherit authority.
5. Extensions cannot increase authority level.
6. Historical archives cannot increase authority level.

---

# TARGET-020 Certification Record

Target:

TARGET-020

Title:

Publication Blast Radius Matrix Construction

Status:

COMPLETE


Artifact:

docs/publication/PUBLICATION_BLAST_RADIUS_MATRIX_V1.md

Outcome:

Repository blast-radius structure reconstructed and documented.

