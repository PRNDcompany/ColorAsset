//  Copyright © 2021 PRND. All rights reserved.

import Foundation


public extension ColorAsset {
    @available(*, deprecated, message: "Alpha(ColorAssetConvertible)를 사용하세요")
    func with(alpha: Double) -> ColorAsset {
        var color = self
        color.alpha = alpha
        return color
    }
}
