//
//  NetworkDelayTime.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-14.
//

import Foundation

//class Solution {
//    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
//        var visited = [Bool](repeating: false, count: n+1)
//        var dist = [Int](repeating: Int.max, count: n+1)
//        dist[k] = 0
//        
//        // create adjacent list for flights
//        var adj = [[(Int, Int)]](repeating: [], count: n+1)
//        
//        for time in times {
//            adj[time[0]].append((time[1], time[2]))
//        }
////        print(adj)
//        
//        var queue: [Int] = []
//        queue.append(k)
//        
//        // search all nodes
//        while !queue.isEmpty {
//            let u = minimumTime(adj.count, dist, visited)
//            queue.removeFirst()
//            visited[u] = true
//            
//            for edge in adj[u] {
//                let to = edge.0
//                if dist[u] != Int.max && dist[to] > dist[u] + edge.1 {
//                    dist[to] = dist[u] + edge.1
//                    queue.append(to)
//                }
//            }
//        }
//        
//        let sortedDist = dist.filter { $0 != Int.max }.sorted { $0 > $1 }
//        print(sortedDist)
//        
//        return sortedDist.count != n ? -1 : sortedDist[0]
//    }
//    
//    // get the node with minimum distance from root node
//    func minimumTime(_ n: Int, _ dist: [Int], _ visited: [Bool]) -> Int {
//        var min = Int.max
//        var minVertex = 1
//        for i in 0..<n {
//            if !visited[i] && dist[i] < min {
//                min = dist[i]
//                minVertex = i
//            }
//        }
//        return minVertex
//    }
//}
