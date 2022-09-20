//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/20.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<T: CalculateItem> {
    var list = List<T>()
    
    mutating func enqueue(node: Node<T>) {
        list.add(node: node)
    }
    
    mutating func dequeue(node: Node<T>) -> Node<T>? {
        list.remove(node: node)
    }
}
