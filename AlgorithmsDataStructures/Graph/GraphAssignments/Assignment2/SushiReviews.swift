//
//  SushiReviews.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-28.
//

import Foundation

func reviewSushi() {
    
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    
    let secondLine = readLine()!.split(separator: " ")
    var realSushiPlacecs = [Int]()
    for i in 0..<m {
        let place = Int(secondLine[i])!
        realSushiPlacecs.append(place)
    }
    print("real sushi place:", realSushiPlacecs)
    
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<n-1 {
        let edges = readLine()!.split(separator: " ")
        let u = Int(edges[0])!
        let v = Int(edges[1])!
        adjList[u].append(v)
        adjList[v].append(u)
    }
    adjList.remove(at: adjList.count - 1)
    print("adjList: ", adjList)
    print("adjList count: ", adjList.count)
    
    var trimmed = [[Int]]()
    // keep deleting the edges
    func updateGraph(adjList: inout [[Int]], updatedList: inout [[Int]]) {
        updatedList = adjList
        var removed = [Int]()
        // store the index with a single element
        for i in 0...adjList.count - 1 {
            print("i val: ", i)
            let nodes = adjList[i]
            if nodes.count == 1 &&
                !realSushiPlacecs.contains(i) {
                print("delete index: ", i)
                removed.append(i)
            }
        }
        print("removed: ", removed)
        
        if removed == [] {
            print(updatedList)
            trimmed = updatedList
            return
        }
        
        var count = 0
        var count2 = 0
        // remove by index
        for j in 0..<removed.count {
            print("index: ", removed[j] - count)
            updatedList.remove(at: removed[j] - count)
            count += 1
        }
        // remove edges from deleted element
        for i in 0..<updatedList.count {
            let nodes = updatedList[i]
            print("nodes", nodes)
            for j in 0...nodes.count - 1 {
                print("j: ", j)
                if removed.contains(nodes[j]) {
                    updatedList[i].remove(at: j - count2)
                    count2 += 1
                    print("count2: ", count2)
                }
            }
            count2 = 0
        }
        // update list
        print("updated list: ", updatedList)
        // trim the graph recursively
        var newList = [[Int]]()
        updateGraph(adjList: &updatedList, updatedList: &newList)
    }

    var updatedList = [[Int]]()
    updateGraph(adjList: &adjList, updatedList: &updatedList)
    
    print("trimmedList: ", trimmed)
    
    // search trimmeddiameter
    var distance = 0
    func bfs(node: Int, check: inout [Bool], distances: inout [Int], adjList: inout [[Int]]) {
        let q = Queue<Int>()
        check[node] = true
//        q.enqueue(item: node)
        while !q.isEmpty() {
            let x = q.dequeue()!
            for edge in adjList[x] {
                if !check[edge]{
                    // calc distance here
                    distance += 1
//                    q.enqueue(item: edge)
                    check[edge] = true
                }
            }
        }
    }
    
    let start = 0
    let check = [Bool](repeating:false, count: trimmed.count)
    print("distance: ",distance)
}
