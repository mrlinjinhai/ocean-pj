// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// contract DeleteExample {
//     uint data;
//     uint[] dataArray;

//     function f() public {
//         // uint x = data;
//         // delete x;
//         // delete data;
//         // uint[] storage y = dataArray;
//         // delete dataArray;
//         // assert(y.length == 0);

//         // uint8 y;
//         // uint16 z;
//         // uint32 x = y + z;
//         // delete x;
//         // delete data;

//         // int y = -3;
//         // uint x = uint(y);

//         // uint32 a = 0x12345678;
//         // uint16 b = uint16(a);
        
//         // uint16 a = 0x1234;
//         // uint32 b = uint32(a);
//         // assert(a == b);


//     }
// }

// contract C{

// //    bytes s = "abcdefgh";
// //    function f(bytes calldata c,bytes memory m) public view returns (bytes16, bytes3){
// //        require(c.length == 16,"");
// //        bytes16 b = bytes16(m);
// //    }

// //   uint8 a = 12;
// //   uint32 b = 1234;
// //   uint16 c = 0x1234;

//      mapping(uint => uint) data;
//      function f() public {
//         set({key:2,value:3});
//      }

//      function set(uint key, uint value) public {
//          data[key] = value;  
//      }

// }

// contract D {
//     uint public x;
//     constructor(uint a) payable {
//         x = a;
//     }
// }

// contract C {
//     D d = new D(4);
//     function createD(uint arg) public {
//         D newD = new D(arg);
//         newD.x()
//     }
// }

// contract C {
//     uint index;
//     function f() public pure returns (uint,bool,uint){
//         return (7,true,2);
//     }

//     function g() public {
//         (uint x,,uint y) = f();
//         (x,y) = (y,x);
//         (index, ,) = f();
//     }
// }

// contract C {
    
//     uint private data;

//     function f(uint a) private pure returns (uint b) { return  a + 1; }

//     function setData(uint a) public { data = a;}

//     function getData() public  view returns (uint) { 
//         return data;
//     }  

//     function compute(uint a, uint b) internal pure returns (uint) {
//         return  a + b;
//     }
// }

// contract D {
//     function readData() public {
//         C c = new C();
//         uint local = c.f(7);
//         c.setData(3);
//         local = c.getData();
//         local = c.compute(3,5);
//     }
// }

// contract E is C {
//     function g() public {
//           C c = new C();
//           uint val = compute(3, 5);
//     }
// }

// contract owned {

//     address payable owner;

//     constructor() {
//         owner = payable (msg.sender);
//     }

//     modifier onlyOwner {
//         require(msg.sender == owner,"only owner can call this function.");
//         _;
//     }

// }

// contract priced {
//     modifier costs(uint price){
//         if(msg.value >= price){
//             _;
//         }
//     }
// }

// contract Register is priced, owned {
//     mapping (address => bool) registeredAddresses;
//     uint price;
//     constructor(uint initialPrice) {
//         price = initialPrice;
//     }

//     function register() public payable co
// }


// uint constant X = 32 ** 22 + 8;

// contract C {
//     string constant TEXT = "abc";
//     bytes32 constant MY_HASH = keccak256("abc");
//     uint immutable decimals = 18;
//     uint immutable maxBalance;
//     address immutable owner = msg.sender;

//     constructor(uint decimals_, address ref){
//         if(decimals_ != 0){
//             decimals = decimals_;
//         }
//         maxBalance = ref.balance;
//     }

//     function isBalanceTooHigh(address other) public view returns(bool) {
//         return other.balance > maxBalance;
//     }

// }

// contract Simple {
//     function arithmetic(uint a, uint b) public pure returns (uint sum, uint product){
//         return (a+b, a*b)
//     }
// }

// contract Sink {
//     event Received(address, uint);
//     receive() external payable {
//         emit Received(msg.sender, msg.value);
//      }
// }

// contract Test {
//     uint x;
//     fallback() external  {
//         x = 1;
//     }
// }

// contract TestPayable {
//     uint x;
//     uint y;

//     fallback() external payable {
//         x = 1;
//         y = msg.value;
//     }


//     receive() external payable {
//         x = 2;
//         y = msg.value;
//      }
// }

// contract Caller {

//     function callTest(Test test) public returns (bool) {
//         (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
//         require(success);

//         address payable testPayable = payable(address(test));
//         return testPayable.send(2 ether);
//     }


//     function callTestPayable(TestPayable test) public returns (bool) {
//         (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
//         require(success);
//         (success,) = address(test).call{value:1}(abi.encodeWithSignature("nonExistingFunction()"));
//         require(success);

//         (success,) = address(test).call{value: 2 ether}("");
        
//         require(success);
//         return true;
//     }
// }


// error InsufficientBalance(uint256 available, uint256 required);

// contract TestToken {
   
//     mapping (address => uint) balance;
   
//     function transferWithRevertError(address to, uint256 amount) public {
//         if(amount > balance[msg.sender]){
//             revert InsufficientBalance({
//                available: balance[msg.sender],
//                required:amount
//             }); 
//         }
//         balance[msg.sender] -= amount;
//         balance[to] += amount;
//     }

//     function transferWithRequireError(address to, uint256 amount) public {
//         require(amount <= balance[msg.sender],InsufficientBalance(balance[msg.sender],amount));
//         balance[msg.sender] -= amount;
//         balance[to] += amount;
//     }
   
// }