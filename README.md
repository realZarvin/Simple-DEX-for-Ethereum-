# My Basic Decentralized Exchange (DEX)

## Overview

This repository contains a simple decentralized exchange (DEX) built with Solidity. Users can trade ERC-20 tokens directly with each other without relying on a centralized authority. This project demonstrates complex smart contract interactions and security considerations essential for a DEX.

## Features

- Listing of multiple ERC-20 tokens
- Order matching (limit orders, market orders)
- Swapping functionality
- Fee mechanism

## Prerequisites

- [Node.js](https://nodejs.org/)
- [Truffle](https://www.trufflesuite.com/truffle)
- [Ganache](https://www.trufflesuite.com/ganache)
- [Metamask](https://metamask.io/)

## Setup

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone <repository-url>
cd decentralized-exchange
```

### 2. Install Dependencies

Install the required dependencies using npm:

```bash
npm install
```

### 3. Start Ganache

Start a local Ethereum blockchain using Ganache:

```bash
ganache-cli
```

### 4. Deploy the Contracts

Use Truffle to compile and deploy the contracts to the local blockchain:

```bash
truffle compile
truffle migrate
```

### 5. Running Tests

Run the unit tests to ensure everything is working correctly:

```bash
truffle test
```

## Project Structure

```
.
├── contracts/                    # Solidity smart contracts
│   ├── Exchange.sol              # Main DEX contract
│   └── Token.sol                 # Example ERC-20 token contract
├── migrations/                   # Migration scripts for deploying contracts
│   └── 2_deploy_contracts.js     # Deployment script
├── test/                         # Unit tests
│   ├── Exchange.test.js          # Tests for the Exchange contract
│   └── Token.test.js             # Tests for the Token contract
├── scripts/                      # Scripts for interacting with the deployed contracts
│   ├── deploy.js                 # Script for deploying the Exchange contract
│   └── interact.js               # Script for interacting with the Exchange contract
├── truffle-config.js             # Truffle configuration file
├── package.json                  # Node.js package configuration
├── README.md                     # Project README file
└── .gitignore                    # Files to be ignored by Git
```

## Contracts

### `Exchange.sol`

This contract implements the main functionality of the DEX, including:

- Listing supported ERC-20 tokens
- Depositing and withdrawing tokens
- Placing and filling orders
- Charging a fee for each trade

### `Token.sol`

This contract implements a basic ERC-20 token, which is used as an example token that can be traded on the DEX.

## Scripts

### `deploy.js`

A script to deploy the Exchange contract. It uses the Web3.js library to interact with the Ethereum blockchain.

### `interact.js`

A script to interact with the deployed Exchange contract. It demonstrates how to deposit tokens, place orders, and fill orders.

## Usage

### Depositing Tokens

To deposit tokens into the DEX, use the `deposit` function. For example:

```javascript
await exchange.methods.deposit(tokenAddress, web3.utils.toWei('10', 'ether')).send({ from: userAddress });
```

### Placing Orders

To place an order, use the `placeOrder` function. For example:

```javascript
await exchange.methods.placeOrder(amount, price, isBuyOrder).send({ from: userAddress });
```

### Filling Orders

To fill an order, use the `fillOrder` function. For example:

```javascript
await exchange.methods.fillOrder(orderId).send({ from: userAddress });
```

## Testing

The project includes unit tests for the Exchange and Token contracts. To run the tests, use:

```bash
truffle test
```

The tests cover the main functionalities of the DEX, including token deposits, withdrawals, order placements, and order fillings.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or inquiries, please contact [zarvinns@gmail.com].

