// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract HelloWorld {
   
    event Hello(string message);

    function sayHello() public {
        emit Hello("Hello, World!");
    }
}
