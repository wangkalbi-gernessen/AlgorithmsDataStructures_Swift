////
////  FindCheapestPrice.swift
////  AlgorithmsDataStructures
////
////  Created by Kazunobu Someya on 2021-04-15.
////
//
//import Foundation
//
class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var visited = [Bool](repeating: false, count: n)
        var dist = [Int](repeating: Int.max, count: n)
        dist[src] = 0

        // create adjacent list for flights
        var adj = [[(Int, Int)]](repeating: [], count: n)

        for plane in flights {
            adj[plane[0]].append((plane[1], plane[2]))
        }
//        print(adj)

        var queue: [Int] = []
        queue.append(src)

        var stops = 0

        while !queue.isEmpty {
            let u = minimumTime(n, dist, visited)
            queue.removeFirst()
            visited[u] = true

            for edge in adj[u] {
                let to = edge.0
                if dist[u] != Int.max && dist[to] > dist[u] + edge.1 {
                    dist[to] = dist[u] + edge.1

                    if stops == K {
                        if to == dst {
                            return dist[to]
                        }
                    }
                    queue.append(to)
                }
            }
            stops += 1
        }
//        print(dist)
        let filteredDist = dist.filter { $0 != Int.max }

        return filteredDist.count != n ? -1 : dist[2]
    }

    func minimumTime(_ n: Int, _ dist: [Int], _ visited: [Bool]) -> Int {
        var min = Int.max
        var minVertex = 1
        for i in 0..<n {
            if !visited[i] && dist[i] < min {
                min = dist[i]
                minVertex = i
            }
        }
        return minVertex
    }
}
