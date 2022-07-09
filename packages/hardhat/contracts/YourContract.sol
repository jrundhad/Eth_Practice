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
      return count;
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

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
