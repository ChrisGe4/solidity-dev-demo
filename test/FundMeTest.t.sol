// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        // fundMe = new FundMe();
        fundMe = new DeployFundMe().run();
    }

    function testMinimumDollar() public {
        emit log_named_decimal_uint("MINIMUM_USD", fundMe.MINIMUM_USD(), 18);
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        // //cannot use msg.sender as the test calls the function directly
        // assertEq(address(this), fundMe.i_owner());
        assertEq( fundMe.i_owner(),msg.sender);
    }
}
