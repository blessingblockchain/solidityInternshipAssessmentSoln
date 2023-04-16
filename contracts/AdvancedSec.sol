pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract MyContract is ReentrancyGuard {
  function vulnerableFunction() public nonReentrant {
    // Code vulnerable to reentrancy attacks
  }
}
