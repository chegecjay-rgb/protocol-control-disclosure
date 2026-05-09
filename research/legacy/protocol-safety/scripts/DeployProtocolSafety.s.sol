// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {ProtocolSafetyModule} from "src/core/ProtocolSafetyModule.sol";
import {ProtocolSafetyRegistry} from "src/core/ProtocolSafetyRegistry.sol";

contract DeployProtocolSafetyScript is Script {
    function run()
        external
        returns (ProtocolSafetyRegistry registry, ProtocolSafetyModule module)
    {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address initialOwner = vm.envAddress("INITIAL_OWNER");
        string memory protocolName = vm.envString("PROTOCOL_NAME");
        string memory manifestUri = vm.envString("MANIFEST_URI");
        string memory metadataUri = vm.envString("METADATA_URI");
        bytes32 manifestHash_ = vm.envBytes32("MANIFEST_HASH");
        uint64 standardVersion_ = uint64(vm.envUint("STANDARD_VERSION"));
        bool manifestClosedClaimed_ = vm.envBool("MANIFEST_CLOSED_CLAIMED");

        vm.startBroadcast(deployerPrivateKey);

        registry = new ProtocolSafetyRegistry(initialOwner);
        module = new ProtocolSafetyModule(
            initialOwner,
            protocolName,
            standardVersion_,
            manifestHash_,
            manifestUri,
            metadataUri,
            manifestClosedClaimed_
        );

        vm.stopBroadcast();
    }
}
