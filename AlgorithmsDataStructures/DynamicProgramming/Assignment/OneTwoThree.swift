//
//  OneTwoThree.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-19.
//

import Foundation

func oneTwoThree() {
    if let num = readLine() {
        if let int = Int(num) {
            var ways: [Int] = [Int](repeating: 0, count: 12)
            // subproblem (base case?)
            ways[1] = 1
            ways[2] = 2
            ways[3] = 4
            
            for i in 4...11 {
                ways[i] = ways[i - 1] + ways[i - 2] + ways[i - 3]
            }
            
            
            print(ways[int])
            
        } else {
            fatalError("Please enter number")
        }
    }
 }
