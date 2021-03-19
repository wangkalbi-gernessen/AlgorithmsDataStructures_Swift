//
//  Topic1.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-17.
//

import Foundation

func runStream() {
    print("Please enter number from 1 to 500: ")
    if let number = readLine() {
        findLargestAndSmallest(Int(number)!)
    } else {
        print("Why are you being so coy?")
    }
}

func findLargestAndSmallest(_ n: Int) {
    
    var result = Set<Int>()
    var index = 0
    // Time Complexity O(n)
    while index < 50 {
        result.insert(Int.random(in: 1...n))
        index += 1
    }
    print(result)
    
    
    
}
