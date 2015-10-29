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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFillRandom() {

        let matrix:ColorMatrix = ColorMatrix(cols: 1, rows: 1)
        matrix.fillWithRandom()
        
        XCTAssertTrue(matrix[0,0]>0)
        XCTAssertTrue(matrix[0,0]<255)
        
    }
    

    func testPowerCalculation() {
        
        let matrix:ColorMatrix = ColorMatrix(cols: 1, rows: 1)
        
        XCTAssertEqual(matrix.calcPowOfValue(8, radix: 2), 256);
        XCTAssertEqual(matrix.calcPowOfValue(2, radix: 2), 4);
        
    }
    
}
