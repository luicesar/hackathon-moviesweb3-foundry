// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
        counter.setNameCounter("Luis Cesar");
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

   function testFuzz_SetNameCounter(string memory y) public {
        counter.setNameCounter(y);
        assertEq(counter.nameCounter(), y);
    }

    function testFuzz_GetNameCounter() public {
        string memory name = counter.getNameCounter();
        assertEq(name, "Luis Cesar");
        emit log_named_string("The value is ", name);
    }
}
