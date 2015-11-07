//
//  ColorMatrixTests.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 29.10.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import XCTest
@testable import ShadyGrid

class ColorMatrixTests: XCTestCase {
    
    let matrix:ColorMatrix = ColorMatrix(cols: 3, rows: 3, colorSteps: 8)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFillRandom() {

        matrix.fillWithRandom()
        
        XCTAssertTrue(matrix[0,0]>=0)
        XCTAssertTrue(matrix[0,0]<8)
        
    }
    

    func testPowerCalculation() {
        
        XCTAssertEqual(matrix.calcPowOfValue(8, radix: 2), 256);
        XCTAssertEqual(matrix.calcPowOfValue(2, radix: 2), 4);
        
    }
    
    func testIncreaseElementFive() {
        
        
        matrix[1,0] = 1
        matrix[0,1] = 1
        matrix[1,1] = 1
        matrix[1,2] = 1
        matrix[2,1] = 1
        
        let array:[Int] = matrix.findEqualElements(4)
        
        XCTAssertTrue(array.contains(1))
        XCTAssertTrue(array.contains(3))
        XCTAssertTrue(array.contains(4))
        XCTAssertTrue(array.contains(5))
        XCTAssertTrue(array.contains(7))
        
        
    }
    
    func testIncreaseElementFour() {
        
        
        matrix[1,0] = 1
        matrix[0,1] = 1
        matrix[1,1] = 1
        matrix[1,2] = 1
        matrix[2,1] = 0
        
        let array:[Int] = matrix.findEqualElements(4)
        
        XCTAssertTrue(array.contains(1))
        XCTAssertTrue(array.contains(3))
        XCTAssertTrue(array.contains(4))
        XCTAssertFalse(array.contains(5))
        XCTAssertTrue(array.contains(7))
        
        
    }
    
    func testIncreaseElementSix() {
        
        
        matrix[1,0] = 1
        matrix[0,1] = 1
        matrix[1,1] = 1
        matrix[1,2] = 1
        matrix[2,1] = 1
        matrix[2,2] = 1
        
        let array:[Int] = matrix.findEqualElements(4)
        
        XCTAssertTrue(array.contains(1))
        XCTAssertTrue(array.contains(3))
        XCTAssertTrue(array.contains(4))
        XCTAssertTrue(array.contains(5))
        XCTAssertTrue(array.contains(7))
        XCTAssertTrue(array.contains(8))
        
        
    }
    
    func testIncreaseElementThreeExclude() {
        
        
        matrix[1,0] = 1
        matrix[0,1] = 1
        matrix[1,1] = 1
        matrix[1,2] = 0
        matrix[2,1] = 0
        matrix[2,2] = 1
        
        let array:[Int] = matrix.findEqualElements(4)
        
        XCTAssertTrue(array.contains(1))
        XCTAssertTrue(array.contains(3))
        XCTAssertTrue(array.contains(4))
        XCTAssertFalse(array.contains(5))
        XCTAssertFalse(array.contains(7))
        XCTAssertFalse(array.contains(8))
        
        
    }
    
    func testIncreaseElementNine() {
        
        matrix[0,0] = 1
        matrix[1,0] = 1
        matrix[2,0] = 1
        matrix[0,1] = 1
        matrix[1,1] = 1
        matrix[2,1] = 1
        matrix[0,2] = 1
        matrix[1,2] = 1
        matrix[2,2] = 1
        
        let array:[Int] = matrix.findEqualElements(4)
        
        XCTAssertTrue(array.contains(0))
        XCTAssertTrue(array.contains(1))
        XCTAssertTrue(array.contains(2))
        XCTAssertTrue(array.contains(3))
        XCTAssertTrue(array.contains(4))
        XCTAssertTrue(array.contains(5))
        XCTAssertTrue(array.contains(6))
        XCTAssertTrue(array.contains(7))
        XCTAssertTrue(array.contains(8))
        
        
    }
    
    func testIsCompleted() {
        
        matrix[0,0] = 1
        matrix[1,0] = 1
        matrix[2,0] = 1
        matrix[0,1] = 1
        matrix[1,1] = 1
        matrix[2,1] = 1
        matrix[0,2] = 1
        matrix[1,2] = 1
        matrix[2,2] = 1
        
        XCTAssertTrue(matrix.isCompleted())
    }
    
    func testIsIncreaeAllowed() {
        
        let testMatrix = ColorMatrix(cols: 2, rows: 2, colorSteps:  2)
        testMatrix[0,0] = 0
        testMatrix[0,1] = 1
        testMatrix[1,0] = 2
        testMatrix[1,1] = 0
        
        
        
    }
    
}
