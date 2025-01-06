# Objective-C Delegate Pattern Memory Management Bug

This repository demonstrates a common Objective-C bug related to memory management in delegate patterns.  The bug occurs when an object passed to a delegate method is not retained by the delegate and is deallocated prematurely, causing crashes or unexpected behavior.

The `bug.m` file contains the buggy code, and `bugSolution.m` provides a corrected version.

## Bug Description

A `MyObject` is created and passed to the delegate's method without being retained.  This leads to a dangling pointer and potential crashes. 

## Solution

The solution involves retaining `myObject` within the delegate method or ensuring that the delegate's implementation is designed to handle potential deallocations.

## How to reproduce the bug

1. Compile and run the code in `bug.m`.
2. Observe the crash or unexpected behavior.

## How to fix the bug

1. Refer to `bugSolution.m` for the corrected code.
2.  Properly retain the object within the delegate method.