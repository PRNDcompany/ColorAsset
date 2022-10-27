//
//  ColorAsset+Hex+UInt.swift
//  
//
//  Created by 김태완 on 2022/02/04.
//  https://github.com/100mango/SwiftCssParser

import Foundation


public extension ColorAsset {
    /**
     The shorthand three-digit hexadecimal representation of color.
     #RGB defines to the color #RRGGBB.
     
     - parameter hex3: Three-digit hexadecimal value.
     - parameter alpha: 0.0 - 1.0. The default is 1.0.
     */
    init(hex3: UInt16, alpha: Double = 1) {
        let divisor = Double(15)
        let red = Double((hex3 & 0xF00) >> 8) / divisor
        let green = Double((hex3 & 0x0F0) >> 4) / divisor
        let blue = Double(hex3 & 0x00F) / divisor
        
        self.colorType = .literal(red: red, green: green, blue: blue)
        self.alpha = alpha
    }
    
    /**
     The shorthand four-digit hexadecimal representation of color with alpha.
     #RGBA defines to the color #RRGGBBAA.
     
     - parameter hex4: Four-digit hexadecimal value.
     */
    init(hex4: UInt16) {
        let divisor = Double(15)
        let red = Double((hex4 & 0xF000) >> 12) / divisor
        let green = Double((hex4 & 0x0F00) >> 8) / divisor
        let blue = Double((hex4 & 0x00F0) >> 4) / divisor
        
        self.colorType = .literal(red: red, green: green, blue: blue)
        self.alpha = Double(hex4 & 0x000F) / divisor
    }
    
    /**
     The six-digit hexadecimal representation of color of the form #RRGGBB.
     
     - parameter hex6: Six-digit hexadecimal value.
     */
    init(hex6: UInt32, alpha: Double = 1) {
        let divisor = Double(255)
        let red = Double((hex6 & 0xFF0000) >> 16) / divisor
        let green = Double((hex6 & 0x00FF00) >> 8) / divisor
        let blue = Double(hex6 & 0x0000FF) / divisor
        
        self.colorType = .literal(red: red, green: green, blue: blue)
        self.alpha = alpha
    }
    
    /**
     The six-digit hexadecimal representation of color with alpha of the form #RRGGBBAA.
     
     - parameter hex8: Eight-digit hexadecimal value.
     */
    init(hex8: UInt32) {
        let divisor = Double(255)
        let red = Double((hex8 & 0xFF000000) >> 24) / divisor
        let green = Double((hex8 & 0x00FF0000) >> 16) / divisor
        let blue = Double((hex8 & 0x0000FF00) >> 8) / divisor
        
        self.colorType = .literal(red: red, green: green, blue: blue)
        self.alpha = Double(hex8 & 0x000000FF) / divisor
    }
}
