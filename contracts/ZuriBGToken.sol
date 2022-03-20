// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ZuriBGToken is ERC20 {
  uint256 fixedSupplyAmount;
  uint256 tokensPerEther;

  constructor() ERC20("ZuriBGToken", "ZBT") {
    fixedSupplyAmount = 1000000 * 10**decimals();
    tokensPerEther = 1000;

    _mint(msg.sender, 1000000 * 10**decimals());
  }

  function buyToken(address addr) public payable {
    require(msg.value > 0, "You have to send some ETH");
    uint256 tokensToSend = msg.value * tokensPerEther;

    require(tokensToSend + totalSupply() <= fixedSupplyAmount, "You cannot buy more than fixed supply");
    _mint(addr, tokensToSend);
  }
}