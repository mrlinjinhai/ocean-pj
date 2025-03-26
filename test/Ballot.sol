// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;
contract Ballot {
    
    struct Voter{
        uint weight;  //记票权重
        bool voted;   
        address delegate;
        uint vote;
    }

    struct Proposal {
        bytes32 name;
        uint voteCount;
    } 
    
    address public chairperon;

    mapping(address => Voter) public voters;

    Proposal[] public proposals;

    constructor(bytes32[] memory proposalNames) {
        chairperon = msg.sender;
        voters[chairperon].weight = 1;

        for(uint i=0; i < proposalNames.length;i++){
           proposals.push(Proposal({
              name:proposalNames[i],
              voteCount:0
           }));
        }
    }

    // 授权 `voter` 对这个（投票）表决进行投票。
    // 只有 `chairperson` 可以调用该函数。
    function giveRightToVote(address voter) external {
        require(msg.sender == chairperon,"Only chairperson can give right to vote.");
        require(!voters[voter].voted,"The voter already voted.");
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }

    /// 把你的投票委托到投票者 `to`。
    function delegate(address to) external {
        Voter storage sender = voters[msg.sender];
        require(sender.weight !=0, "You have no right to vote");
        require(!sender.voted,"You already voted");
        require(to != msg.sender , "Self-delegation is disallowed.");
        while (voters[to].delegate != address(0)){
             to = voters[to].delegate;
             require( to != msg.sender, "Found loop in delegation.");
        }

        Voter storage delegate_ = voters[to];
        require(delegate_.weight >= 1);

        sender.voted = true;
        sender.delegate = to;
        if(delegate_.voted){
            proposals[delegate_.vote].voteCount += sender.weight;
        }else{
            delegate_.weight += sender.weight;
        }
    }

    /// 把你的票(包括委托给你的票)，
    /// 投给提案 `proposals[proposal].name`.
    function vote(uint proposal) external {
       Voter storage sender = voters[msg.sender];
       require(sender.weight != 0 ,"Has no right to vote");
       require(!sender.voted, "Already voted.");
       sender.voted = true;
       sender.vote = proposal;
       proposals[proposal].voteCount += sender.weight;
    }

    /// @dev 结合之前所有的投票，计算出最终胜出的提案
    function winningProposal() public view returns (uint winningProposql_){
       uint winningVoteCount = 0;
       for(uint p = 0; p < proposals.length; p++){
           if(proposals[p].voteCount > winningVoteCount){
                winningVoteCount = proposals[p].voteCount;
                winningProposql_ = p;
           } 
       }
    }

    // 调用 winningProposal() 函数以获取提案数组中获胜者的索引，并以此返回获胜者的名称
    function winnerName() external view returns (bytes32 winnerName_){
        winnerName_ = proposals[winningProposal()].name;
    }
    
     
}