// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC165} from "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {ERC165Checker} from "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";
import {IProtocolSafetyCore} from "src/interfaces/IProtocolSafetyCore.sol";
import {IProtocolSafetyRegistry} from "src/interfaces/IProtocolSafetyRegistry.sol";

contract ProtocolSafetyRegistry is Ownable, ERC165, IProtocolSafetyRegistry {
    using ERC165Checker for address;

    error InvalidProtocolId();
    error ZeroAddress();
    error IndexOutOfBounds(uint256 index, uint256 length);
    error UnsupportedProtocolSafetyModule(address module);
    error UnknownProtocol(bytes32 protocolId);

    event ProtocolRegistered(bytes32 indexed protocolId, address indexed module);
    event ProtocolUpdated(
        bytes32 indexed protocolId,
        address indexed previousModule,
        address indexed newModule
    );
    event ProtocolRemoved(bytes32 indexed protocolId, address indexed module);

    bytes32[] private _protocolIds;

    mapping(bytes32 => address) private _moduleByProtocolId;
    mapping(bytes32 => uint256) private _protocolIndexPlusOne;
    mapping(address => uint256) private _moduleUseCount;

    constructor(address initialOwner) Ownable(initialOwner) {
        if (initialOwner == address(0)) revert ZeroAddress();
    }

    function protocolCount() external view returns (uint256) {
        return _protocolIds.length;
    }

    function protocolIdAt(uint256 index) external view returns (bytes32) {
        if (index >= _protocolIds.length) revert IndexOutOfBounds(index, _protocolIds.length);
        return _protocolIds[index];
    }

    function moduleOf(bytes32 protocolId) external view returns (address) {
        return _moduleByProtocolId[protocolId];
    }

    function isRegisteredModule(address module) external view returns (bool) {
        return _moduleUseCount[module] != 0;
    }

    function registerProtocol(bytes32 protocolId, address module) external onlyOwner {
        if (protocolId == bytes32(0)) revert InvalidProtocolId();
        if (module == address(0)) revert ZeroAddress();
        if (!module.supportsInterface(type(IProtocolSafetyCore).interfaceId)) {
            revert UnsupportedProtocolSafetyModule(module);
        }

        address previousModule = _moduleByProtocolId[protocolId];

        if (previousModule == address(0)) {
            _protocolIds.push(protocolId);
            _protocolIndexPlusOne[protocolId] = _protocolIds.length;
            emit ProtocolRegistered(protocolId, module);
        } else {
            _moduleUseCount[previousModule] -= 1;
            emit ProtocolUpdated(protocolId, previousModule, module);
        }

        _moduleByProtocolId[protocolId] = module;
        _moduleUseCount[module] += 1;
    }

    function removeProtocol(bytes32 protocolId) external onlyOwner {
        if (protocolId == bytes32(0)) revert InvalidProtocolId();

        address module = _moduleByProtocolId[protocolId];
        if (module == address(0)) revert UnknownProtocol(protocolId);

        uint256 index = _protocolIndexPlusOne[protocolId] - 1;
        uint256 lastIndex = _protocolIds.length - 1;

        if (index != lastIndex) {
            bytes32 movedProtocolId = _protocolIds[lastIndex];
            _protocolIds[index] = movedProtocolId;
            _protocolIndexPlusOne[movedProtocolId] = index + 1;
        }

        _protocolIds.pop();

        delete _protocolIndexPlusOne[protocolId];
        delete _moduleByProtocolId[protocolId];
        _moduleUseCount[module] -= 1;

        emit ProtocolRemoved(protocolId, module);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC165, IERC165) returns (bool) {
        return interfaceId == type(IProtocolSafetyRegistry).interfaceId
            || super.supportsInterface(interfaceId);
    }
}

