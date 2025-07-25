// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployMoodNft} from "script/DeployMoodNft.s.sol";
import {MoodNft} from "src/MoodNft.sol";
import {Test, console} from "forge-std/Test.sol";
// import {MintBasicNft} from "../script/Interactions.s.sol";
import {ZkSyncChainChecker} from "lib/foundry-devops/src/ZkSyncChainChecker.sol";

contract DeployMoodNftTest is Test, ZkSyncChainChecker {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConverSVGToURI() public view {
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+PHRleHQgeD0iMCIgeT0iMTUiIGZpbGw9ImJsYWNrIj5IaSEgWW91ciBicm93c2VyIGRlY29kZWQgdGhpczwvdGV4dD48L3N2Zz4=";
        string memory svg =
            '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="500" height="500"><text x="0" y="15" fill="black">Hi! Your browser decoded this</text></svg>';
        string memory actualURI = deployer.svgToImageURI(svg);
        assert(keccak256(abi.encodePacked(actualURI)) == keccak256(abi.encodePacked(expectedUri)));
    }
}
