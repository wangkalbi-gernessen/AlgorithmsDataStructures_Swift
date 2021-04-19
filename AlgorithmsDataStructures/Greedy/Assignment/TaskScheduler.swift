//
//  TaskScheduler.swift
//  SwiftLeetCode
//
//  Created by Kazunobu Someya on 2021-04-08.
//

import Foundation

//class Solution {
//    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
//    //Create a map with frequency of tasks/characters
//    var map: [Character: Int] = [:]
//    for task in tasks {
//    if let value = map[task] {
//        map[task] = value + 1
//    } else {
//        map[task] = 1
//    }
//    }
//
//    // Number of Intervals is decided by most frequent element in dic.
//    let m = map.values.max()!
//
//    // Count elements with maximum frequency in dic.
//    let numsOfMax = map.values.filter({ $0 == m }).count
//
//    // number of intervals = m - 1 => between the 3 As we had to place 2 intervals => m - 1
//    let numsOfIntervals = m - 1
//
//    // Final result = number of intervals * size of each interval + number of elements with maximum frequency items.
//    return max(tasks.count, numsOfIntervals * (n + 1) + numsOfMax)
//
//    }
//}

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
  var frequencies = [Int](repeating: 0, count: 26)
  var maxCount = 0
  var maxFreq = 0
  
  for task in tasks {
    let i = Int(task.asciiValue!) - 65
    frequencies[i] += 1
  }
  
  for freq in frequencies {
    if freq == 0 { continue }
    if maxFreq < freq {
      maxFreq = freq
      maxCount = 1
    } else if maxFreq == freq {
      maxCount += 1
    }
  }
  
  let placeHolderLength = (n + 1) * (maxFreq - 1) + maxCount
  return tasks.count > placeHolderLength ? tasks.count : placeHolderLength
}
