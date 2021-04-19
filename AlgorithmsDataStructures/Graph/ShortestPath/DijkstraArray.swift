//
//  DijkstraArray.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-13.
//

import Foundation

/// "Edge Relaxation"
/// dist[]: an array of elements representing distance(cost, weight)
/// For each edge (u, v)
///   if dist[v] > dist[u] + w(u, v)
///     dist[v] = dist[u] + w(u, v)

/// Dijkstra's Algorithm (Shortest Path)
/// - Greedy algorithm
func DijkstraArray() {
  struct Edge {
    let to: Int
    let weight: Int
  }
  
  /// All vertices starting from 1 to n
  func dijkstra(_ adj: inout [[Edge]], _ src: Int) -> [Int] {
    let n = adj.count
    
    // create array that initialize the shortest distance or cost to destination.
    var dist = [Int](repeating: Int.max, count: n + 1)
    // create array that represented visited nodes
    var check = [Bool](repeating: false, count: n + 1)
    
    // set first node to start searching the smallest path
    dist[src] = 0
    // set true because src node is visited at first
    check[src] = true
    
    for _ in 0..<n-1 {
      // get the min dist vertex
      var min = Int.max
      var minVertex = 1
      for v in 1...n {
        if !check[v] && dist[v] < min {
          min = dist[v]
          minVertex = v
        }
      }
      // relax all neighbor edges
      check[minVertex] = true
      for edge in adj[minVertex] {
        let to = edge.to
        if dist[to] > dist[minVertex] + edge.weight {
          dist[to] = dist[minVertex] + edge.weight
        }
      }
    }
    return dist
  }
  
  /// * query shortest path
  ///
  /// let shortestPath = dijkstra(...)
  /// print(shortestPath[2]) // shortest path from src to vertex 2
}
