//SPDX-License-Identifier;MIT;
pragma solidity ^0.8.28;

import "../src/StakingContract.sol";
import "forge-std/Test.sol";

contract StakingContractTest is Test{
    StakingContract stakingContract;


    function setUp() public{
        stakingContract=new StakingContractTest();



    }
    function testStake() public{
        stakingContract.stake{value:200}();
        assert(stakingContract.balanceOf(address(this))==200);

    }
    function testUnstake() public{
        stakingContract.stake{value:200}();
        stakingContract.unstake(100);
        assert(stakingContract.balanceOf(address(this))==100);


    }
    function testFailUnstake() public{
        stakingContract.stake{value:200}();
        stakingContract.unstake(300);

    }

}