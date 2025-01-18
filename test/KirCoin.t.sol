//SPDX-License-Identifier:MIT
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/KirCoin.sol";

contract KirCoinTest is Test{
    KirCoin kirCoin;

    function setUp(){
        kirCoin=new KirCoin(address(this));

    }
    function testInitialSupply() public view{
        assert(kirCoin.totalSupply()==0);
    }


}