// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoresizingScrollView",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    
    products: [
        .library(
            name: "AutoresizingScrollView",
            targets: ["AutoresizingScrollView"]),
    ],
    
    dependencies: [],
    targets: [
        .target(
            name: "AutoresizingScrollView",
            dependencies: []),
        .testTarget(
            name: "AutoresizingScrollViewTests",
            dependencies: ["AutoresizingScrollView"]),
    ],
    swiftLanguageVersions: [.v5]
)
