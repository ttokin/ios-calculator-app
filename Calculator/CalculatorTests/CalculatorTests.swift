//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by SummerCat on 2022/09/20.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    struct Item: CalculateItem, Equatable {
        var data: String
    }
    
    var sut: CalculatorItemQueue<Item>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_inputStack에_들어갔는지() {
        // given
        let item: Item = Item(data: "item data")
        let node: Node = Node<Item>(value: item)
        
        // when
        sut.enqueue(node: node)
        
        // then
        XCTAssertEqual(sut.list.front, node)
        XCTAssertEqual(sut.list.rear, node)
    }
    
    func test_dequeue_빈배열에서디큐_nil반환하는지() {
        // given
        let item: Item = Item(data: "item data")
        let node: Node = Node<Item>(value: item)

        // when
        let result = sut.dequeue(node: node)

        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_1개인큐_1개디큐() {
        // given
        let item: Item = Item(data: "item data")
        let node: Node = Node<Item>(value: item)
        
        // when
        sut.enqueue(node: node)
        let dequeued = sut.dequeue(node: node)
        
        // then
        XCTAssertEqual(sut.list.front, nil)
        XCTAssertEqual(sut.list.rear, nil)
    }

    func test_dequeue_원소가2개이상일때_1개디큐() {
        // given
        let firstItem: Item = Item(data: "first item")
        let secondItem: Item = Item(data: "second item")
        
        let firstNode: Node = Node<Item>(value: firstItem)
        let secondNode: Node = Node<Item>(value: secondItem)
        
        let expectedDequeuedNode = firstNode

        // when
        sut.enqueue(node: firstNode)
        sut.enqueue(node: secondNode)
        let dequeued = sut.dequeue(node: firstNode)

        // then
        XCTAssertEqual(dequeued, expectedDequeuedNode)
        XCTAssertEqual(sut.list.front, secondNode)
        XCTAssertEqual(sut.list.rear, secondNode)
    }
}


