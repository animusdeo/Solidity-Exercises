// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Fibonacci {
    /*
        This exercise assumes you understand what Fibonacci sequence is.
        1. Function `fibonacci` takes a uint256 as argument and returns nth fibonacci number.
        
        Fibonacci sequence are 0,1,1,2,3,5,8,13,....
        
        calling fibonacci(6) would return 8, because the 6th Fibonacci number is 8.
    */

    function fibonacci(uint256 _position) public pure returns (uint256) {
        assembly {
            let a := 0
            if eq(_position, 0) {mstore(0x0, a) return (0x0, 32)}
            let b := 1

            for {let i := 2} lt(i, add(_position, 1)) { i := add(i, 1)} {
                let temp := b
                b := add(a, b)
                a := temp
            }

            mstore(0x0, b)

            return(0x0, 32)
        }
    }
}
