//
//  Matrix.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 29.10.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

class Matrix: NSObject {
    
    var cols:Int
    var rows:Int
    var data:[Double]
    
    init(cols:Int, rows:Int) {
        self.cols = cols
        self.rows = rows
        
        let count:Int = cols*rows;
        self.data = Array(count:count, repeatedValue:0)
    }
    
    subscript(col:Int, row:Int) -> Double {
        get {
            return data[cols * row + col]
        }
        set {
            data[cols*row+col] = newValue
        }
    }
    
    func valueForIndex(index: Int) -> Double{
        return data[index];
    }
    
    func count() -> Int {
        return self.data.count
    }
    
    func colCount() -> Int {
        return self.cols;
    }
    
    func rowCount() -> Int {
        return self.rows;
    }

}
