// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";

// Mock on a local anvil chain
// keep track of contract address across different chains
// Sepolia ETH/USD
// mainnet ETH/USD

contract HelperConfig is Script {
    // if on local anvil chain, we deploy mocks
    // otherwise, grab the existing address from the live network
    NetworkConfig public activeNetworkConfig;
    struct NetworkConfig {
        address priceFeed;
    }

    constructor() {
        // global variable
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        return NetworkConfig(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    function getAnvilEthConfig() public returns (NetworkConfig memory) {
 
        // deploy mock
        vm.startBroadcast();

        vm.stopBroadcast();
     }
}
