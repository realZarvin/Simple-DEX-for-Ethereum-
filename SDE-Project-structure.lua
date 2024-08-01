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
