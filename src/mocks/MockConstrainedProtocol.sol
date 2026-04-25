// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MockConstrainedProtocol {
    error Unauthorized();
    error ZeroAddress();

    address public immutable upgradeController;
    address public immutable emergencyController;
    address public immutable reserveController;

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
    event ReservesMoved(address indexed receiver, uint256 amount);
    event PrivilegedOperatorSet(address indexed operator, bool allowed);

    constructor(
        address upgradeController_,
        address emergencyController_,
        address reserveController_
    ) {
        if (
            upgradeController_ == address(0) || emergencyController_ == address(0)
                || reserveController_ == address(0)
        ) {
            revert ZeroAddress();
        }

        upgradeController = upgradeController_;
        emergencyController = emergencyController_;
        reserveController = reserveController_;
    }

    function pauseDeposits(bool paused) external {
        if (msg.sender != emergencyController) revert Unauthorized();
        depositsPaused = paused;
        emit DepositsPaused(paused);
    }

    function pauseWithdrawals(bool paused) external {
        if (msg.sender != reserveController) revert Unauthorized();
        withdrawalsPaused = paused;
        emit WithdrawalsPaused(paused);
    }

    function upgradeTo(address newImplementation) external {
        if (msg.sender != upgradeController) revert Unauthorized();
        implementation = newImplementation;
        emit Upgraded(newImplementation);
    }

    function setFeeBps(uint256 newFeeBps) external {
        if (msg.sender != reserveController) revert Unauthorized();
        feeBps = newFeeBps;
        emit FeeChanged(newFeeBps);
    }

    function setOracle(address newOracle) external {
        if (msg.sender != reserveController) revert Unauthorized();
        if (newOracle == address(0)) revert ZeroAddress();
        oracle = newOracle;
        emit OracleChanged(newOracle);
    }

    function setRiskLimit(uint256 newRiskLimit) external {
        if (msg.sender != reserveController) revert Unauthorized();
        riskLimit = newRiskLimit;
        emit RiskLimitChanged(newRiskLimit);
    }

    function moveReserves(address receiver, uint256 amount) external {
        if (msg.sender != reserveController) revert Unauthorized();
        emit ReservesMoved(receiver, amount);
    }

    function setPrivilegedOperator(address operator, bool allowed) external {
        if (msg.sender != reserveController) revert Unauthorized();
        if (operator == address(0)) revert ZeroAddress();
        privilegedOperator[operator] = allowed;
        emit PrivilegedOperatorSet(operator, allowed);
    }
}