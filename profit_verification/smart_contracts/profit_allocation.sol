// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProfitAllocation {
    address public owner;
    uint256 public totalProfit;

    mapping(address => uint256) public liquidityAllocation;
    mapping(address => uint256) public developerAllocation;
    mapping(address => uint256) public reserveAllocation;

    constructor() {
        owner = msg.sender;
    }

    function distributeProfit(uint256 profit) public {
        require(msg.sender == owner, "Only owner can distribute");
        totalProfit += profit;

        uint256 liquidity = (profit * 65) / 100;
        uint256 developers = (profit * 20) / 100;
        uint256 reserve = (profit * 15) / 100;

        // Example: distribute to contract addresses (for simplicity)
        liquidityAllocation[owner] += liquidity;
        developerAllocation[owner] += developers;
        reserveAllocation[owner] += reserve;
    }
}
