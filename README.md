# Objective-C Nonatomic Property Data Race

This repository demonstrates a common concurrency issue in Objective-C related to the use of `nonatomic` properties and concurrent access.  The `nonatomicBug.m` file showcases the problematic code, while `nonatomicSolution.m` provides a solution using GCD's dispatch barrier.