//
//  KPColor.swift
//  koolicarproject
//
//  Created by Stephan Yannick on 30/09/2016.
//  Copyright © 2016 koolicar. All rights reserved.
//

import UIKit

enum ROBColor: UInt {
    
    case A = 0xE85310
    case B = 0x7A9A2B
    //...
    
    /**
     Get color
     
     ```
     ROBColor.A.color()
     ```
     - returns: UIColor
     */
    func color() -> UIColor {
        return UIColor(rgb: self.rawValue, alphaVal: 1)
    }
}
