# Forbidden Patterns

The current prototype exposes several machine-readable structural failure kinds and several machine-readable audit issues.

## Structural failures

Key `FailureKind` values include:
- `MANIFEST_CLOSURE_VIOLATION`
- `UNKNOWN_PRIVILEGED_PATH`
- `SINGLE_EOA_CRITICAL_CONTROL`
- `ZERO_DELAY_CUSTODY_UPGRADE`
- `UNDISCLOSED_DELEGATECALL_EXTENSION`
- `OMITTED_RESERVE_CUSTODIAN`
- `OMITTED_BRIDGE_ADAPTER`
- `HIDDEN_MODULE_WITH_EXECUTION_RIGHTS`
- `OMITTED_FALLBACK_HANDLER`
- `OMITTED_GUARD`
- `UNDISCLOSED_ADMIN_CONTROLLER`
- `MISSING_EXACT_VERIFICATION_CRITICAL_COMPONENT`

These are structural red flags. They remain active regardless of whether audit evidence is present.

## Audit issues

Key `AuditIssueKind` values include:
- `NO_AUDIT_EVIDENCE`
- `AUDIT_TARGET_UNSPECIFIED`
- `AUDIT_PARTIAL_SCOPE`
- `AUDIT_APPLICABILITY_UNKNOWN`
- `AUDIT_NOT_APPLICABLE`
- `AUDIT_DRIFT_DETECTED`
- `STALE_AUDIT_EVIDENCE`
- `UNRESOLVED_AUDIT_FINDING`
- `DISPUTED_AUDIT_FINDING`
- `ACKNOWLEDGED_AUDIT_FINDING`
- `AUDIT_MISSING_PRIVILEGE_GRAPH_REVIEW`
- `AUDIT_MISSING_PROXY_REVIEW`
- `AUDIT_MISSING_ADMIN_ROLE_REVIEW`
- `AUDIT_MISSING_MODULE_REVIEW`
- `AUDIT_MISSING_CONTROL_PATH_REVIEW`

These do not mean the protocol is unsafe in the same way a structural failure does. They mean the audit layer is weak, stale, partial, mismatched, or easy to misinterpret.

## Interpretation Rule

Structural failures answer: what dangerous paths exist right now.

Audit issues answer: how much weight can be given to the available audit evidence.

They should be displayed separately.
