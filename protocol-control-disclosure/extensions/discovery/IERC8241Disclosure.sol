// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IERC8241Disclosure
/// @notice Minimal discovery interface for locating ERC-8241 disclosure data
/// @dev ERC-165 compatible
interface IERC8241Disclosure {
    /// @notice Returns the URI pointing to the protocol's disclosure data
    /// @dev URI can be IPFS, HTTPS, Arweave, or local reference
    function disclosureURI() external view returns (string memory);
}
