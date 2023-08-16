// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {SolveChallenge} from "../src/SolveChallenge.sol";
import {DeploySolveChallenge} from "../script/DeploySolveChallenge.s.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract SolveChallengeTest is Test {
    SolveChallenge solveChallenge;
    IERC721 foundryNFT = IERC721(0x39338138414Df90EC67dC2EE046ab78BcD4F56D9); // arbitrum address

    function setUp() external {
        DeploySolveChallenge deploySolveChallenge = new DeploySolveChallenge();
        solveChallenge = deploySolveChallenge.run();
    }

    function testSolveChallengeDoesNotFail() external {
        solveChallenge.solveChallenge("testHandle");
    }

    function testSolveChallengeTranfersNFTToOwner() external {
        // arrange
        uint256 balanceBefore = foundryNFT.balanceOf(solveChallenge.owner());

        // act
        solveChallenge.solveChallenge("testHandle");

        // assert
        uint256 balanceAfter = foundryNFT.balanceOf(solveChallenge.owner());
        assertEq(balanceAfter, balanceBefore + 1);
    }
}
