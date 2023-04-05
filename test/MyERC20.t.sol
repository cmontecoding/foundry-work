// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/MyERC20.sol";

contract MyERC20Test is Test {

    MyERC20 public myERC20;

    function setUp() public {
    }
    
    function testDeployment(uint256 amount) public {
        myERC20 = new MyERC20(amount, address(this));
        uint256 mintBalance = myERC20.balanceOf(address(this));
        assertEq(mintBalance, amount);
    }

    function testFail_Fuzzing(uint256 amount) public {
        uint256 plus2 = amount + 2;
        //assertion below should fail
        assertEq(plus2, amount);
    }

}