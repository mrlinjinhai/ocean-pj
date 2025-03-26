// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract Owned{
    
//     address payable owner;
//     constructor() {
//         owner = payable (msg.sender);
//     }
// }

// contract Emmittable is Owned {
//     event Emitted();
//     function emitEvent() virtual public {
//         if(msg.sender == owner){
//            emit Emitted();
//         }
//     }
// }

// abstract contract Config{
//     function loopup(uint id) public virtual returns(address adr);
// }

// abstract contract NameReg{
//     function register(bytes32 name) public virtual;
//     function unregister() public virtual; 
// }

// contract Named is Owned, Emmittable{
//     constructor(bytes32 name){
//         Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
//         NameReg(config.loopup(1)).register(name);
//     }

//     function emitEvent() public virtual override {
//          if (msg.sender == owner) {
//             Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
//             NameReg(config.lookup(1)).unregister();
//             // 仍然可以调用特定的重写函数。
//             Emmittable.emitEvent();
//         }

//     }
// }


// abstract contract Feline {
//     function utterance() public virtual returns (bytes32);
// }

// contract Cat is Feline {
//     function utterance() public pure override returns (bytes32) {
//         return "miaow";
//     }
// }

struct Data {
    mapping(uint => bool) flags;
}

library Set{

    function insert(Data storage self,uint value) public returns(bool){
        if(self.flags[value]){
            return false;
        }
        self.flags[value] = true;
        return true;      
    }

    function remove(Data storage self, uint value) public returns(bool) {
        if(!self.flags[value]){
           return false;  
        }
        self.flags[value] = false;
        return true;
    }

    function contains(Data storage self,uint value) public view returns(bool) {
        return self.flags[value];
    }
}

contract C {
    Data knownValues;

    function register(uint value) public {
        require(Set.insert(knownValues,value));
    }
}