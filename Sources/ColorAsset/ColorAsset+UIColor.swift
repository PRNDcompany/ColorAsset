//
//  ColorAsset+UIColor.swift
//  
//
//  Created by 김태완 on 2022/02/04.
//

#if canImport(UIKit)
import UIKit

public extension UIColor {
    static func asset(_ color: ColorAsset) -> UIColor {
        color.toUIColor()
    }
}

public extension ColorAsset {
    func toUIColor() -> UIColor {
        switch colorType {
        case let .literal(red, green, blue):
            return UIColor(
                red: CGFloat(red),
                green: CGFloat(green),
                blue: CGFloat(blue),
                alpha: CGFloat(alpha)
            )
            
        case let .asset(named, bundle):
            #if os(watchOS)
            let color = UIColor(named: named)!
            #else
            let color = UIColor(named: named, in: bundle, compatibleWith: nil)!
            #endif
            guard let alpha = self._alpha else { return color }
            return color.withAlphaComponent(CGFloat(alpha))
        }
    }
}
#endif
