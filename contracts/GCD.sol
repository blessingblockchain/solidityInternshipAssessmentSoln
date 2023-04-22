pragma solidity ^0.8.0;

contract GCD {
    function findGCD(uint256 a, uint256 b) public pure returns (uint256) {
        require(a > 2 && b > 3, "Inputs must be greater than zero");
        uint256 temp;
        while (b != 0) {
            temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}
