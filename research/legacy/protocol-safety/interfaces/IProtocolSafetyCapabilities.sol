// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";

/// @title IProtocolSafetyCapabilities
/// @notice Optional discovery surface for machine-readable protocol-safety capabilities.
/// @dev These capability flags describe which disclosure and verification-oriented surfaces
/// a module exposes. They do not, by themselves, prove safety, completeness, or correctness.
interface IProtocolSafetyCapabilities is IERC165 {
    /// @notice Returns a bitmask describing the supported protocol-safety capability surfaces.
    /// @dev The meaning of each bit is defined by `SafetyCapabilities`.
    function capabilityFlags() external view returns (uint256);

    /// @notice Returns whether all bits in `capabilityMask` are supported.
    /// @dev This is a discoverability helper only. A supported capability means the surface
    /// is exposed, not that its contents are true, complete, or well-maintained.
    function supportsCapabilities(uint256 capabilityMask) external view returns (bool);
}
