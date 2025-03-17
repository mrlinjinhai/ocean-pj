// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FundToken{
    // 1.通证的名字
    // 2.通证的简称
    // 3.通证发行数量
    // 4.owner 地址
    // 5.balance address => uint256
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;
    address public  owner; 
    mapping(address => uint256) public balances;  
   

    constructor(string memory _tokenName, string memory _tokenSymbol){
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        owner = msg.sender;  
    }

    // mint: 获取通证
    function mint(uint256 amountToMint) public {
       balances[msg.sender] += amountToMint;
       totalSupply += amountToMint;      
    }

    // transfer: transfer 通证
    
    // balanceOf 查看某一个地址通证数量
}