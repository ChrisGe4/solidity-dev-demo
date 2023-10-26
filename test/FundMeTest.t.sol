// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    address USER = makeAddr("USER");   
    uint256 constant SEND_VALUE = 10e18; 
    uint256 constant STARTING_BALANCE = 10 ether; 
    function setUp() external {
        // fundMe = new FundMe();
        fundMe = new DeployFundMe().run();
        // give user some ETH
        vm.deal(USER,STARTING_BALANCE);
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

    function testFundFailWithoutEnoughETH() public{
        // ==assert(this tx fails/reverts)
        // next line should revert!
        vm.expectRevert();

        fundMe.fund(); // SEND 0 VALUE
    }

    function testFundUpdatesFundedData() public {
        vm.prank(USER); // the next TX will be sent by USER
        // note here how to pass the value
        fundMe.fund{value:SEND_VALUE}();
        uint256 amountFunded = fundMe.getAddressToAmountFunded(USER);
        assertEq(amountFunded, 10e18);
    }
}
