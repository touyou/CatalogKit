// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppLibrary",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "AppViews", targets: ["AppViews"]),
        .library(name: "SampleComponent", targets: ["SampleComponent"]),
    ],
    dependencies: [
        .package(url: "https://github.com/touyou/CatalogKit", from: "1.0.0"),
    ],
    targets: [
        .target(name: "AppViews", dependencies: ["SampleComponent"]),
        .target(
            name: "SampleComponent",
            dependencies: ["CatalogKit"]),
        .testTarget(
            name: "SampleComponentTests",
            dependencies: ["SampleComponent"]),
    ]
)
