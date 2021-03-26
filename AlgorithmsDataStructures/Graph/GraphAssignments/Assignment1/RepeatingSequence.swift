//
//  RepeatingSequence.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-25.
//

import Foundation

func repeatSequence() {
    
    let firstLine = readLine()!.split(separator: " ")
    var A = Int(firstLine[0])!
    let p = Int(firstLine[1])!
    var temp: [Int]
    let firstNum = A
    var stack: [Int] = [firstNum]
    
    while true {
        temp = []
        while A != 0 {
            temp.insert(A % 10, at: 0)
            A /= 10;
        }
        
        var sum = 0
        for i in temp {
            let res = Int(pow(Double(i), Double(p)))
            sum += res
        }
        stack.append(sum)
        
        if checkDuplicate(sum, stack) {
            let firstIndex = stack.firstIndex(of: sum)
            print(firstIndex!)
            break
        }
        A = sum
    }
}

// Check if there is duplicate element in array called "stack"
func checkDuplicate(_ sum: Int, _ stack: [Int]) -> Bool {

    for j in 0..<stack.count - 1 {
        if sum == stack[j] {
            return true
        }
    }
    return false
}
