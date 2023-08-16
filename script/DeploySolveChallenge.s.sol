// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SolveChallenge} from "../src/SolveChallenge.sol";

contract DeploySolveChallenge is Script {
    function run() external returns (SolveChallenge solveChallenge) {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        solveChallenge = new SolveChallenge();
        vm.stopBroadcast();
    }
}
