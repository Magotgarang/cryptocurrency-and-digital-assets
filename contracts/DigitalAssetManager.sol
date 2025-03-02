// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";

contract DigitalAssetManager is Ownable {
    struct Asset {
        string name;
        string description;
        string assetHash;
        address currentOwner;
        uint256 timestamp;
        address[] ownershipHistory;
    }

    mapping(string => Asset) private assets; // Mapping asset hash to asset details
    mapping(string => bool) private registeredAssets; // Track registered assets

    event AssetRegistered(string indexed assetHash, address indexed owner, uint256 timestamp);
    event OwnershipTransferred(string indexed assetHash, address indexed previousOwner, address indexed newOwner, uint256 timestamp);

    constructor() Ownable() {
        // The Ownable constructor will set the owner to the deployer
    }

    function registerAsset(string memory _name, string memory _description, string memory _assetHash) external {
        require(!registeredAssets[_assetHash], "Asset already registered");

        Asset storage newAsset = assets[_assetHash];
        newAsset.name = _name;
        newAsset.description = _description;
        newAsset.assetHash = _assetHash;
        newAsset.currentOwner = msg.sender;
        newAsset.timestamp = block.timestamp;
        newAsset.ownershipHistory.push(msg.sender); // Store initial owner

        registeredAssets[_assetHash] = true;

        emit AssetRegistered(_assetHash, msg.sender, block.timestamp);
    }

    function transferOwnership(string memory _assetHash, address _newOwner) external {
        require(registeredAssets[_assetHash], "Asset not registered");
        require(assets[_assetHash].currentOwner == msg.sender, "Only current owner can transfer");

        address previousOwner = assets[_assetHash].currentOwner;
        assets[_assetHash].currentOwner = _newOwner;
        assets[_assetHash].ownershipHistory.push(_newOwner);

        emit OwnershipTransferred(_assetHash, previousOwner, _newOwner, block.timestamp);
    }

    function getAssetDetails(string memory _assetHash) external view returns (
        string memory, string memory, address, uint256, address[] memory
    ) {
        require(registeredAssets[_assetHash], "Asset not registered");
        Asset memory asset = assets[_assetHash];
        return (asset.name, asset.description, asset.currentOwner, asset.timestamp, asset.ownershipHistory);
    }

    function verifyAsset(string memory _assetHash) external view returns (bool) {
        return registeredAssets[_assetHash];
    }
}
