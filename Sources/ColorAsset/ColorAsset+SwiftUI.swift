//
//  ColorAsset+SwiftUI.swift
//  
//
//  Created by PRND on 2021/07/28.
//

import SwiftUI


public extension Color {
    init(_ color: ColorAsset) {
        switch color.colorType {
         case let .literal(red, green, blue):
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: color.alpha)
            
        case let .asset(named, bundle):
            self.init(named, bundle: bundle)
        }
    }
    
    static func asset(_ color: ColorAsset) -> Color {
        Color(color)
    }
}


public extension ColorAsset {
    func toColor() -> Color {
        Color(self)
    }
}
