// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoresizingScrollView",
    platforms: [
        .iOS("6.0"),
        .tvOS("9.0")
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
    swiftLanguageVersions: [.version("5.7")]
)
