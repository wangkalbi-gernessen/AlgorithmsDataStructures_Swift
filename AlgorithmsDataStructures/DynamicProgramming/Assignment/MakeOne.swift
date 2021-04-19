//
//  MakeOne.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-16.
//

import Foundation

func makeOne() {
    if let num = readLine() {
        if let int = Int(num) {
            // store numbers divided or substracted
            var nums: [Int] = [Int](repeating: 0, count: int + 1)
            var n = int
            nums[0] = n
            var count = 0

            while n > 1 {
                count += 1
                if n % 3 == 2 && n % 2 == 0 {
                    n /= 2
                    nums[count] = n
                } else if n % 3 == 1 {
                    n -= 1
                    nums[count] = n
                } else {
                    n /= 3
                    nums[count] = n
                }
            }
            print(count)
        } else {
            fatalError("Please enter number")
        }
    }
 }
