//
//  PlayConfiguration.swift
//  ShadyGrid
//
//  Created by Toni Möckel on 31.10.15.
//  Copyright © 2015 Toni Möckel. All rights reserved.
//

import UIKit

class PlayConfiguration: NSObject {

    enum ColorMode: Int {
        case BlackWihte = 0
        case Red = 1
        case Green = 2
        case Blue = 3
    }
    
    var cols: Int = 3
    var rows: Int = 6
    var color: ColorMode = ColorMode.BlackWihte
    var colorSteps: Int = 8
    
    
}
