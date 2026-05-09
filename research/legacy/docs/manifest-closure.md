# Manifest Closure

Manifest closure means the declared manifest is closed under privileged influence for the claimed scope.

If an address, contract, module, adapter, authority node, or controller can materially influence any in-scope component, it must itself be included in the declared manifest boundary.

## Why closure matters

A manifest that only lists user-facing contracts can still hide the true control surface.

The real privilege path may sit behind those contracts through:
- proxy admins
- timelocks
- multisigs
- guards
- fallback handlers
- modules
- bridge adapters
- governance executors
- custodians
- oracle managers
- emergency controllers

A user-facing surface can look simple while the real authority graph is not.

## Included by closure

At minimum, closure should cover relevant in-scope privileged dependencies such as:
- proxy admins
- timelocks
- multisigs
- beacons
- access managers
- role admins
- modules
- guards
- fallback handlers
- bridge adapters
- custodians
- oracle managers
- emergency controllers
- governance executors

The exact required set still depends on the declared scope, system design, and power graph.

## Closure is a structural rule

Manifest closure is a structural property of the declared model.

It is not proof that:
- the publisher told the whole truth
- no omitted offchain authority exists
- no undeclared dependency matters
- the live system is fully captured

It means only that, within the declared model and scope, privileged influence is expected to be closed under the disclosed graph.

## Examples

Examples of meaningful control paths include:

- `VaultProxy -> ProxyAdmin -> Timelock -> Safe`
- `Treasury -> Module -> Delegatecall extension`
- `OracleManager -> Updater role -> Guardian`

If any privileged path depends on an omitted node, then closure fails for that declared model.

## Current rule in this repository

Unknown privileged path equals failure.

That rule is currently surfaced through raw and derived structures such as:
- manifest-closure-related failure kinds
- unknown privileged path findings
- omitted privileged dependency findings
- disclosure summaries that surface unknown privilege counts

## Closure and audit evidence

Audit evidence does not repair closure failure.

If the live or declared manifest is not closed under privileged influence, the structural profile remains failed even if audit evidence exists.

Audit evidence may explain, contextualize, or supplement the situation.
It does not erase the structural problem.

## Closure and canonical identity

Closure should be reasoned about using canonical node identity, not only addresses.

That is why the repository treats `nodeId` as canonical and address bindings as compatibility metadata.
A closure argument that depends only on visible addresses may miss non-address-native authority structure.
