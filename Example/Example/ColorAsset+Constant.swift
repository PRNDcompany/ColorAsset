//  Copyright © 2022 PRND. All rights reserved.

import ColorAsset

extension ColorAsset {
    static var baseWhite = ColorAsset(hex: "#FFFFFF")
    static var baseBlack = ColorAsset(hex: "#000000")

    static var basePrimary = ColorAsset(hex: "#88FF44")
    static var base32 = ColorAsset.basePrimary.alpha(.a32)
    static var base16 = ColorAsset.basePrimary.alpha(.a16)
    static var base8 = ColorAsset.basePrimary.alpha(.a08)
}

extension AlphaComponent {
    static let a32 = AlphaComponent(rawValue: 0.32)
    static let a16 = AlphaComponent(rawValue: 0.16)
    static let a08 = AlphaComponent(rawValue: 0.08)
}
