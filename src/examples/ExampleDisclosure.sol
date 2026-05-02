// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../extensions/discovery/IERC8241Disclosure.sol";

/// @title ExampleDisclosure
/// @notice Minimal example of a contract exposing ERC-8241 disclosure location.
contract ExampleDisclosure is IERC8241Disclosure {
    string private _disclosureURI;

    constructor(string memory initialURI) {
        _disclosureURI = initialURI;
    }

    function disclosureURI() external view override returns (string memory) {
        return _disclosureURI;
    }

    /// @notice Updates the disclosure URI (no access control for simplicity)
    function setDisclosureURI(string memory newURI) external {
        string memory old = _disclosureURI;
        _disclosureURI = newURI;

        emit DisclosureURIUpdated(old, newURI);
    }
}
