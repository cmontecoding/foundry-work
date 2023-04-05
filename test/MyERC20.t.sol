// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "../lib/forge-std/src/Test.sol";
import "../src/MyERC20.sol";

contract MyERC20Test is Test {

    MyERC20 public myERC20;

    function setUp() public {
        myERC20 = new MyERC20();
    }
    
    function testMint() public {
        uint256 amount = 100;
        myERC20.mint(amount);
        bool mintPassed = myERC20.balanceOf(amount, address(this));
        assertTrue(mintPassed);
    }

}