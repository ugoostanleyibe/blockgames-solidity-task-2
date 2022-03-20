// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FTRToken is ERC20 {
  constructor() ERC20("FTRToken", "FTR") {
    _mint(msg.sender, 1000000);
  }
}