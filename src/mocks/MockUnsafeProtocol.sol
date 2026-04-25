// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MockUnsafeProtocol is Ownable {
    error ZeroAddress();

    bool public depositsPaused;
    bool public withdrawalsPaused;
    uint256 public feeBps;
    uint256 public riskLimit;
    address public oracle;
    address public implementation;

    mapping(address => bool) public privilegedOperator;

    event DepositsPaused(bool paused);
    event WithdrawalsPaused(bool paused);
    event Upgraded(address indexed newImplementation);
    event FeeChanged(uint256 feeBps);
    event OracleChanged(address indexed newOracle);
    event RiskLimitChanged(uint256 newRiskLimit);
    event FundsSwept(address indexed asset, address indexed receiver, uint256 amount);
    event ReservesMoved(address indexed receiver, uint256 amount);
    event PrivilegedOperatorSet(address indexed operator, bool allowed);

    constructor(address initialOwner) Ownable(initialOwner) {
        if (initialOwner == address(0)) revert ZeroAddress();
    }

    function pauseDeposits(bool paused) external onlyOwner {
        depositsPaused = paused;
        emit DepositsPaused(paused);
    }

    function pauseWithdrawals(bool paused) external onlyOwner {
        withdrawalsPaused = paused;
        emit WithdrawalsPaused(paused);
    }

    function upgradeTo(address newImplementation) external onlyOwner {
        implementation = newImplementation;
        emit Upgraded(newImplementation);
    }

    function setFeeBps(uint256 newFeeBps) external onlyOwner {
        feeBps = newFeeBps;
        emit FeeChanged(newFeeBps);
    }

    function setOracle(address newOracle) external onlyOwner {
        if (newOracle == address(0)) revert ZeroAddress();
        oracle = newOracle;
        emit OracleChanged(newOracle);
    }

    function setRiskLimit(uint256 newRiskLimit) external onlyOwner {
        riskLimit = newRiskLimit;
        emit RiskLimitChanged(newRiskLimit);
    }

    function sweepFunds(address asset, address receiver, uint256 amount) external onlyOwner {
        emit FundsSwept(asset, receiver, amount);
    }

    function moveReserves(address receiver, uint256 amount) external onlyOwner {
        emit ReservesMoved(receiver, amount);
    }

    function setPrivilegedOperator(address operator, bool allowed) external onlyOwner {
        if (operator == address(0)) revert ZeroAddress();
        privilegedOperator[operator] = allowed;
        emit PrivilegedOperatorSet(operator, allowed);
    }
}