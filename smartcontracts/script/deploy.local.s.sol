// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract Local is Script {

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        Counter counter = new Counter();
        counter.setNumber(0);
        counter.setNameCounter("Luis Cesar");
        vm.stopBroadcast();
        // vm.broadcast();
    }
}
