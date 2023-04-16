import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyContract is AccessControl {
  bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

  constructor() {
    _setupRole(ADMIN_ROLE, msg.sender);
  }

  function restrictedFunction() public onlyRole(ADMIN_ROLE) {
    // Only users with ADMIN_ROLE can call this function
  }

  
}