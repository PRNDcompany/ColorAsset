//
//  ColorAsset+NSColor.swift
//  
//
//  Created by woody on 2022/10/26.
//

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

public extension NSColor {
    static func asset(_ color: ColorAsset) -> NSColor {
        color.toNSColor()
    }
}

public extension ColorAsset {
    func toNSColor() -> NSColor {
        switch colorType {
        case let .literal(red, green, blue):
            return NSColor(
                red: CGFloat(red),
                green: CGFloat(green),
                blue: CGFloat(blue),
                alpha: CGFloat(alpha)
            )
            
        case let .asset(named, bundle):
            let color = NSColor(named: named, bundle: bundle)!
            guard let alpha = self._alpha else { return color }
            return color.withAlphaComponent(CGFloat(alpha))
        }
    }
}
#endif

