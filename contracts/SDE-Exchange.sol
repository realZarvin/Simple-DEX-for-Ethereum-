// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Exchange is Ownable {
    struct Order {
        uint256 id;
        address trader;
        uint256 amount;
        uint256 price;
        bool isBuyOrder;
        bool isFilled;
    }

    uint256 public nextOrderId;
    uint256 public feePercent;
    mapping(address => bool) public supportedTokens;
    mapping(address => mapping(address => uint256)) public traderBalances;
    mapping(uint256 => Order) public orders;

    event OrderPlaced(uint256 orderId, address trader, uint256 amount, uint256 price, bool isBuyOrder);
    event OrderFilled(uint256 orderId, address trader, uint256 amount, uint256 price, bool isBuyOrder);
    event TokenAdded(address token);
    event TokenRemoved(address token);

    constructor(uint256 _feePercent) {
        feePercent = _feePercent;
    }

    function addToken(address token) external onlyOwner {
        supportedTokens[token] = true;
        emit TokenAdded(token);
    }

    function removeToken(address token) external onlyOwner {
        supportedTokens[token] = false;
        emit TokenRemoved(token);
    }

    function deposit(address token, uint256 amount) external {
        require(supportedTokens[token], "Token not supported");
        IERC20(token).transferFrom(msg.sender, address(this), amount);
        traderBalances[msg.sender][token] += amount;
    }

    function withdraw(address token, uint256 amount) external {
        require(traderBalances[msg.sender][token] >= amount, "Insufficient balance");
        traderBalances[msg.sender][token] -= amount;
        IERC20(token).transfer(msg.sender, amount);
    }

    function placeOrder(uint256 amount, uint256 price, bool isBuyOrder) external {
        uint256 orderId = nextOrderId++;
        orders[orderId] = Order(orderId, msg.sender, amount, price, isBuyOrder, false);
        emit OrderPlaced(orderId, msg.sender, amount, price, isBuyOrder);
    }

    function fillOrder(uint256 orderId) external {
        Order storage order = orders[orderId];
        require(!order.isFilled, "Order already filled");

        uint256 fee = (order.amount * feePercent) / 100;
        uint256 amountAfterFee = order.amount - fee;

        if (order.isBuyOrder) {
            require(traderBalances[order.trader][address(0)] >= order.amount, "Insufficient balance");
            traderBalances[order.trader][address(0)] -= order.amount;
            traderBalances[msg.sender][address(0)] += amountAfterFee;
            traderBalances[owner()][address(0)] += fee;
        } else {
            require(traderBalances[order.trader][msg.sender] >= order.amount, "Insufficient balance");
            traderBalances[order.trader][msg.sender] -= order.amount;
            traderBalances[msg.sender][msg.sender] += amountAfterFee;
            traderBalances[owner()][msg.sender] += fee;
        }

        order.isFilled = true;
        emit OrderFilled(orderId, order.trader, order.amount, order.price, order.isBuyOrder);
    }
}
