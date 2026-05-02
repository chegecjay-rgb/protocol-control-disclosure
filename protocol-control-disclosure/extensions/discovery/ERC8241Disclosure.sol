// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./IERC8241Disclosure.sol";

/// @dev Minimal ERC-165 interface
interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

/// @title ERC8241Disclosure
/// @notice Base contract implementing disclosure discovery
contract ERC8241Disclosure is IERC8241Disclosure, IERC165 {
    string private _disclosureURI;

    constructor(string memory initialURI) {
        _disclosureURI = initialURI;
    }

    /// @inheritdoc IERC8241Disclosure
    function disclosureURI() external view override returns (string memory) {
        return _disclosureURI;
    }

    /// @notice Internal function to update disclosure URI
    function _setDisclosureURI(string memory newURI) internal {
        _disclosureURI = newURI;
    }

    /// @inheritdoc IERC165
    function supportsInterface(bytes4 interfaceId) external pure override returns (bool) {
        return interfaceId == type(IERC8241Disclosure).interfaceId
            || interfaceId == type(IERC165).interfaceId;
    }
}
