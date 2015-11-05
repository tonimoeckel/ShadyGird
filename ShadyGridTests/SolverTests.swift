//
//  SolverTests.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 05.11.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import XCTest
@testable import ShadyGrid

class SolverTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSolve_FourMatrix() {

        let solver: Solver = Solver()
        let matrix: ColorMatrix = ColorMatrix(cols: 2, rows: 2, colorSteps: 2)

        
        /* Test Matrix
        
        0   1
        
        2   0
        
        KI
        
        1   1       0   2       0   1
        
        2   0       2   0       2   1
        
        User
        
        1   1       0   2
        
        2   1       2   1
        
        KI
        
        2   2       0   2
        
        2   2       2   2
        
        User
                    1   2
            
                    2   2
        
        KI
        
                    2   2
        
                    2   2
        
        */
        matrix[1,0] = 0
        matrix[1,0] = 1
        matrix[0,1] = 2
        matrix[1,1] = 0

        
        solver.solve(matrix)
        
    }
    
    
}
