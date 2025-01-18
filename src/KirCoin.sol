//SPDX-License-Identifier:MIT
pragma solidity ^0.8.28;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KirCoin is ERC20{
    address stakingContract;
    address owner;

    constructor(address _stakingContract) ERC20("Kir","KIR"){
        stakingContract=_stakingContract;
        owner=msg.sender;

    }
    function mint(address account,uint256 amount) public{
        require(msg.sender==stakingContract);
        _mint(account,value);
    }
    function updateStakingContract(address _stakingContract){
        require(msg.sender==owner);
        stakingContract=_stakingContract;
    }
}

