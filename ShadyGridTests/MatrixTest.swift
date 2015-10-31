//
//  MatrixTest.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 29.10.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import XCTest
@testable import ShadyGrid


class MatrixTest: XCTestCase {
    
    let matrix:Matrix = Matrix(cols: 3, rows: 3)
    
    override func setUp() {
        super.setUp()

        
    }
    
    override func tearDown() {

        
        super.tearDown()
    }
    
    func testCount() {

        XCTAssertEqual(matrix.count(), 9)
        
    }
    
    func testColCount() {
        
        XCTAssertEqual(matrix.colCount(), 3)
        
    }
    
    func testRowCount() {
        
        XCTAssertEqual(matrix.rowCount(), 3)
        
    }
    
    func testRowIndex(){
        
        XCTAssertEqual(matrix.rowIndex(0), 0)
        XCTAssertEqual(matrix.rowIndex(1), 0)
        XCTAssertEqual(matrix.rowIndex(2), 0)
        XCTAssertEqual(matrix.rowIndex(3), 1)
        XCTAssertEqual(matrix.rowIndex(4), 1)
        XCTAssertEqual(matrix.rowIndex(5), 1)
        XCTAssertEqual(matrix.rowIndex(6), 2)
        
    }
    
    func testColIndex(){
        
        XCTAssertEqual(matrix.colIndex(0), 0)
        XCTAssertEqual(matrix.colIndex(1), 1)
        XCTAssertEqual(matrix.colIndex(2), 2)
        XCTAssertEqual(matrix.colIndex(3), 0)
        XCTAssertEqual(matrix.colIndex(4), 1)
        XCTAssertEqual(matrix.colIndex(5), 2)
        XCTAssertEqual(matrix.colIndex(6), 0)
        
    }
    
    func testBorderingElementsZero() {

        let array:[Int] = matrix.borderingIndexes(0)
        XCTAssertEqual(array.count, 2)
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 3)
        
    }
    
    func testBorderingElementsOne() {
        
        let array:[Int] = matrix.borderingIndexes(1)
        XCTAssertEqual(array.count, 3)
        XCTAssertTrue(array.contains(0))
        XCTAssertTrue(array.contains(2))
        XCTAssertTrue(array.contains(4))
        
    }
    
    func testBorderingElementsFour() {
        
        let array:[Int] = matrix.borderingIndexes(4)
        XCTAssertEqual(array.count, 4)
        XCTAssertTrue(array.contains(1))
        XCTAssertTrue(array.contains(3))
        XCTAssertTrue(array.contains(5))
        XCTAssertTrue(array.contains(7))
        
    }
    
    func testBorderingElementsEight() {
        
        let array:[Int] = matrix.borderingIndexes(8)
        XCTAssertEqual(array.count, 2)
        XCTAssertTrue(array.contains(5))
        XCTAssertTrue(array.contains(7))
        
    }
}
