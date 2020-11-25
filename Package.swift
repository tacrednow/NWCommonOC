// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NWCommonOC",
    platforms: [.macOS(.v10_10),
                .iOS(.v9),
                .tvOS(.v9),
                .watchOS(.v2)],
    products: [
        .library(
            name: "NWCommonOC",
            targets: ["NWCommonOC"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "NWCommonOC",
                          path: "Sources/NWCommonOC",
                          publicHeadersPath: ""),
        .testTarget(
            name: "NWCommonOCTests",
            dependencies: ["NWCommonOC"]),
    ]
)
