# Digital Asset Registry Smart Contract

## Overview
This project implements a **Digital Asset Registry** using **Ethereum blockchain** and **Solidity**. The purpose of this contract is to provide a platform for users to register digital assets, transfer ownership, and verify the integrity of assets through cryptographic hashes.

### Features:
- **Asset Registration**: Users can register a new digital asset by providing a name, description, and a cryptographic hash of the asset.
- **Ownership Transfer**: The current owner of an asset can transfer ownership to another address.
- **Asset Integrity Verification**: Users can verify if an asset's hash is registered on the blockchain, ensuring its integrity.
- **Ownership History**: Each asset keeps track of all previous owners, which provides a complete ownership history.

### Smart Contracts:
1. **DigitalAssetRegistry.sol**: The main contract that enables digital asset registration, ownership transfers, and integrity verification.
2. **DigitalAssetManager.sol**: A secondary contract (if applicable to your project) that may include additional management features for digital assets like handling various asset-related actions or permissions.

### Functions:
#### In **DigitalAssetRegistry.sol**:
1. **registerAsset()**: Registers a new digital asset with its name, description, and cryptographic hash.
2. **transferOwnership()**: Transfers the ownership of an asset from the current owner to a new owner.
3. **getAssetDetails()**: Retrieves the details of a specific asset, including the name, description, current owner, timestamp of registration, and ownership history.
4. **verifyAsset()**: Verifies if an asset exists by checking its hash in the registry.

#### In **DigitalAssetManager.sol** (if included):
- The `DigitalAssetManager.sol` file might have additional logic to manage multiple assets, permissions, or even support asset trading functionalities. You should include any specific functions or capabilities relevant to your project in this file.

### Technologies Used:
- **Solidity**: Smart contract language used to write the contract.
- **Ethereum**: Decentralized blockchain to deploy the contract.
- **Remix IDE**: Web-based IDE for Solidity smart contract development.

### Setup and Deployment

1. **Open Remix IDE**: Visit [Remix IDE](https://remix.ethereum.org).
2. **Create a new file**: Name it `DigitalAssetRegistry.sol` (and `DigitalAssetManager.sol` if applicable) and paste the Solidity code provided.
3. **Compile the Contract**: In the **Solidity Compiler** tab, compile the contract using Solidity version 0.8.19 or higher.
4. **Deploy the Contract**:
   - Go to the **Deploy & Run Transactions** tab.
   - Select the **Injected Web3** environment to deploy on a test network (such as **Ropsten** or **Rinkeby**).
   - Ensure your **Metamask** wallet is connected with some test ETH.
5. **Interact with the Contract**:
   - Register an asset using `registerAsset()`.
   - Transfer ownership using `transferOwnership()`.
   - Retrieve asset details using `getAssetDetails()`.
   - Verify asset integrity using `verifyAsset()`.

### Example Usage:

1. **Registering an Asset**:
   Call `registerAsset("Asset Name", "Asset Description", "0x1234567890abcdef...")`.

2. **Transferring Ownership**:
   Call `transferOwnership("0x1234567890abcdef...", "0xabcdef1234567890...")`.

3. **Retrieving Asset Details**:
   Call `getAssetDetails("0x1234567890abcdef...")`.

4. **Verifying Asset**:
   Call `verifyAsset("0x1234567890abcdef...")`.

### License
This project is licensed under the MIT License.

### Contact
If you have any questions, feel free to reach out to me at my email: [magotguut@gmail.com]
