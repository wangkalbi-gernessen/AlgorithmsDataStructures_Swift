//
//  Recursion.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-09.
//

import Foundation

// 1. Power(base, exponent)

func power(base: Int, exponent: Int) -> Int {
    if exponent == 0 {
        return 1
    } else if exponent == 1 {
        return base
    } else {
        return power(base: base, exponent: exponent - 1) * base
    }
}

//func palindrome(_ word: String) -> Bool {
//    
//    if word.count <= 1 {
//        return true
//    } else if word[word.startIndex] == word[word.endIndex] {
////        return palindrome(word[1, word.count - 1])
//        return true
//    } else {
//        return false
//    }
//}

// 3. printBinary
func printBinary(_ n: Int) {
    if n < 0 {
        print("_", terminator: "")
        printBinary(-n)
        //        print()
    } else if n < 2 {
        print(n, terminator: "")
    } else {
        printBinary(n / 2)
        print(n % 2, terminator: "")
    }
}

// 4. reverseLine
func reverseLine(_ line: Int) {
    let contents = try! String(contentsOfFile: "/Users/Angriff/iOS_development/AlgorithmsDataStructures/AlgorithmsDataStructures/Recursion/provinces.txt", encoding: .utf8)
    let lines = contents.split(separator: "\n")
    //    print(lines)
    
    if line < lines.count {
        reverseLine(line + 1)
        print(lines[line])
    }
}


class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 || n == 2 {
            return 1
        }
        return tribonacci(n - 3) + tribonacci(n - 2) + tribonacci(n - 1)
    }
}
