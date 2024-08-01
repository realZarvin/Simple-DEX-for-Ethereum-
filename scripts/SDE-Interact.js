const Web3 = require('web3');
const fs = require('fs');
const path = require('path');

const web3 = new Web3('http://localhost:8545');
const abi = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../build/contracts/Exchange.json')).abi);
const contractAddress = '0x...'; // Replace with deployed contract address

const interact = async () => {
  const accounts = await web3.eth.getAccounts();
  const exchange = new web3.eth.Contract(abi, contractAddress);

  
  await exchange.methods.deposit('0x...', web3.utils.toWei('10', 'ether')).send({ from: accounts[1] });
  console.log('Tokens deposited');
};
interact();
