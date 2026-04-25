// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MockExecutionModule {
    event Executed(address indexed target, bytes data);

    function execute(address target, bytes calldata data) external {
        emit Executed(target, data);
    }
}
