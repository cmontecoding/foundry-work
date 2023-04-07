// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/token/ERC20/ERC20.sol";
import "forge-std/console.sol";


contract MyERC20 is ERC20 {

    address public owner;

    constructor(
        uint256 amount,
        address beneficiary
    ) 
    ERC20("cmonte", "cmt"){
        _mint(beneficiary, amount);
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function buy(uint256 cmtAmount) public payable {
        //1 cmt is .001 eth
        uint256 cmtPrice = 1000000000000000 * cmtAmount;
        console.log(cmtAmount);
        console.log(cmtPrice);
        console.log(msg.value);

        require(msg.value > 0, "Did not receive ether");
        require(msg.value == cmtPrice,
        "Received different amount of ETH than required, Remember 1 CMT is .001 ETH");
        _mint(msg.sender, cmtAmount);
    }

    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }

    function withdrawal() public onlyOwner returns(bool) {
        console.log(address(this).balance);
        require(transfer(msg.sender, 5), "could not withdrawal");
        return true;
    }

}