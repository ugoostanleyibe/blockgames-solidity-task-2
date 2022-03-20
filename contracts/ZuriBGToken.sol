// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZuriBGToken is ERC20, Ownable {
  uint256 constant tokensPerEther = 1000;

  constructor() ERC20("ZuriBGToken", "ZBT") {
    _mint(msg.sender, 1000000 * 10**decimals());
  }

  function mint(address addr, uint256 amount) public onlyOwner {
    _mint(addr, amount);
  }

  function buyToken(address addr) public payable {
    require(msg.value > 0, "You have to send some ETH");
    uint256 tokensToSend = (msg.value / 10**decimals()) * tokensPerEther;
    _mint(addr, tokensToSend);
  }
}