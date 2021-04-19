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
        var edges = [(u: Int, v: Int, w: Int,x : Bool)]()
        var mstEdges = [(u: Int, v: Int, w: Int,x : Bool)]()
        
        for (u, node) in graph.enumerated() {
            for edge in node {
                edges.append((u: u, v: edge.v, w: edge.w,x : edge.active))
            }
        }
        
        edges.sort { $0.w < $1.w }
        var unionFind = UnionFind(graph.count)
        for edge in edges {
            if unionFind.connected(edge.u, edge.v) { continue }
            unionFind.union(edge.u, edge.v)
            mstEdges.append(edge)
        }
        
        return mstEdges
    }
    
    
    struct graph {
        var v : Int
        var w : Int
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
    
    var maxGraph = graph(v: 0, w: 0, active: false)
    var graphs = [[graph]](repeating: [graph](), count: read[1]+1)
    
    for i in 1...read[1] {
        let read = readLine()!.split(separator: " ").map{Int($0)!}
        if i > inactiveCount {
            graphs[read[0]].append(graph(v: read[1], w: read[2],active: false))
        } else {
            graphs[read[0]].append(graph(v: read[1], w: read[2],active: true))
        }
        
        if read[2] > max {
            max = read[2]
            maxFrom = read[0]
            if i > inactiveCount {
                maxBool = false
            } else {
                maxBool = true
            }
            maxGraph = graph(v: read[1], w: read[2]-enhancer, active: maxBool)
        }
    }
    
    for i in 0...graphs[maxFrom].count - 1 {
        if graphs[maxFrom][i].w == max {
            graphs[maxFrom][i] = maxGraph
            break
        }
    }
    
    for i in 0...kruskalMST(graphs).count-1 {
        if kruskalMST(graphs)[i].x == false {
            count += 1
        }
    }
    
//    print(kruskalMST(arr))
    print(graphs)
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
    }
}
