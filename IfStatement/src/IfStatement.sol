// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IfStatement {
    function max(uint256 a, uint256 b) public pure returns (uint256) {
        assembly {
            switch lt(a, b)
            case 0 {mstore(0x0, a)}
            case 1 {mstore(0x0, b)}
            return(0x0, 32)
        }
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        assembly {
            switch gt(a, b)
            case 0 {mstore(0x0, a)}
            case 1 {mstore(0x0, b)}
            return(0x0, 32)
        }
    }
}
