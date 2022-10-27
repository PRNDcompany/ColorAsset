//
//  ColorAsset+Constant.swift
//  Example
//
//  Created by woody on 2022/12/09.
//

import ColorAsset

extension ColorAsset {
    static var baseWhite = ColorAsset(hex: "#FFFFFF")
    static var baseBlack = ColorAsset(hex: "#000000")

    static var basePrimary = ColorAsset(hex: "#88FF44")
    static var base32 = ColorAsset.basePrimary.with(alpha: 0.32)
    static var base16 = ColorAsset.basePrimary.with(alpha: 0.16)
    static var base8 = ColorAsset.basePrimary.with(alpha: 0.08)
}
