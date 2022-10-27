//
//  File.swift
//  
//
//  Created by 김태완 on 2021/04/15.
//

import Foundation

private class CurrentBundleFinder {}

extension Foundation.Bundle {
    //https://stackoverflow.com/questions/64540082/xcode-12-swiftui-preview-doesnt-work-on-swift-package-when-have-another-swift
    public static var colorAssetTests: Bundle = {
        
        /* The name of your local package, prepended by "LocalPackages_" for iOS and "PackageName_" for macOS. You may have same PackageName and TargetName*/

        let bundleName = "ColorAsset_ColorAssetTests"

        let candidates = [

            /* Bundle should be present here when the package is linked into an App. */

            Bundle.main.resourceURL,

            /* Bundle should be present here when the package is linked into a framework. */

            Bundle(for: CurrentBundleFinder.self).resourceURL,

            /* For command-line tools. */

            Bundle.main.bundleURL,

            /* Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/"). */

            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),

            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),

        ]
        
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        fatalError("unable to find bundle")

    }()

}
