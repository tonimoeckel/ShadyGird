//
//  PlayViewControllerTests.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 08.11.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import XCTest
@testable import ShadyGrid

class PlayViewControllerTests: XCTestCase {
    
    var viewController: PlayViewController = PlayViewController()
    
    class MatrixMock: GameMatrixProtocol {
        
        var score: Int = 0
        
        func increaseValue(index: Int) -> [Int] {
            return []
        }
        
        func fillWithRandom() -> Void {
            
        }
        
        func colorForElement(index: Int) -> UIColor {
            return UIColor.redColor()
        }
        
        func count() -> Int {
            return 9
        }
        
        func colCount() -> Int{
            return 3
        }
        
        func rowCount() -> Int {
            return 3
        }
        
        func isCompleted() -> Bool{
            return false
        }
        
    }
    
    override func setUp() {
        super.setUp()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateMatrixShouldGenerateMatrix(){
        
        let configuration = PlayConfiguration(cols: 2, rows: 3, color: PlayConfiguration.ColorMode.BlackWihte, colorSteps: 4)

        let matrix = viewController.createMatrix(configuration)
        
        XCTAssertEqual(matrix.colCount(), 2)
        XCTAssertEqual(matrix.rowCount(), 3)
    }
    
    func testCollectionViewDelegateShouldRenderMatrixLength() {
        
        viewController.matrix = MatrixMock()
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())
        
        XCTAssertEqual(viewController.collectionView(collectionView, numberOfItemsInSection: 0), 9)
        
    }
    
    
}
