//
//  GameMatrixProtocol.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 08.11.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

protocol GameMatrixProtocol {
    
    var score: Int { get }
    
    func increaseValue(index: Int) -> [Int]
    func fillWithRandom() -> Void
    func colorForElement(index: Int) -> UIColor
    func count() -> Int
    func colCount() -> Int
    func rowCount() -> Int
    func isCompleted() -> Bool

}