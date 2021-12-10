// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CatalogKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CatalogKit",
            targets: ["CatalogKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CatalogKit",
            dependencies: []),
        .testTarget(
            name: "CatalogKitTests",
            dependencies: ["CatalogKit"]),
    ]
)
