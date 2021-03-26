//
//  CyclicPermutation.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-25.
//

import Foundation

func createGraph() {
    // create array of all nodes
    let firstLine = readLine()!.split(separator: " ")
    
    var adjList = [[Int]](repeating: [], count: firstLine.count + 1)
    
    for index in 0..<firstLine.count {
        adjList[index + 1].append(Int(firstLine[index])!)
    }
//    print(adjList)
    
    var visited = [Bool](repeating: false, count: firstLine.count + 1)
    var stack:[Int] = []
    var cyclicCount = 0
    
    for i in 1..<adjList.count {
        let nodeVal = adjList[i][0]
        if !visited[nodeVal] {
            stack.append(nodeVal)
            visited[nodeVal] = true
            
            //            dfs(nodeVal, stack, adjList, visited)
            while !stack.isEmpty {
                let vertex = stack.removeLast()
//                print(vertex)
                
                for v in adjList[vertex] {
                    if !visited[v] {
                        stack.append(v)
                        visited[v] = true
                    } else {
                        break
                    }
                }
            }
            cyclicCount += 1
        }
    }
    
    print(cyclicCount)
}
