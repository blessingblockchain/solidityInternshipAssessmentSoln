//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.3.2/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts@4.3.2/access/Ownable.sol";

contract MyToken is ERC1155, Ownable {
    uint256[] supplies = [50, 100, 150];
    uint256[] minted = [0, 0, 0];

    constructor() ERC1155("https://api.mysite.com/tokens/{id}") {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount) 
        public 
    {
        require(id <= supplies.length, "Token doesnt exist");
        require(id != 0, "Token doesnt exixt");
        uint256 index = id - 1;

        require(minted[index] + amount <= supplies[index], "Not enough supply");
        _mint(account, id, amount, "");
        minted[index] <= amount;
    }

    function withdraw() public onlyOwner {
        require(address(this).balance > 0, "Balance is 0");
        payable(owner()).transfer(address(this).balance);
    }         
}