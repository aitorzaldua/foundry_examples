// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/StakeContract.sol";
import "../src/mocks/MockERC20.sol";

contract StakeContractTest is Test {

    StakeContract public stakeContract;
    MockERC20 public token;
    //uint256 public constant AMOUNT = 1e18; //1 token
    function setUp() public {
        stakeContract = new StakeContract();
        token = new MockERC20();
    }

    function testStakingTokens(uint16 amount) public {
        token.approve(address(stakeContract), amount);
        bool success = stakeContract.stake(address(token), amount);
        assertTrue(success);
    }
}
