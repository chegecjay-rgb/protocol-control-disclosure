// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MockReserveCustodian {
    event ReservesMoved(address indexed receiver, uint256 amount);

    function moveReserves(address receiver, uint256 amount) external {
        emit ReservesMoved(receiver, amount);
    }
}
