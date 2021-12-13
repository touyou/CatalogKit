// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "AppLibrary",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "AppViews", type: .dynamic, targets: ["AppViews"]),
        .library(name: "Library", type: .dynamic, targets: ["Library"]),
        .library(name: "SampleComponent", type: .dynamic, targets: ["SampleComponent"]),
        .library(name: "FigmaComponents", type: .dynamic, targets: ["FigmaComponents"])
    ],
    dependencies: [
        .package(name: "CatalogKit", url: "https://github.com/touyou/CatalogKit.git", .branch("main")),
    ],
    targets: [
        .target(name: "AppViews", dependencies: [
            .target(name: "SampleComponent"),
            .target(name: "Library"),
            .target(name: "FigmaComponents")
        ], resources: [
            .process("FirstViewController/FirstViewController.storyboard")
        ]),
        .target(name: "FigmaComponents", dependencies: [], resources: [.process("Resource")]),
        .target(name: "Library", dependencies: []),
        .target(name: "SampleComponent", dependencies: [
            .product(name: "CatalogKit", package: "CatalogKit"),
            .target(name: "FigmaComponents")
        ]),
        .testTarget(name: "SampleComponentTests", dependencies: ["SampleComponent"]),
    ]
)
