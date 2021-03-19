//
//  MyParent.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-18.
//

import Foundation

class TreeNode<E> {
    var data: E
    var children: [TreeNode] = []
    weak var parent: TreeNode?
    
    init(_ data: E) {
        self.data = data
    }
    
    func add(child: TreeNode) {
        children.append(child)
        child.parent = self
    }
}

func treeTraversal() {
    var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 26)
    print("Please enter a number: ")
    let n = Int(readLine()!)!
    
    for i in 0..<n {
        let node = TreeNode(i)
    }
}
