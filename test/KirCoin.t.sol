//SPDX-License-Identifier:MIT

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
    function testFailMint() public view{
        vm.startPrank(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955);
        kirCoin.mint(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955,10);

    }
    function testMint() public{
        kirCoin.mint(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955,10);
        assert(kirCoin.balanceOf(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955)==10);
    }
    function testChangeStakingContract()public{
        kirCoin.updateStakingContract(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955);
        vm.startPrank(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955);
        kirCoin.mint(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955,10);
        assert(kirCoin.balanceOf(0x14dC79964da2C08b23698B3D3cc7Ca32193d9955)==10);

    }

}