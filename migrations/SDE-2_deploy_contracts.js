const Exchange = artifacts.require("Exchange");
const Token = artifacts.require("Token");

module.exports = async function(deployer) {
  const feePercent = 1; // Example fee percentage
  await deployer.deploy(Exchange, feePercent);

  const initialSupply = web3.utils.toWei('1000', 'ether');
  await deployer.deploy(Token, "Example Token", "EXM", initialSupply);
};
