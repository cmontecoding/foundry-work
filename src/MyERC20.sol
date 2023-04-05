// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/token/ERC20/ERC20.sol";


contract MyERC20 is ERC20 {

    constructor(
        uint256 amount,
        address beneficiary
    ) 
    ERC20("cmonte", "cmt"){
        _mint(beneficiary, amount);
    }

}