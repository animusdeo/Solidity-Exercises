// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsPrime {
    /**
     * The goal of this exercise is to return if "number" is prime or not (true or false)
     */
    function isPrime(uint256 _number) public pure returns (bool) {
        assembly {
            if eq(_number, 2)           {mstore(0x0, 1) return(0x0, 32)} // is it 2?
            if iszero(and(_number, 1))  {mstore(0x0, 0) return(0x0, 32)} // is it even?
            for {let i := 3} lt(i, shr(1, _number)) { i := add(i, 2) } { // is it odd?
                if iszero(mod(_number, i)) {
                    mstore(0x0, 0)
                    return(0x0, 32)
                }
            }
            // no divisor found
            mstore(0x0, 1)
            return(0x0, 32)
        }
    }
}
