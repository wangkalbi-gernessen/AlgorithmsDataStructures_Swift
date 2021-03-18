//
//  Topic1.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-17.
//

import Foundation

func runStream() {
    print("Please enter number: ")
    
    if let number = readLine() {
        findLargestAndSmallest(Int(number)!)
    } else {
        print("Why are you being so coy?")
    }
}

func findLargestAndSmallest(_ n: Int) {
    let intArray = (1...n).map {$0}
//    print(intArray)
    
    // find the smallest number out of array
    var smallest = 0
    for j in 1..<intArray.count {
        if intArray[smallest] > intArray[j] {
            smallest = j
        }
    }
    print(intArray[smallest])
    
    // find the largest number out of array
    var largest = 0
    for i in 1..<intArray.count {
        if intArray[largest] < intArray[i] {
            largest = i
        }
    }
    print(intArray[largest])
}
