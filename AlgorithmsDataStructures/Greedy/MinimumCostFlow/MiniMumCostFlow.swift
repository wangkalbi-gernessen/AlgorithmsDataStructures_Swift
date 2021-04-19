//
//  MiniMumCostFlow.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-15.
//

import Foundation

func MinimumCostFlow() {
    // get MST here
    func kruskalMST(_ graph: [[graph]]) -> [(u: Int, v: Int, w: Int,x : Bool)] {
        var allEdges = [(u: Int, v: Int, w: Int,x : Bool)]()
        var mstEdges = [(u: Int, v: Int, w: Int,x : Bool)]()
        
        for (u, node) in graph.enumerated() {
            for edge in node {
                allEdges.append((u: u, v: edge.to, w: edge.weight,x : edge.active))
            }
        }
        allEdges.sort { $0.w < $1.w }
        var uf = UnionFind(graph.count)
        for edge in allEdges {
            if uf.connected(edge.u, edge.v) { continue }
            uf.union(edge.u, edge.v)
            mstEdges.append(edge)
        }
        
        return mstEdges
    }
    
    
    struct graph {
        var to : Int
        var weight : Int
        var active : Bool
    }
    
    // read input number here 
    let read = readLine()!.split(separator: " ").map{Int($0)!}
    let enhancer = read[2]
    let inactiveCount = read[0]-1
    var max = 0
    var maxFrom = 0
    var maxBool = false
    
    var count = 0
    
    var maxGraph = graph(to: 0, weight: 0, active: false)
    var arr = [[graph]](repeating: [graph](), count: read[1]+1)
    
    for i in 1...read[1] {
        let read = readLine()!.split(separator: " ").map{Int($0)!}
        if i > inactiveCount {
            arr[read[0]].append(graph(to: read[1], weight: read[2],active: false))
        } else {
            arr[read[0]].append(graph(to: read[1], weight: read[2],active: true))
        }
        
        if read[2] > max {
            max = read[2]
            maxFrom = read[0]
            if i > inactiveCount {
                maxBool = false
            } else {
                maxBool = true
            }
            maxGraph = graph(to: read[1], weight: read[2]-enhancer, active: maxBool)
        }
    }
    
    for i in 0...arr[maxFrom].count - 1 {
        if arr[maxFrom][i].weight == max {
            arr[maxFrom][i] = maxGraph
            break
        }
    }
    
    for i in 0...kruskalMST(arr).count-1 {
        if kruskalMST(arr)[i].x == false {
            count += 1
        }
    }
    
//    print(kruskalMST(arr))
    print(count)
    
    struct UnionFind {
        /// parent[i] = parent of i
        private var parents: [Int]
        /// size[i] = number of nodes in tree rooted at i
        private var size: [Int]
        /// number of components
        private(set) var count: Int
        
        /// Initializes an empty union-find data structure with **n** elements
        /// **0** through **n-1**.
        /// Initially, each elements is in its own set.
        /// - Parameter n: the number of elements
        public init(_ n: Int) {
            self.count = n
            self.size = [Int](repeating: 1, count: n)
            self.parents = [Int](repeating: 0, count: n)
            for i in 0..<n {
                self.parents[i] = i
            }
        }
        
        /// Returns the canonical element(root) of the set containing element `p`.
        /// - Parameter p: an element
        /// - Returns: the canonical element of the set containing `p`
        public mutating func find(_ x: Int) -> Int {
            if parents[x] == x {
                return x
            }
            return find(parents[x])
        }
        
        /// Returns `true` if the two elements are in the same set.
        /// - Parameters:
        ///   - p: one elememt
        ///   - q: the other element
        /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
        public mutating func connected(_ p: Int, _ q: Int) -> Bool {
            return find(p) == find(q)
        }
        
        /// Merges the set containing element `p` with the set containing
        /// element `q`
        /// - Parameters:
        ///   - p: one element
        ///   - q: the other element
        public mutating func union(_ p: Int, _ q: Int) {
            let pRoot = find(p)
            let qRoot = find(q)
    
            if pRoot != qRoot {
                parents[pRoot] = qRoot
            }
        }
        
        private func validate(_ p: Int) throws {
            let n = parents.count
            guard p >= 0 && p < n else {
                throw RuntimeError.illegalArgumentError("index \(p) is not between 0 and \(n - 1)")
            }
        }
    }
    
    enum RuntimeError: Error {
        case illegalArgumentError(String)
    }
}
