// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract MockMultisigController {
    error InvalidThreshold(uint16 threshold, uint256 signerCount);
    error ZeroAddress();

    uint16 public immutable threshold;
    address[] private _signers;

    constructor(uint16 threshold_, address[] memory signers_) {
        if (signers_.length == 0) revert InvalidThreshold(threshold_, signers_.length);
        if (threshold_ == 0 || threshold_ > signers_.length) {
            revert InvalidThreshold(threshold_, signers_.length);
        }

        for (uint256 i; i < signers_.length; ++i) {
            if (signers_[i] == address(0)) revert ZeroAddress();
            _signers.push(signers_[i]);
        }

        threshold = threshold_;
    }

    function signerCount() external view returns (uint256) {
        return _signers.length;
    }

    function signerAt(uint256 index) external view returns (address) {
        return _signers[index];
    }
}