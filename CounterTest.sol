// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./Counter.sol";  // Import the Counter contract

contract CounterTest is Counter {

    uint256 public initialCount;

     constructor() {
        initialCount = count;
    }
    // Property 1: Check that count never goes below zero (underflow protection).
    function echidna_count_never_negative() public view returns (bool) {
        return count >= 0;
    }

    // Property 2: Check that incrementing always increases the count.
    function echidna_inc_increases_count() public returns (bool) {
        uint256 preCount = count;
        inc();
        return count == preCount + 1;
    }

    // Property 3: Check that if count is greater than zero, decrementing decreases it.
    function echidna_dec_decreases_count() public returns (bool) {
        if (count > 0) {
            uint256 preCount = count;
            dec();
            return count == preCount - 1;
        }
        return true; // Always return true if count is zero, as dec() should revert.
    }
     // Property 4: test count can be equal to initial count, when inc and dec calls are equal
    function echidna_test_invariant() public returns(bool) {
        return count >= initialCount;
    }
}
