//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.3.2/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts@4.3.2/access/Ownable.sol";

contract MyToken is ERC1155, Ownable {
    
    constructor() ERC1155("https://api.mysite.com/tokens/{id}") {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public 
        onlyOwner
    {
        _mint(account, id, amount, data);
    }    
    
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public 
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }    
}