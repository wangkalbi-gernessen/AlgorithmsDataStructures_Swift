//
//  TopologicalSorting.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-06.
//

import Foundation

func topologicalSort() {
  
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let N = firstLine[0] // vertices
  let M = firstLine[1] // edges
  var adj = [[Int]](repeating: [Int](), count: N + 1)
  var indegree = [Int](repeating: 0, count: N + 1)
  
  
  for _ in 0..<M { // M edges
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    // create adjacent list
    adj[u].append(v) // DAG
    // create array for the number of indegree to each vertex
    indegree[v] += 1
  }
  
  // Topological Sort - using BFS (Queue)
  let q = Queue<Int>()
  for v in 1...N {
    if indegree[v] == 0 {
        q.enqueue(v)
    }
  }
    print(q)
  
  // BFS O(V + E)
  while !q.isEmpty() {
    let u = q.dequeue()!
    print(u)
    
    
    for v in adj[u] {
      indegree[v] -= 1 // decrement indegree of all connected vertices from u
      if indegree[v] == 0 {
        q.enqueue(v)
      }
    }
  }
}
