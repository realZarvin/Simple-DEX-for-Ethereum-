const Exchange = artifacts.require("Exchange");
const Token = artifacts.require("Token");

contract("Exchange", (accounts) => {
  let exchange, token;
  const [owner, trader1, trader2] = accounts;

  beforeEach(async () => {
    exchange = await Exchange.deployed();
    token = await Token.deployed();
    await token.transfer(trader1, web3.utils.toWei('100', 'ether'), { from: owner });
    await token.approve(exchange.address, web3.utils.toWei('100', 'ether'), { from: trader1 });
  });

  it("should allow trader1 to deposit tokens", async () => {
    await exchange.deposit(token.address, web3.utils.toWei('50', 'ether'), { from: trader1 });
    const balance = await exchange.traderBalances(trader1, token.address);
    assert.equal(balance.toString(), web3.utils.toWei('50', 'ether'));
  });

  // Add more tests for placing and filling orders
});
