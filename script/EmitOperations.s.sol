// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/examples/ExampleProofOfOperation.sol";

contract EmitOperations is Script {
    function run() external {
        vm.startBroadcast();

        ExampleProofOfOperation poo = new ExampleProofOfOperation();

        poo.executePause(address(0x123));
        poo.executeUpgrade(address(0x456), "");

        vm.stopBroadcast();
    }
}
