//
//  TomatoFarm.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-01.
//

import Foundation

func tomatoFarm() {
    // farm with x and y coordinates
    struct Square {
        let x: Int
        let y: Int
    }
    
    // directions for x and y
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    // create Map with the first input, store the initial input
    var farmMap = [[Int]]()
    // process the input
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let m = firstLine[0]
    let n = firstLine[1]
    
    // store data processed
    var ripedMap = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    for _ in 0..<n {
      let rowOpt = readLine()!.map { Int(String($0)) }
        let row = rowOpt.flatMap {$0}
        farmMap.append(row)
    }
    
    // riped -> 1,  unriped -> 0
    func bfs(square: Square, id: Int) {
        let q = Queue<Square>()
        q.enqueue(square)
        // new map with
        ripedMap[square.x][square.y] = id
        
        var count  = 0
        while !q.isEmpty() {
            let sq = q.dequeue()!
            count += 1
            let x = sq.x
            let y = sq.y
            // check left, right, front,back
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if nx >= 0 && nx < n && ny >= 0 && ny < m {
                    if (farmMap[nx][ny] == 1 && ripedMap[nx][ny] == 0) {
                        ripedMap[nx][ny] = id + 1
                        bfs(square: Square(x: nx, y: ny), id: id)
                    } else if (farmMap[nx][ny] == 0 && ripedMap[nx][ny] == 0) {
                        ripedMap[nx][ny] = id + 1
                        bfs(square: Square(x: nx, y: ny), id: id + count)
                    }
                }
                count = 0
            }
        }
    }
    
    // check the unriped place(starting point) using for loop
    var id = 0
    for x in 0..<n {
        for y in 0..<m {
            if farmMap[x][y] == 1 && ripedMap[x][y] == 0 {
                id += 1
                bfs(square: Square(x: x, y: y), id: id)
            }
        }
    }
    
    var minDay = 0
    for x in 0..<n {
        for y in 0..<m {
            if farmMap[x][y] > minDay {
                minDay = farmMap[x][y]
            }
        }
    }
    
    print(ripedMap)
    print(minDay)
}
