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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCount() {

        let matrix:Matrix = Matrix(cols: 3, rows: 3)
        XCTAssertEqual(matrix.count(), 9)
        
    }
    
    func testColCount() {
        
        let matrix:Matrix = Matrix(cols: 3, rows: 3)
        XCTAssertEqual(matrix.colCount(), 3)
        
    }
    
    func testRowCount() {
        
        let matrix:Matrix = Matrix(cols: 3, rows: 3)
        XCTAssertEqual(matrix.rowCount(), 3)
        
    }
}
