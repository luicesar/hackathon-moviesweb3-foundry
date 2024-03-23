// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    string public nameCounter;

    // constructor(uint256 _number){
    //     number = _number;
    // }
    
    
    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function setNameCounter(string memory newNameCounter) public {
        nameCounter = newNameCounter;
    }

   function getNameCounter() public view returns (string memory) {
        return nameCounter;
    }
}
