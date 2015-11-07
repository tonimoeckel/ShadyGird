//
//  Solver.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 05.11.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

class Solver: NSObject {
    
    var result:[ColorMatrix] = []

    func solve(matrix: ColorMatrix) -> Array<[Int]> {
        
        var solutions: Array<[Int]> = []
        result = []
        
        self.iterateMove(matrix)
        
        for resultMatrix in result {
            solutions.append(resultMatrix.increasePath)
        }
        
        return solutions
        
    }
    
    
    private func iterateMove(matrix: ColorMatrix) -> Void {
        
        if (!matrix.isCompleted()){
            for index in 0...matrix.count()-1 {
                let shadowMatrix = matrix.copy() as! ColorMatrix
                let increaseAllowed = shadowMatrix.isIncreaseAllowed(index);
                
                if (increaseAllowed){
                    shadowMatrix.increaseValue(index)
                
                    if (shadowMatrix.isCompleted()){
                        result.append(shadowMatrix)
                    }else {
                        iterateMove(shadowMatrix)
                    }
                }
                
            }
        }
        
    }

    
}
