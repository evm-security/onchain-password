// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @author me@abhinavmir.xyz
contract lockingToken is ERC20, Ownable {
    constructor() ERC20("lockedMagic", "LMGC") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    event mintAmount(address indexed to, uint256 value);
    function mint( uint256 amount) public {
        require(amount<=100, "Amt must be < 100");
        amount = amount *10**decimals();
        _mint(msg.sender, amount);

        emit mintAmount(msg.sender, amount);
    }
}