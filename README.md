# MGNToken
MGNToken is an ERC-20 standard Ethereum token created using a Solidity smart contract. This contract facilitates the exchange of MGNTokens between Ethereum accounts and includes features such as displaying the address of the last sender and the timestamp of the token transaction.
## Overview
MGNToken is an ERC-20 token named "AITU_MAGZHAN" with symbol "MGN." It includes additional functions to facilitate minting, burning, and retrieving transaction information.

## Usage
### Deployment
Deploy the contract to an Ethereum network, such as the mainnet or a testnet.

### Minting
Use the `mint` function to create new tokens and assign them to a specified address. Only the admin (deployer) can perform this operation.

### Burning
Burn tokens using the `burn` function to decrease the total token supply. This function is accessible to the token holder.

### Transaction Information
Retrieve various transaction details, including the sender, receiver, and timestamp. The contract also provides a human-readable timestamp converted from the block timestamp.

## Examples
```solidity
// Minting 100 MGNTokens to address 0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678
MGNToken.mint(0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678, 100);

// Burning 50 MGNTokens from the sender's address
MGNToken.burn(50);

// Retrieving the address of the last sender
address lastSender = MGNToken.getTransactionSender();

// Getting the human-readable timestamp of the latest transaction
string memory latestTimestamp = MGNToken.getLatestTransactionTimestamp();

![image](https://github.com/zhambyl14/ass1_BTx/assets/147126858/08fd7be9-cd66-43ec-a183-0edb8dc9ee87)
![image](https://github.com/zhambyl14/ass1_BTx/assets/147126858/7759e7c1-923f-4902-b758-bdbca04158be)




