// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "AppLibrary",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "AppViews", type: .dynamic, targets: ["AppViews"]),
        .library(name: "Library", type: .dynamic, targets: ["Library"]),
        .library(name: "SampleComponent", type: .dynamic, targets: ["SampleComponent"]),
    ],
    dependencies: [
        .package(name: "CatalogKit", url: "https://github.com/touyou/CatalogKit", .branch("main")),
    ],
    targets: [
        .target(name: "AppViews", dependencies: [
            .target(name: "SampleComponent"),
            .target(name: "Library")
        ]),
        .target(name: "Library", dependencies: []),
        .target(name: "SampleComponent", dependencies: [
            .product(name: "CatalogKit", package: "CatalogKit")
        ]),
        .testTarget(name: "SampleComponentTests", dependencies: ["SampleComponent"]),
    ]
)
