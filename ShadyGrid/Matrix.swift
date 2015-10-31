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
            return data[indexFrom(col, row: row)]
        }
        set {
            data[indexFrom(col, row: row)] = newValue
        }
    }
    
    func indexFrom(col:Int, row:Int) -> Int {
        
        let index = cols * row + col;
        return index < data.count ? index : -1
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
    
    
    //Get col index from array index
    func colIndex(index: Int) -> Int {
        
        return index - (cols * (rowIndex(index)))
        
    }
    
    func rowIndex(index: Int) -> Int {
        return Int(index/cols)
    }
    
    func borderingIndexes(index: Int) -> [Int] {
        
        var array:[Int] = Array()
        let col = colIndex(index)
        let row = rowIndex(index)
        
        for i in -1...1 {
            let calcCol = col+i
            let calcRow = row+i
            if (i != 0){
                var index = indexFrom(calcCol, row: row);
                if (index >= 0 && calcCol >= 0 && calcCol < colCount()){
                    array.append(index)
                }
                index = indexFrom(col, row: calcRow);
                if (index >= 0 && calcRow >= 0 && calcRow < rowCount()){
                    array.append(index)
                }
            }
        }
        
        return array;
        
    }

}
