//SPDX-License-Identifier:MIT
pragma solidity ^0.8.28;

contract StakingContract{
    mapping(address=>uint) balances;
    mapping(address=>uint) unclaimedRewards;
    mapping(address=>uint) lastUpdateTime;

    constructor(){

    }

    function stake() public payable{
        require(msg.value>0);
        if(!lastUpdateTime[msg.sender]){
            lastUpdateTime[msg.sender]=block.timestamp;

        }else{
            unclaimedRewards[msg.sender]+=(block.timestamp-lastUpdateTime[msg.sender])*balances[msg.sender];
            lastUpdateTime[msg.sender]=block.timestamp
        }
        balances[msg.sender]+=value;

    }
    function unstake(uint _amount) public{
        require(_amount<=balances[msg.sender]);
        payable(msg.sender).transfer(_amount);
        balaces[msg.sender]-=_amount;
    }

    function getRewards(address _address) public view{
        uint currentReward=unclaimedRewards(_address);
        uint updateTime=lastUpdateTime[_address];
        uint newReward=(block.timestamp-updateTime)*balances[address];
        return currentReward+newReward;


    }

    function claimRewards() public{
        uint currentReward=unclaimedRewards(_address);
        uint updateTime=lastUpdateTime[_address];
        uint newReward=(block.timestamp-updateTime)*balances[address];
        unclaimedRewards[msg.sender]=0;
        lastUpdateTime[msg.sender]=blocl.timestamp;

    }

    function balanceOf(address _address) public view returns (uint){
        return balances[_address];
    }
}

