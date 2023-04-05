// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

//import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
//import {ERC20} from "openzeppelin-contracts/token/ERC20/ERC20.sol";
//import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MyERC20 is ERC20 {

    constructor(
        uint256 amount
    ) 
    ERC20("MyERC20", "ME2"){
        mint(amount);
    }

    function mint(uint256 amount) public {
        _mint(msg.sender, amount);
    }
    
}