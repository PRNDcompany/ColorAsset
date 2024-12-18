// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorAsset",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .macCatalyst(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "ColorAsset", targets: ["ColorAsset"]),
    ],
    targets: [
        .target(name: "ColorAsset", dependencies: []),
        .testTarget(name: "ColorAssetTests", dependencies: ["ColorAsset"]),
    ]
)
