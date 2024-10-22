// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata _arr) public pure returns (bool) {
        assembly {
            if lt(_arr.length, 2) {mstore(0x0, 1) return(0x0, 32)}

            let prev := calldataload(_arr.offset)
            for {let i := add(_arr.offset, 0x20)} lt(i, add(_arr.offset, mul(_arr.length, 0x20))) { i := add(i, 0x20) } {
                let curr := calldataload(i)
                if lt(curr, prev) {mstore(0x0, 0) return(0x0, 32)}
                prev := curr
            }

            mstore(0x0, 1)
            return(0x0, 32)
        }
    }
}
