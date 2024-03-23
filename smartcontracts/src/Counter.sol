// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Counter {
    uint256 public number;
    string public nameCounter;
   
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
