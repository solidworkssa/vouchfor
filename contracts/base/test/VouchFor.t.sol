// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/VouchFor.sol";

contract VouchForTest is Test {
    VouchFor public c;
    
    function setUp() public {
        c = new VouchFor();
    }

    function testDeployment() public {
        assertTrue(address(c) != address(0));
    }
}
