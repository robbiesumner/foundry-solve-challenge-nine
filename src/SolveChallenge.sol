// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {LessonNine} from "./LessonNineInterface.sol";
import {IERC721Receiver} from "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract SolveChallenge is IERC721Receiver, Ownable {
    address constant LESSON_NINE = 0xdF7cdFF0c5e85c974D6377244D9A0CEffA2b7A86; // arbitrum address

    function solveChallenge(string memory twitterHandle) external {
        uint256 correctAnswer = uint256(
            keccak256(
                abi.encodePacked(
                    address(this),
                    block.prevrandao,
                    block.timestamp
                )
            )
        ) % 100000;
        LessonNine(LESSON_NINE).solveChallenge(correctAnswer, twitterHandle);
    }

    function onERC721Received(
        address /*operator*/,
        address /*from*/,
        uint256 tokenId,
        bytes calldata /*data*/
    ) external override returns (bytes4) {
        IERC721(msg.sender).safeTransferFrom(address(this), owner(), tokenId);
        return IERC721Receiver.onERC721Received.selector;
    }
}
