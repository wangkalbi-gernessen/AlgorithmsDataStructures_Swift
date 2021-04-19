////
////  FindTheCity.swift
////  AlgorithmsDataStructures
////
////  Created by Kazunobu Someya on 2021-04-18.
////
//
//import Foundation
//
//class Solution {
//    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
//        // array of dist
//        var dist = Array(repeating: Array(repeating: Int.max, count: n), count: n)
//
//        for edge in edges {
//            dist[edge[0]][edge[1]] = edge[2]
//            dist[edge[1]][edge[0]] = edge[2]
//        }
//
//        for k in 0..<n {
//            for i in 0..<n {
//                for j in 0..<n {
//                    if i == j {
//                        dist[i][j] = 0
//                    }
//                    // detect shortest path from source to destination
//                    // https://stackoverflow.com/questions/34110552/floyd-warshall-algorithm
//                    if dist[i][k] != Int.max && dist[k][j] != Int.max && dist[i][j] > (dist[i][k] + dist[k][j]) {
//                        dist[i][j] = dist[i][k] + dist[k][j]
//                    }
//                }
//            }
//        }
//        print(dist)
//
//        var dict = [Int:Int]()
//
//        for u in 0..<dist.count {
//            var count = 0
//            for v in 0..<dist[u].count {
//                if dist[u][v] == 0 {
//                    continue
//                }
//
//                if dist[u][v] <= distanceThreshold {
//                    count += 1
//                }
//            }
//            dict[u] = count
//        }
//
//        print(dict)
//
//        let sortedByCount = dict.sorted { $0.value < $1.value || ($0.value == $1.value && $0.key > $1.key) }.filter { $0.value != Int.max }
//        print(sortedByCount)
//        return sortedByCount[0].key
//    }
//}
