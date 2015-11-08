//
//  Solver.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 05.11.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

class Solver {
    
    func solve(matrix: AdjacentMatrix) -> Array<[Int]> {
        
        var solutions: Array<[Int]> = []
        let result = self.iterateMove(matrix)
        
        for resultMatrix in result {
            solutions.append(resultMatrix.increasePath)
        }
        
        return solutions
    }
    
    private func iterateMove(matrix: AdjacentMatrix) -> [AdjacentMatrix]  {
        
        var results: [AdjacentMatrix] = []
        if (!matrix.isCompleted()){
            for index in 0...matrix.count()-1 {
                let shadowMatrix = matrix.copy() as! AdjacentMatrix
                let increaseAllowed = shadowMatrix.isIncreaseAllowed(index);
                
                if (increaseAllowed){
                    shadowMatrix.increaseValue(index)
                
                    if (shadowMatrix.isCompleted()){
                        results.append(shadowMatrix)
                    }else {
                        results.appendContentsOf(iterateMove(shadowMatrix))
                    }
                }
            }
        }
        
        return results;
    }

}
