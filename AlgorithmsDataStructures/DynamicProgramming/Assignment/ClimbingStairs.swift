//
//  ClimbingStairs.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-16.
//

import Foundation

//1. define the subproblem
//d[n] = # of distict ways to reach the top for n stairs
//d[1] = 1
//d[2] = 2
//...
//2. guess (find the range)
//: let's see how it ends...
//- there are only 2 ways to reach the top
//d[n-2]
//d[n-1]
//3. recurrence
//d[n] = d[n-1] + d[n-2]

//class Solution {
//    public int climbStairs(int n) {
//        if (n <= 2) {
//            return n;
//        }
//        int[] d = new int[n + 1];
//        d[1] = 1;
//        d[2] = 2;
//        for (int i = 3; i <= n; i++) {
//            d[i] = d[i-1] + d[i-2];
//        }
//        return d[n];
//    }
//}
