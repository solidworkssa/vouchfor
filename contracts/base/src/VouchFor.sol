// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VouchFor Contract
/// @notice Social vouching and trust network graph.
contract VouchFor {

    mapping(address => mapping(address => bool)) public vouches;
    mapping(address => uint256) public vouchCount;
    
    function vouch(address _for) external {
        require(!vouches[msg.sender][_for], "Already vouched");
        vouches[msg.sender][_for] = true;
        vouchCount[_for]++;
    }
    
    function unvouch(address _for) external {
        require(vouches[msg.sender][_for], "Not vouched");
        vouches[msg.sender][_for] = false;
        vouchCount[_for]--;
    }

}
