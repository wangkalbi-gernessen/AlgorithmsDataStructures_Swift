//
//  Bridges.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-01.
//

import Foundation

func bridges() {

  struct Square {
    let x: Int
    let y: Int
  }

  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]

  var bridgeGirder: [Square] = []
  var result: [Int] = [10000]


  func bfs(square: Square,  _ continent: inout [[Int]]) {
    let q = Queue<Square>()
    q.enqueue(square)

    while !q.isEmpty() {
      let sq = q.dequeue()!
      let x = sq.x
      let y = sq.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0 && ny >= 0 && nx < continent[0].count && ny < continent.count {
          if continent[ny][nx] == 2 {
            q.enqueue(Square(x: nx, y: ny))
            continent[ny][nx] = 1
          }
        }
      }
    }
  }

  func dfs(square: Square, _ continent: inout [[Int]], _ stack: inout [[Bool]]) {
    if result.min()! <= bridgeGirder.count { return }
    stack[square.y][square.x] = true
    for i in 0..<4 {
      let nx = square.x + dx[i]
      let ny = square.y + dy[i]
      if nx < 0 || ny < 0 || nx >= continent[0].count || ny >= continent.count { continue }
      if stack[ny][nx] { continue }
      if continent[ny][nx] == 0 {
        bridgeGirder.append(Square(x: nx, y: ny))
        dfs(square: Square(x: nx, y: ny), &continent, &stack)
        stack[ny][nx] = false
        bridgeGirder.removeLast()
      }
      if continent[ny][nx] == 2 {
        result.append(bridgeGirder.count)
      }
    }
  }
}
