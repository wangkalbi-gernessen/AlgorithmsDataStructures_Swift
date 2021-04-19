//
//  TwoCityScheduling.swift
//  SwiftLeetCode
//
//  Created by Kazunobu Someya on 2021-04-08.
//

import Foundation

//class Solution {
//    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
//        let split = costs.count / 2
//        let sorted = costs.sorted { abs($0[0] - $0[1]) > abs($1[0] - $1[1]) }
//        var minimumTotal = 0
//        var countA = 0
//        var countB = 0
//        
//        for i in 0..<sorted.count {
//            if sorted[i][0] > sorted[i][1] {
//                if countB != split {
//                    minimumTotal += sorted[i][1]
//                    countB += 1
//                } else {
//                    minimumTotal += sorted[i][0]
//                    countA += 1
//                }
//            } else {
//                if countA != split {
//                    minimumTotal += sorted[i][0]
//                    countA += 1
//                } else {
//                    minimumTotal += sorted[i][1]
//                    countB += 1
//                }
//            }
//        }
//        return minimumTotal
//    }
//}

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
  var sumA = 0
  var diffs = [Int]()
  for cost in costs {
    sumA += cost[0]
    diffs.append(cost[1] - cost[0])
  }
  
  diffs.sort() // O(N lgN)
  for diff in diffs[0..<diffs.count/2] {
    sumA += diff
  }
  return sumA
}
