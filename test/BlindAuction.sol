// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
// 导入 console.log 功能 
import "hardhat/console.sol";
contract BlindAuction {
    struct Bid {
        bytes32 blindedBid;
        uint deposit;
    }
    
    address payable public beneficiary;
    uint public biddingEnd;
    uint public revealEnd;
    bool public ended;

    mapping(address => Bid[]) public bids;

    address public highestBidder;
    uint public highestBid;

    mapping(address => uint) pendingReturns;

    event AuctionEnded(address winner, uint highestBid);


    error TooEarly(uint time);

    error TooLate(uint time);

    error AuctionEndAlreadyCalled();


    modifier onlyBefore(uint time) {
        if(block.timestamp >= time) revert TooLate(time);
        _;
    }

    modifier onlyAfter(uint time){
        if(block.timestamp <= time) revert TooEarly(time);
        _;
    }

    constructor(uint biddingTime, uint revealTime, address payable beneficiaryAddress){
         beneficiary = beneficiaryAddress;
         biddingEnd = block.timestamp + biddingTime;
         revealEnd = biddingEnd + revealTime;
         console.log("constructor",biddingEnd,revealEnd);
    }

    function bid(bytes32 blindedBid) external payable onlyBefore(biddingEnd){
           bids[msg.sender].push(Bid({
              blindedBid:blindedBid,
              deposit:msg.value
           }));
    }

    /**
    * @dev 生成盲拍出价的哈希承诺
    * @param value 出价金额（单位：wei）
    * @param fake 是否为虚假出价（true表示虚假出价）
    * @param secret 用户的秘密值（至少8字节，建议使用bytes32而不是string）
    * @return 盲拍哈希值
    */
    function generateBlindedBid(uint256 value,bool fake, bytes32 secret) external pure returns(bytes32) {
      require(value > 0, "Bid value must positive"); 
      require(secret != bytes32(0), "Secret cannot be empty"); 
      bytes32 blindedBid1 = keccak256(abi.encodePacked(value,fake,secret));
      return blindedBid1;
    }

    /**
    * @dev 验证盲拍出价
    * @param blindedBid 之前生成的盲拍哈希
    * @param value 要验证的出价金额
    * @param fake 要验证的虚假出价标志
    * @param secret 要验证的秘密值
    * @return 是否验证通过
    */
    function verifyBlindedBid(
        bytes32 blindedBid,
        uint256 value,
        bool fake,
        bytes32 secret
    ) public pure returns (bool){
        require(value > 0, "Bid value must be positive");
        require(secret != bytes32(0), "Secret cannot be empty");
        bytes32 computedHash = keccak256(abi.encodePacked(value,fake,secret));
        return blindedBid == computedHash;
    }
}