//  Copyright © 2024 PRND. All rights reserved.

import Foundation


public struct AlphaComponent: ColorAssetConvertible {
    var rawValue: Double
    
    public init(rawValue: Double) {
        self.rawValue = rawValue
    }
    
    public func convert(_ color: ColorAsset) -> ColorAsset {
        var copy = color
        copy.alpha = rawValue
        return copy
    }
}

extension ColorAsset {
    public func alpha(_ value: AlphaComponent) -> ColorAsset {
        convert(value)
    }
}
