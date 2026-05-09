// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IERC8241Disclosure (Discovery Extension)
/// @notice Optional extension for locating ERC-8241 disclosure data.
/// @dev This does NOT define the disclosure schema, only how to find it.
interface IERC8241Disclosure {
    /// @notice Returns a URI pointing to the protocol's disclosure document.
    /// @dev Can be IPFS, HTTPS, Arweave, or local dev URI.
    function disclosureURI() external view returns (string memory);

    /// @notice Emitted when the disclosure location changes.
    event DisclosureURIUpdated(string previousURI, string newURI);
}
