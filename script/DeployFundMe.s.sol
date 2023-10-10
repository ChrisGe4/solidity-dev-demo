// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    FundMe fundMe;

    // function init() public payable {
    //     fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    // }

    // function check() public view returns (bool) {
    //     return address(fundMe) != address(0);
    // }

    function run() external returns (FundMe){
        // Before startBroadcast -> not a "real" tx, won't cost gas
        HelperConfig helperConfig = new HelperConfig();
        (address ethUsdPriceFeed) = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        // real tx, will cost gas
        // mock 
        fundMe = new FundMe (ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}