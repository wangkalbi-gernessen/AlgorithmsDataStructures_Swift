//
//  MyParent.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-18.
//

import Foundation

// 1. who's my parent
func whosMyParent() {
  // input spec
  let n = Int(readLine()!)!
  // where / how to store the input? (data structure)
  // -> adjacency list
  var adj = [[Int]](repeating: [], count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  
  // first sample input: [[], [6, 4], [4], [5, 6], [1, 2, 7], [3], [3, 1], [4]]
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  // how to solve the problem? (algorithm)
  // search level by level (breadth first search)
  // root is 1
  check[1] = true
  let q = Queue<Int>()
    q.enqueue(1)
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adj[u] {
      if !check[v] {
        check[v] = true
        parent[v] = u
        q.enqueue(v)
      }
    }
  }
  // output spec
  for i in 2...n {
    print(parent[i])
  }
}
