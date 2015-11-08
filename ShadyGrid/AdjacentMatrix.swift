//
//  AdjacentMatrix.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 29.10.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

class AdjacentMatrix: Matrix, GameMatrixProtocol, NSCopying {
    
    var colorMode:PlayConfiguration.ColorMode = PlayConfiguration.ColorMode(rawValue: 0)!
    var colorSteps:Int = 8
    var score:Int = 0
    var increasePath: [Int] = []
    
    init(cols: Int, rows: Int, colorSteps: Int) {
        super.init(cols: cols, rows: rows)
        
        self.colorSteps = colorSteps
        
    }
    
    init(cols: Int, rows: Int, colorSteps: Int, color: PlayConfiguration.ColorMode) {
        super.init(cols: cols, rows: rows)
        
        self.colorSteps = colorSteps
        self.colorMode = color
        
    }
    
    func fillWithRandom() -> Void {
        
        for (index, _) in data.enumerate() {
            data[index] = Double(arc4random_uniform(UInt32(colorSteps)))
        }
        
    }
    
    func colorForElement(index: Int) -> UIColor{
        
        let element:Double = self.data[index]
        
        let maxValue:Double = Double(calcPowOfValue(colorSteps, radix: 2))
        let value:Double = Double(calcPowOfValue(Int(element), radix: 2))
        
        return generateColor(Float((maxValue-value)/maxValue), colorMode: colorMode)
        
    }
    
    private func generateGrayColor(value: Float) -> UIColor {
        
        let color:UIColor = UIColor(colorLiteralRed: value, green: value, blue: value, alpha: 1)
        return color;
        
    }
    
    func generateColor(value: Float, colorMode: PlayConfiguration.ColorMode) -> UIColor {
        
        let color:UIColor
        
        switch colorMode {
        case PlayConfiguration.ColorMode.BlackWihte:
            color = UIColor(colorLiteralRed: value, green: value, blue: value, alpha: 1)
            break
            
        case PlayConfiguration.ColorMode.Red:
            color = UIColor(colorLiteralRed: value, green: 0, blue: 0, alpha: 1)
            break
            
        case PlayConfiguration.ColorMode.Green:
            color = UIColor(colorLiteralRed: 0, green: value, blue: 0, alpha: 1)
            break
        
        case PlayConfiguration.ColorMode.Blue:
            color = UIColor(colorLiteralRed: 0, green: 0, blue: value, alpha: 1)
            break
        
        }
    
        return color;
        
    }
    
    func calcPowOfValue(exponent:Int, radix:Int) -> Int {
        return Int(pow(CGFloat(radix),CGFloat(exponent)))
    }
    
    func increaseValue(index: Int) -> [Int] {
        
        if (!isIncreaseAllowed(index)){
            return []
        }
        
        self.increasePath.append(index)
        score++
        let equalIndexes = findEqualElements(index)

        for increaseIndex in equalIndexes {
            var value = data[increaseIndex]
            value++
            data[increaseIndex] = value
        }
        
        return equalIndexes
        
    }
    
    func isIncreaseAllowed(index: Int) -> Bool {
        
        return data[index] < Double(colorSteps)
        
    }
    
    func findEqualElements(index: Int) -> [Int] {
        
        //Finde ähnliche Nachbarn
        let value = data[index]
        var equalIndexes:[Int] = [index]
        let borderingElements:[Int] = borderingIndexes(index)
        
        equalIndexes = fillArray(equalIndexes, elements: borderingElements, value: value)
        
        return equalIndexes
        
    }
    
    func fillArray(var equalIndexes: [Int] , elements: [Int], value: Double) -> [Int] {
        
        for elementIndex in elements{
            if (value == data[elementIndex] && !equalIndexes.contains(elementIndex)){
                equalIndexes.append(elementIndex)
                
                let borderingElements:[Int] = borderingIndexes(elementIndex)
                equalIndexes = fillArray(equalIndexes, elements: borderingElements, value: value)
            }
            
        }
        
        return equalIndexes;
    }
    
    func isCompleted() -> Bool {
        
        if (data.count > 0 && findEqualElements(0).count == data.count){
            return true
        }
        
        return false
        
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        
        let object = AdjacentMatrix(cols: cols, rows: rows, colorSteps: colorSteps)
        object.data = NSMutableArray(array: data, copyItems: true) as AnyObject as! [Double]
        object.increasePath = increasePath
        object.score = score
        object.colorMode = colorMode
        object.colorSteps = colorSteps
        return object
    }
    
}
