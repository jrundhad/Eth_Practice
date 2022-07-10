pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Apps!!!";
  
  //initialize immutable
  address public immutable ADDR;

  string public greet = "Hello World!";

  //how to declare a constant 
  uint public constant MY_UINT = 123;

  // state variable num 
  uint public num;
  
  //need to send a transaction to change a state variable 
  function set(uint _num) public {
        num = _num;
  }

  // set immutable variable in constructor
  constructor() payable {
    ADDR = msg.sender;
    // what should we do on deploy?

  }

  function setPurpose(string memory newPurpose) payable public {
      require(msg.value >= 10, "pay more Ether to change purpose!"); 
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      emit SetPurpose(msg.sender, purpose);
  }

  uint public timestamp = block.timestamp; // Current block timestamp
  address public sender = msg.sender; // address of the caller

  uint public count;

  // Function to get the current count
  function get() public view  returns (uint){
      return num;
  }

  // Function to increment count by 1
  function inc() public {
      count += 1;
  }

  // Function to decrement count by 1
  function dec() public {
      // This function will fail if count = 0
      count -= 1;
  }

  function foo(uint x) public pure returns (uint) {
    if (x < 10) {
        return 0;
    } else if (x < 20) {
        return 1;
    } else {
        return 2;
    }
  }

  uint[] public arr = [1, 6, 3, 4, 5];
  


  function remove(uint _index) public returns (uint) {
        require(_index < arr.length, "index out of bound");

        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
        uint x = arr[0];
        return x;
    }

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
