// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SampleComponent",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SampleComponent",
            targets: ["SampleComponent"]),
    ],
    dependencies: [
        .package(url: "../../CatalogKit", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SampleComponent",
            dependencies: ["CatalogKit"]),
        .testTarget(
            name: "SampleComponentTests",
            dependencies: ["SampleComponent"]),
    ]
)
