//
//  ColorAsset+Alpha.swift
//  
//
//  Created by PRND on 2021/07/09.
//

import Foundation


public extension ColorAsset {
    
    func with(alpha: Double) -> ColorAsset {
        var color = self
        color.alpha = alpha
        return color
    }
}
