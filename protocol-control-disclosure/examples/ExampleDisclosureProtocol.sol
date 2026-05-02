// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../extensions/discovery/ERC8241Disclosure.sol";

/// @title ExampleDisclosureProtocol
/// @notice Example protocol exposing ERC-8241 disclosure location
contract ExampleDisclosureProtocol is ERC8241Disclosure {
    address public owner;

    constructor(string memory initialURI) ERC8241Disclosure(initialURI) {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    /// @notice Allows updating disclosure location
    function updateDisclosureURI(string memory newURI) external onlyOwner {
        _setDisclosureURI(newURI);
    }
}
