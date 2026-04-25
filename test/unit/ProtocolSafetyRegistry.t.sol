// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {Test} from "forge-std/Test.sol";
import {ProtocolSafetyModule} from "src/core/ProtocolSafetyModule.sol";
import {ProtocolSafetyRegistry} from "src/core/ProtocolSafetyRegistry.sol";
import {IProtocolSafetyRegistry} from "src/interfaces/IProtocolSafetyRegistry.sol";
import {MockUnsafeProtocol} from "src/mocks/MockUnsafeProtocol.sol";

contract ProtocolSafetyRegistryTest is Test {
    ProtocolSafetyRegistry internal registry;
    ProtocolSafetyModule internal module;

    bytes32 internal constant PROTOCOL_ID = keccak256("example-protocol");

    function setUp() external {
        registry = new ProtocolSafetyRegistry(address(this));
        module = new ProtocolSafetyModule(
            address(this),
            "Registry Example",
            1,
            keccak256("manifest"),
            "ipfs://manifest",
            "ipfs://metadata",
            true
        );
    }

    function test_supportsRegistryInterface() external view {
        assertTrue(registry.supportsInterface(type(IProtocolSafetyRegistry).interfaceId));
        assertTrue(registry.supportsInterface(type(IERC165).interfaceId));
    }

    function test_registersProtocolSafetyModule() external {
        registry.registerProtocol(PROTOCOL_ID, address(module));

        assertEq(registry.protocolCount(), 1);
        assertEq(registry.protocolIdAt(0), PROTOCOL_ID);
        assertEq(registry.moduleOf(PROTOCOL_ID), address(module));
        assertTrue(registry.isRegisteredModule(address(module)));
    }

    function test_rejectsNonSafetyModule() external {
        MockUnsafeProtocol unsafeProtocol = new MockUnsafeProtocol(address(this));

        vm.expectRevert(
            abi.encodeWithSelector(
                ProtocolSafetyRegistry.UnsupportedProtocolSafetyModule.selector,
                address(unsafeProtocol)
            )
        );
        registry.registerProtocol(PROTOCOL_ID, address(unsafeProtocol));
    }
}
