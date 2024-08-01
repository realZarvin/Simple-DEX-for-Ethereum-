const Web3 = require('web3');
const fs = require('fs');
const path = require('path');

const web3 = new Web3('http://localhost:8545');
const bytecode = fs.readFileSync(path.resolve(__dirname, '../build/contracts/Exchange.json')).bytecode;
const abi = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../build/contracts/Exchange.json')).abi);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();
  const result = await new web3.eth.Contract(abi)
    .deploy({ data: bytecode })
    .send({ from: accounts[0], gas: '1000000' });

  console.log('Contract deployed to', result.options.address);
};
deploy();
    
