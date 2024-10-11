//  Copyright © 2021 PRND. All rights reserved.

import Foundation


public struct ColorAsset: Equatable, Hashable {
    public var red: Double {
        colorType.components.red
    }
    
    public var green: Double {
        colorType.components.green
    }
    
    public var blue: Double {
        colorType.components.blue
    }
 
    public var alpha: Double {
        get { _alpha ?? 1 }
        set { _alpha = newValue }
    }
    
    public init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.colorType = .literal(red: red, green: green, blue: blue)
        self._alpha = alpha
    }
    
    public init(named: String, bundle: Bundle?, alpha: Double? = nil) {
        self.colorType = .asset(named: named, bundle: bundle)
        self._alpha = alpha
    }
    
    // MARK: Internal
    enum ColorType: Hashable {
        case literal(red: Double, green: Double, blue: Double)
        case asset(named: String, bundle: Bundle?)
    }
    
    var colorType: ColorType
    var _alpha: Double?
}
