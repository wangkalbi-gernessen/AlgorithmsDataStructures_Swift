//
//  QuickSort.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-12.
//

import Foundation

func sortQuick(_ arr: [Int]) -> [Int] {
    if arr.count == 0 {
        return arr
    }
    // select pivot at first
    let pivot = arr[arr.count - 1]
    // create new array to exclude pivot
    var excludedPivotList = arr
    // exclude pivot from new array
    excludedPivotList.remove(at: arr.count - 1)
    // create two arrays for left and right side
    var smaller: [Int] = [] //left side
    var larger: [Int] = [] //right side
    
    for item in excludedPivotList {
        if item < pivot {
            smaller.append(item)
        } else {
            larger.append(item)
        }
    }
    return sortQuick(smaller) + [pivot] + sortQuick(larger)
}
