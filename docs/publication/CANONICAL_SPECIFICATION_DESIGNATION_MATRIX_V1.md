# Canonical Specification Designation Matrix v1

## Purpose

This document formally designates the authority status of repository artifacts.

The objective is to provide a reviewer-safe map identifying:

- normative specification sources
- authoritative supporting sources
- explanatory documentation
- publication artifacts
- extension artifacts
- draft materials
- archival materials

This artifact is the formal output of TARGET-021.

---

# Designation Classes

| Class | Meaning |
|---------|---------|
| Normative Source | Defines ERC-8241 meaning and compliance |
| Canonical Supporting Source | Explains or organizes normative sources |
| Publication Artifact | Derived publication material |
| Extension Artifact | Optional functionality |
| Draft Artifact | Work-in-progress material |
| Archival Artifact | Historical reference only |

---

# Level 1 — Normative Sources

These artifacts define canonical ERC-8241 meaning.

| Artifact | Designation |
|-----------|-----------|
| ERC-8241.md | Normative Specification |
| COMPLIANCE.md | Normative Compliance Definition |

Authority Notes:

- define specification semantics
- define compliance obligations
- define interpretation boundaries

If conflicts occur:

1. ERC-8241.md prevails
2. COMPLIANCE.md prevails over all lower layers

---

# Level 2 — Canonical Supporting Sources

These artifacts explain and organize the normative surface.

| Artifact |
|-----------|
| docs/architecture.md |
| docs/README.md |
| docs/PUBLICATION_ARCHITECTURE_OVERVIEW.md |
| README.md |

Designation:

Canonical Supporting Source

Authority Notes:

- explanatory only
- organizational only
- not normative

---

# Level 3 — Publication Artifacts

These artifacts support publication and reviewer workflows.

| Artifact |
|-----------|
| docs/publication/ERC8241_FREEZE_DRAFT.md |
| docs/publication/ECOSYSTEM_GLOSSARY.md |
| docs/publication/README_TEMPLATE.md |
| docs/publication/FULL_ETL_STACK.mmd |
| docs/publication/AUTHORITY_HIERARCHY_MATRIX_V1.md |
| docs/publication/PUBLICATION_SURFACE_DEPENDENCY_MATRIX_V1.md |
| docs/publication/PUBLICATION_BLAST_RADIUS_MATRIX_V1.md |

Designation:

Publication Artifact

Authority Notes:

- inherit authority
- do not create authority
- cannot redefine compliance

---

# Level 4 — Extension Artifacts

These artifacts provide optional functionality.

| Artifact Group |
|-----------|
| docs/extensions.md |
| extensions/discovery/* |
| extensions/profiles/* |
| extensions/audit-evidence/* |
| extensions/safety/* |

Designation:

Extension Artifact

Authority Notes:

- optional
- non-normative
- cannot alter compliance status

---

# Level 5 — Draft Artifacts

These artifacts represent active development work.

| Artifact Group |
|-----------|
| research/drafts/* |

Designation:

Draft Artifact

Authority Notes:

- not authoritative
- subject to change
- not part of canonical specification surface

---

# Level 6 — Archival Artifacts

These artifacts are preserved for historical continuity.

| Artifact Group |
|-----------|
| research/legacy/* |

Designation:

Archival Artifact

Authority Notes:

- historical only
- non-normative
- cannot redefine repository meaning

---

# Reviewer Designation Rules

1. Review normative sources first.
2. Use supporting sources for interpretation.
3. Use publication artifacts for publication workflows.
4. Treat extensions as optional.
5. Treat drafts as non-authoritative.
6. Treat archives as historical references only.

---

# Canonical Specification Surface

The canonical specification surface consists exclusively of:

- ERC-8241.md
- COMPLIANCE.md

All other repository artifacts derive authority from these sources.

---

# TARGET-021 Certification Record

Target:

TARGET-021

Title:

Canonical Specification Designation Matrix Construction

Status:

COMPLETE


Artifact:

docs/publication/CANONICAL_SPECIFICATION_DESIGNATION_MATRIX_V1.md

Outcome:

Repository specification authority designations reconstructed and documented.

