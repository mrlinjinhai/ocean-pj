// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// contract SimpleAuction{
//     function bid() public payable {

//     }
// }

// function helper(uint x) pure returns(uint) {
//     return x * 2;
// }

// contract Purchase{
//     address public seller;
//     modifier onlySeller(){
//         require(msg.sender == seller,"only seller can use");
//         _;
//     }

//     function abort() public view onlySeller{
        
//     }
// }

// event HightestBidIncreased(address bidder,uint amount);

// contract SimpleAuction1{

//     function bid() public payable {
//         emit HightestBidIncreased(msg.sender,msg.value);
//     }
// }

// error NotEnoughFunds(uint requested,uint available);

// contract Token{
//     mapping (address => uint) balances;
//     function transfer(address to,uint amount) public {
//        uint balance = balances[msg.sender];
//        if(balance < amount){
//            revert NotEnoughFunds(amount,balance);  
//        }
//        balances[msg.sender] -= amount;
//        balances[to] += amount;    
//     }
// }


// contract Ballot{
//     struct Voter{
//         uint weight;
//         bool voted;
//         address delegate;
//         uint vote;
//     }
// }

// contract Purchase{
//     enum State{
//         Created,
//         Locked,
//         Inactive
//     }
//     event PrintMessage(string message);

//     function test() public {
//         address payable x = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
//         string memory a = unicode"打击";
//         emit PrintMessage(a);
//         address myAddress = address(this);
//             if(x.balance < 10 && myAddress.balance >=10){
//             x.transfer(10);
//         }
//     }
   

// }

// contract test{
//     enum ActionChoices { GoLeft,GoRight,GoStraight,SitStill}
//     ActionChoices choice;
//     ActionChoices constant defaultChoice = ActionChoices.GoStraight;

//     function setGoStraight() public {
//         choice = ActionChoices.GoStraight;
//     }

//     function getChoice() public view returns(ActionChoices) {
//         return choice;
//     }  

//     function getDefaultChoice() public pure returns (uint) {
//         return uint(defaultChoice);
//     }

//     function getLargestValue() public pure returns (ActionChoices){
//         return type(ActionChoices).max;
//     }

//     function getSmallestValue() public pure returns (ActionChoices){
//         return type(ActionChoices).min;
//     }
// }

// contract Example {
//     function f() public payable returns (bytes4) {
//         assert(this.f.address == address(this));
//         return this.f.selector;
//     }

//     function g() public {
//         this.f{gas:10,value:100}();
//     }
// }


// library ArrayUtils{
//     function map(uint[] memory self,function (uint) pure returns (uint) f) internal pure returns (uint[] memory r){
//         r = new uint[](self.length);
//         for(uint i =0; i < self.length;i++){
//             r[i] = f(self[i]);
//         }
//     }

//     function reduce(uint[] memory self,function (uint,uint) pure returns (uint) f) internal pure returns (uint r){
//         r = self[0];
//         for(uint i= 1; i< self.length;i++){
//             r = f(r,self[i]);
//         }
//     }

//     function range(uint lenght) internal pure returns (uint[] memory r){
//         r = new uint[](lenght);
//         for(uint i=0; i < r.length;i++){
//            r[i] = i;
//         }
//     }
// }

// contract Pyramid {
//     using ArrayUtils for *;
//     function pyramid(uint l) public pure returns (uint){
//         return ArrayUtils.range(l).map(square).reduce(sum);
//     }
     
//     function square(uint x) internal pure returns (uint) {
//         return x * x;
//     } 

//     function sum(uint x, uint y) internal pure returns (uint) {
//         return x * y;
//     }
// }

// contract Oracle{
//     struct Request{
//         bytes data;
//         function(uint) external callback;
//     }
    
//     Request[] private requests;
//     event NewRequest(uint);

//     function query(bytes memory data, function(uint) external callback) public {
//         requests.push(Request(data,callback));
//         emit NewRequest(requests.length - 1);
//     }

//     function reply(uint requireID,uint response) public {
//         requests[requireID].callback(response);
//     }
// }

// contract OracleUser{
//     Oracle constant private ORACLE_CONST = Oracle(address(0x00000000219ab540356cBB839Cbe05303d7705Fa));
//     uint private exchangeRate;

//     function buySomething() public {
//         ORACLE_CONST.query("USD",this.oracleResponse);
//     }

//     function oracleResponse(uint response) public {
//        require(msg.sender == address(ORACLE_CONST),"Only oracle can call this.");
//        exchangeRate = response;    
//     }
// }

// contract C {
//     uint[] x;

//     function f(uint[] memory memoryArray) public {
//         x =memoryArray;
//         uint[] storage y = x;
//         y[7];
//         y.pop();
//         delete x;
//         g(x);
//         h(x);
//     }

//     function g(uint[] storage z) internal pure {}

//     function h(uint[] memory m) internal pure {}
// }

// contract C {
//     string s = "Storage";

//     function f(bytes calldata bc,string memory sm, bytes16 b) public view {
//         string memory concatString = string.concat(s,string(bc),"Literal",sm);
//         assert((bytes(s).length + bc.length + 7 + bytes(sm).length) == bytes(concatString).length);


//     }

//     function m(uint len) public pure {
//         uint[] memory a = new uint[](7);
//         bytes memory b = new bytes(len);
//         assert(a.length == 7);
//         assert(b.length == len);
//         a[6] = 8;
//     }
    

//     function z() public pure {
//         uint[] memory x = new uint[](3);
//         x[0] = 1;
//         x[1] = 2;
//         x[2] = 3;
//     }
// }

// contract ArrayContract{
//     uint[2**20] aLotOfIntegers;

//     bool[2][] pairsOfFlags;

//     function setAllFlagPairs(bool[2][] memory newPairs) public {
//         pairsOfFlags = newPairs;
//     }

//     struct StructType{
//         uint[] contents;
//         uint moreInfo;
//     }

//     StructType s;

//     function f(uint[] memory c) public {
//         StructType storage g = s;
//         g.moreInfo = 2;
//         g.contents = c; 
//     }

//     function setFlagPair(uint index,bool flagA,bool flagB) public {
//        pairsOfFlags[index][0] = flagA;
//        pairsOfFlags[index][1] = flagB;     
//     }

//     function changeFlagArraySize(uint newSize) public {
//         if(newSize < pairsOfFlags.length){
//               while (pairsOfFlags.length > newSize)
//                pairsOfFlags.pop();     
//         }else if(newSize > pairsOfFlags.length){
//               while (pairsOfFlags.length < newSize)
//                pairsOfFlags.push(); 
//         }
//     }

//     function clear() public {
//         delete pairsOfFlags;
//         delete aLotOfIntegers;
//         pairsOfFlags = new bool[2][](0);
//     }

//     bytes byteData;

//     function byteArrays(bytes memory data) public {
//         byteData = data;
//         for(uint i = 0; i< 7;i++){
//            byteData.push();
//         }
//         byteData[3] = 0x08;
//         delete byteData[2];
//     }

//     function addFlag(bool[2] memory flag) public returns(uint){
//         pairsOfFlags.push(flag);
//         return pairsOfFlags.length;
//     }


//     function createMemoryArray(uint size) public pure returns (bytes memory){
//         uint[2][] memory arrayOfPairs = new uint[2][](size);

//         arrayOfPairs[0] = [uint(1),2];

//         bytes memory b = new bytes(200);

//         for(uint i =0; i < b.length; i++){
//             b[i] = bytes1(uint8(i)); 
//         }
        
//         return b;
//     }

// }

// contract Proxy{
//     address client;
//     constructor(address client_){
//        client = client_;
//     }

//     function forward(bytes calldata payload) external {
//         bytes4 sig = bytes4(payload[:4]);
//         if(sig == bytes4(keccak256("setOwner(address)"))){
//            address owner = abi.decode(payload[4:], (address)); 
//            require(owner != address(0),"Address of owner cnnot be zero.");
//         }
//         (bool status,) = client.delegatecall(payload);
//         require(status,"Forwarded call failed."); 
//     }
// } 

// struct Funder {
//     address addr;
//     uint amount;
// }

// contract CrowdFunding {
//     struct Campaign {
//         address payable beneficiary;
//         uint fundingGoal;
//         uint numFunders;
//         uint amount;
//         mapping(uint => Funder) funders;
//     }

//     uint numCampaigns;
//     mapping(uint => Campaign) campaigns;

//     function newCampaign(address payable beneficiary, uint goal) public returns (uint campaignID) {
//         campaignID = numCampaigns++;
//         Campaign storage c = campaigns[campaignID];
//         c.beneficiary = beneficiary;
//         c.fundingGoal = goal;
//     }

//     function contribute(uint campaignID) public payable {
//         Campaign storage c = campaigns[campaignID];
//         c.funders[c.numFunders++] = Funder({addr:msg.sender,amount:msg.value});
//     }

//     function checkGoalReached(uint campaignID) public returns(bool reached) {
//         Campaign storage c = campaigns[campaignID];
//         if(c.amount < c.fundingGoal){
//            return false;
//         }
//         uint amount = c.amount;
//         c.amount = 0;
//         c.beneficiary.transfer(amount);
//         return false;
//     } 
// }


// contract MappingExample{
//     mapping(address => uint) public balances;
//     function update(uint newBalance) public {
//         balances[msg.sender] = newBalance;
//     }
// }

// contract MappingUser{
//     function f() public returns (uint) {
//         MappingExample m = new MappingExample();
//         m.update(100);
//         return m.balances(address(this));
//     }
// }

// contract MappingExample{
//     mapping(address => uint256) private _balances;
//     mapping(address => mapping(address => uint256)) private _allowances;

//     event Transfer(address indexed from, address indexed to, uint256 value);
//     event Approval(address indexed  owner, address indexed spender, uint256 value);

//     function allowance(address owner,address spender) public view returns (uint256){
//         return _allowances[owner][spender];
//     }

//     function transferFrom(address sender,address recipient,uint256 amount) public returns (bool) {
//         require(_allowances[sender][msg.sender] > amount,"ERC20: Allowance not high enough.");
//         _allowances[sender][msg.sender] -= amount;
//         _transfer(sender, recipient, amount);
//         return true;
//     }

//     function approve(address spender,uint256 amount) public returns (bool){
//         require(spender != address(0),"ERC20: approve to the zero address");
//         _allowances[msg.sender][spender] = amount;
//         emit Approval(msg.sender, spender, amount);
//         return true;
//     }

//     function _transfer(address sender, address recipient,uint256 amount) internal {
//         require(sender != address(0),"ERC20: transfer from the zero address");
//         require(recipient != address(0),"ERC20: transfer to the zero address");
//         require(_balances[sender] >= amount, "ERC20: Not enough funds.");
//         _balances[sender] -= amount;
//         _balances[recipient] += amount;
//         emit Transfer(sender, recipient, amount);
//     }
// }

struct IndexValue { uint keyIndex; uint value;}
struct KeyFlag { uint key; bool deleted;}

struct itmap {
    mapping(uint => IndexValue) data;
    KeyFlag[] keys;
    uint size;
}

type Iterator is uint;

library IterableMapping {
    function insert(itmap storage self, uint key, uint value) internal returns(bool replaced){
        uint keyIndex = self.data[key].keyIndex;
        self.data[key].value = value;
        if(keyIndex > 0){
           return true;
        }else{
           keyIndex = self.keys.length;
           self.keys.push();
           self.data[key].keyIndex = keyIndex + 1;
           self.keys[keyIndex].key = key;
           self.size++;
           return false; 
        }

    }

    function remove(itmap storage self, uint key) internal returns (bool success) {
        uint keyIndex = self.data[key].keyIndex;
        if(keyIndex == 0){
           return false;
        }
        delete self.data[key];
        self.keys[keyIndex - 1].deleted = true;
        self.size --;
    }

    function contains(itmap storage self,uint key) internal view returns(bool){
        return self.data[key].keyIndex > 0;
    }

    function iterateStart(itmap storage self) internal view returns (Iterator){
       return iteratorSkipDeleted(self, 0);  
    }

    function iterateValid(itmap storage self, Iterator iterator) internal view returns(bool) {
        return Iterator.unwrap(iterator) < self.keys.length;
    }

    function iterateNext(itmap storage self, Iterator iterator) internal view returns (Iterator){
        return iteratorSkipDeleted(self, Iterator.unwrap(iterator)+1);
    }

    function iterateGet(itmap storage self, Iterator iterator) internal view returns (uint key,uint value) {
        uint keyIndex = Iterator.unwrap(iterator);
        key = self.keys[keyIndex].key;
        value = self.data[key].value;
    }

    function iteratorSkipDeleted(itmap storage self, uint keyIndex) private view returns (Iterator){
        while (keyIndex < self.keys.length && self.keys[keyIndex].deleted){
            keyIndex ++;
        }
        return Iterator.wrap(keyIndex);
    }
}

contract User{
    itmap data;

    using IterableMapping for itmap;

    function insert(uint k, uint v) public returns (uint size) {
        data.insert(k,v);
        return data.size;
    }

    function sum() public view returns (uint s){
        for (Iterator i = data.iterateStart(); data.iterateValid(i); i=data.iterateNext(i)) {
            (,uint value) = data.iterateGet(i);
            s += value;
        }
    }
}