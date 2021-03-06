//
//  PartitionLabels.swift
//  SwiftLeetCode
//
//  Created by Kazunobu Someya on 2021-04-08.
//

import Foundation

//class Solution {
//    func partitionLabels(_ S: String) -> [Int] {
//        
//        if S == nil || S.count == 0 {
//            return []
//        }
//        
//        var map = [Int](repeating: 0, count: 26)
//        var result = [Int]()
//        let first = "a".unicodeScalars.first!.value
//        
//        for (index, char) in S.enumerated() {
//            let val = char.unicodeScalars.first!.value
//            map[Int(val-first)] = index
//        }
//        
//        var start = 0
//        var last = 0
//        
//        for (index, char) in S.enumerated() {
//            let val = char.unicodeScalars.first!.value
//            last = max(last, map[Int(val-first)])
//            if index == last {
//                result.append(last - start + 1)
//                start = last + 1
//            }
//        }
//        
//        return result
//    }
//}

/// Leetcode 763
func partitionLabels(_ S: String) -> [Int] {
  // get the rightmost index of each char
  var map = Dictionary<Character, Int>()
  for (i, ch) in S.enumerated() {
    map[ch] = i
  }
  var res = [Int]()
  var (start, end) = (0, 0)
  for (i, ch) in S.enumerated() {
    end = map[ch]! > end ? map[ch]! : end
    if i == end {
      res.append(end - start + 1)
      start = i + 1
    }
  }
  return res
}
