// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "./Program.sol";

contract PingPongProgram is Program {
    event Ping(address indexed from, string message);
    event Pong(address indexed from, string message);

    function ping(string calldata message) external {
        emit Ping(msg.sender, message);
    }

    function pong(string calldata message) external {
        emit Pong(msg.sender, message);
    }

    function performStateTransition(bytes32 oldStateHash, bytes32 newStateHash) external override onlyRouter {
        require(stateHash == oldStateHash, "invalid state transition");
        stateHash = newStateHash;
       
    }
}
