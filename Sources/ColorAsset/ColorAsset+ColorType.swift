//
//  File.swift
//  
//
//  Created by woody on 2022/10/27.
//

import Foundation

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


extension ColorAsset.ColorType {
    var components: (red: Double, green: Double, blue: Double) {
        switch self {
        case let .literal(red, green, blue):
            return (red, green, blue)
        case let .asset(named, bundle):
            #if canImport(UIKit) && os(watchOS)
            let color = UIColor(named: named)!
            let components = color.components
            return (Double(components.red), Double(components.green), Double(components.blue))
            #elseif canImport(UIKit)
            let color = UIColor(named: named, in: bundle, compatibleWith: nil)!
            let components = color.components
            return (Double(components.red), Double(components.green), Double(components.blue))
            #elseif canImport(AppKit)
            let color = NSColor(named: named, bundle: bundle)!
            let components = color.components
            return (Double(components.red), Double(components.green), Double(components.blue))
            #else
            return (0,0,0)
            #endif
        }
    }
}

#if canImport(UIKit)
private extension UIColor {
    typealias RGBA = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    var rgba: RGBA? {
        var (r, g, b, a): RGBA = (0, 0, 0, 0)
        return getRed(&r, green: &g, blue: &b, alpha: &a) ? (r,g,b,a) : nil
    }
    var r: CGFloat? {
        var red: CGFloat = .zero
        return getRed(&red, green: nil, blue: nil, alpha: nil) ? red : nil
    }
    var g: CGFloat? {
        var green: CGFloat = .zero
        return getRed(nil, green: &green, blue: nil, alpha: nil) ? green : nil
    }
    var b: CGFloat? {
        var blue: CGFloat = .zero
        return getRed(nil, green: nil, blue: &blue, alpha: nil) ? blue : nil
    }
    var a: CGFloat? {
        var alpha: CGFloat = .zero
        return getRed(nil, green: nil, blue: nil, alpha: &alpha) ? alpha : nil
    }
    
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.rgba ?? (0,0,0,0)
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
private extension NSColor {
    var coreImageColor: CIColor? {
        CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        guard let coreImageColor else {
            return (0, 0, 0, 0)
        }
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
#endif
