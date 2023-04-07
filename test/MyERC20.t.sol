// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/MyERC20.sol";

contract MyERC20Test is Test {

    MyERC20 public myERC20;

    function setUp() public {
        myERC20 = new MyERC20(0, address(this));
        vm.deal(address(this), 2 ether);
    }
    
    function test_Deployment(uint256 amount) public {
        myERC20 = new MyERC20(amount, address(this));
        uint256 mintBalance = myERC20.balanceOf(address(this));
        assertEq(mintBalance, amount);
    }

    function test_Buy() public {
        
        myERC20.buy{value: 0.001 ether}(1);
        myERC20.buy{value: 0.005 ether}(5);
        myERC20.buy{value: 1.003 ether}(1003);
        assertEq(myERC20.balanceOf(address(this)), 1009);
    }

    function testFail_Buy() public {
        myERC20.buy{value: 0.002 ether}(1);
    }

    /*
    function testFuzz_Buy(uint256 amount) public {
        uint256 etherAmount = amount / 1000;
        myERC20.buy{value: etherAmount ether}(amount);
    }
    */

    function test_Burn() public {
        myERC20.buy{value: 0.001 ether}(1);
        myERC20.burn(1);
        assertEq(myERC20.balanceOf(address(this)), 0);
    }

    function testFail_Burn() public {
        myERC20.buy{value: 0.001 ether}(1);
        myERC20.burn(2);
    }

    function test_Withdrawal() public {
        myERC20.buy{value: 0.005 ether}(5);
        assertTrue(myERC20.withdrawal());
        //uint256 balance = address(new MyERC20()).balance;
        //assertEq(balance, 1.996);
    }





    ///
    /// tests below are unrelated, understanding only
    ///
    
    function testFail_Fuzzing(uint256 amount) public {
        uint256 plus2 = amount + 2;
        //assertion below should fail
        assertEq(plus2, amount);
    }

    function test_ExpectRevertDivide0() public {
        uint256 zero = 0;
        uint256 divide = 0;
        vm.expectRevert();
        divide = 32 / zero;
    }

    function test_CannotSubtract43() public {
    uint256 testNumber = 42;
    vm.expectRevert();
    testNumber -= 43;
    }

}