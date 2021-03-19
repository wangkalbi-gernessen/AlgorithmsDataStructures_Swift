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
    
    func preOrder(_ node: Int) {
        if node == -1 { return }
        print(Character(UnicodeScalar(node + 65)!), terminator: "")
        preOrder(tree[node][0])
        preOrder(tree[node][1])
    }
    
    func inOrder(_ node: Int) {
        if node == -1 { return }
        inOrder(tree[node][0])
        print(Character(UnicodeScalar(node + 65)!), terminator: "")
        inOrder(tree[node][1])
    }
    
    func postOrder(_ node: Int) {
        if node == -1 { return }
        postOrder(tree[node][0])
        postOrder(tree[node][1])
        print(Character(UnicodeScalar(node + 65)!), terminator: "")
    }
    
    preOrder(0)
    print()
    inOrder(0)
    print()
    postOrder(0)
    print()
}
