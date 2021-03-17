//
//  Queue.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-15.
//

import Foundation

public final class Queue<E>: Sequence {
    // set head node
    private var head: Node<E>? = nil
    private var tail: Node<E>? = nil
    private(set) var count: Int = 0
    
    // create 1 Node here
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    init() {}
    
    // add item
    func push(_ item: E) {
        head = Node(item: item, next: head)
        if tail == nil {
            tail = head
        }
        count += 1
    }
    
    func pop() -> E? {
        if head == nil {
            return nil
        }
        
        var prev = head
        var current = head
        
        while let next = current?.next {
            prev = current
            current = next
        }
        
        prev?.next = nil
        tail = prev
        return current?.item
        
    }
    
    func peek() -> E? {
        if tail == nil {
            return nil
        }
        return tail?.item
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    public struct QueueIterator<E> : IteratorProtocol {
        public typealias Element = E
        
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
    }
    
    /// Returns an iterator that iterates over the items in this bag in reverse order
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(head)
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), " }
    }
}
