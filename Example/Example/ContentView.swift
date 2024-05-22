//  Copyright © 2022 PRND. All rights reserved.

import SwiftUI

import ColorAsset

struct ContentView: View {
    var colors: [ColorAsset] = [
        ColorAsset.baseWhite,
        ColorAsset.baseBlack,
        ColorAsset.basePrimary,
        ColorAsset.base8,
        ColorAsset.base16,
        ColorAsset.base32
    ]
    
    var body: some View {
        Form {
            ForEach(colors, id: \.self) {
                Text("This is PRND OpenSource")
                    .foregroundColor(.asset($0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
