//
//  List.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/20.
//

import Foundation

class Node<T>: Equatable  {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        if lhs.value as? String == rhs.value as? String,
           lhs.prev == rhs.prev,
           lhs.next == rhs.next {
            return true
        }
        
        return false
    }
    
    var value: T
    var prev: Node?
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

struct List<T> {
    var front: Node<T>?
    var rear: Node<T>?
    
    mutating func add(node: Node<T>) {
        if rear == nil {
            self.front = node
            self.rear = node
            return
        }
        
        rear?.next = node
        node.prev = rear
        self.rear = node
    }
    
    mutating func remove(node: Node<T>) -> Node<T>? {
        if front == nil, rear == nil { return nil }
        
        if node == front {
            node.next?.prev = nil
            front = node.next
        }
        
        if node == rear {
            node.prev?.next = nil
            rear = node.prev
        }
        
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        return node
    }
}


