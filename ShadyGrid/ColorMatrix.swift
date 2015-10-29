//
//  ColorMatrix.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 29.10.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

class ColorMatrix: Matrix {
    
    var colorSteps:Int = 8
    
    init(cols: Int, rows: Int, colorSteps: Int) {
        super.init(cols: cols, rows: rows)
        
        self.colorSteps = colorSteps
        
    }
    
    func fillWithRandom() -> Void {
        
        for (index, _) in data.enumerate() {
        
            data[index] = Double(self.calcPowOfValue(Int(arc4random_uniform(UInt32(colorSteps))), radix: 2))
        }
        
    }
    
    func colorForElement(index: Int) -> UIColor{
        
        let element:Double = self.data[index]
        
        let maxValue:Double = Double(calcPowOfValue(colorSteps, radix: 2))
        
        return generateGrayColor(Float((maxValue-element)/maxValue))
        
    }
    
    private func generateGrayColor(value: Float) -> UIColor {
        
        let color:UIColor = UIColor(colorLiteralRed: value, green: value, blue: value, alpha: 1)
        return color;
        
    }
    
    func calcPowOfValue(exponent:Int, radix:Int) -> Int {
        return Int(pow(CGFloat(radix),CGFloat(exponent)))
    }
    
    func increaseValue(index: Int) -> Void {
        
        //Finde ähnliche Nachbarn
        
    }
    
}
