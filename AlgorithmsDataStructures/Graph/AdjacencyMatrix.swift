//
//  AdjacencyMatrix.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-23.
//

import Foundation

//func adjacencyMatrixRepresentation() {
//  let firstLine = readLine()!.split(separator: " ")
//  let n = Int(firstLine[0])!
//  let m = Int(firstLine[1])!
//
//  var adjMatrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
//
///// iterate by the number of edges
//  for _ in 0..<m {
//    let edge = readLine()!.split(separator: " ")
//    let u = Int(edge[0])!
//    let v = Int(edge[1])!
//    // displayed on grid or chart
//    adjMatrix[u - 1][v - 1] = 1
//    adjMatrix[v - 1][u - 1] = 1 // undirected graph
//  }
//
//  for row in adjMatrix {
//    print(row)
//  }
//}

// Weighted AdjacencyMatrix
func adjacencyMatrixRepresentation() {
  let firstLine = readLine()!.split(separator: " ")
  let n = Int(firstLine[0])!
  let m = Int(firstLine[1])!
  
  var adjMatrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

/// iterate by the number of edges
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    let w = Int(edge[2])!
    // displayed on grid or chart
    adjMatrix[u - 1][v - 1] = w
    adjMatrix[v - 1][u - 1] = w // undirected graph
  }
  
  for row in adjMatrix {
    print(row)
  }
}
