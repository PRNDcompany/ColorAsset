//  Copyright © 2024 PRND. All rights reserved.

import Foundation


public protocol ColorAssetConvertible {
    func convert(_ color: ColorAsset) -> ColorAsset
}

extension ColorAsset {
    public func convert(_ converter: ColorAssetConvertible) -> ColorAsset {
        converter.convert(self)
    }
}
