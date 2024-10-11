//  Copyright © 2021 PRND. All rights reserved.

import SwiftUI


public extension Color {

    @available(*, deprecated, renamed: "Color(asset:)", message: "This initializer will be removed soon. Please use Color(asset:) instead.")
    init(_ color: ColorAsset) {
        self.init(asset: color)
    }

    init(asset color: ColorAsset) {
        switch color.colorType {
        case let .literal(red, green, blue):
            self = Color(.sRGB, red: red, green: green, blue: blue, opacity: color.alpha)

        case let .asset(named, bundle):
            let _color = Color(named, bundle: bundle)
            if let opacity = color._alpha {
                self = _color.opacity(opacity)
            } else {
                self = _color
            }
        }
    }

    static func asset(_ color: ColorAsset) -> Color {
        Color(asset: color)
    }
}


public extension ColorAsset {
    func toColor() -> Color {
        Color(asset: self)
    }
}
