// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NWCommonOC",
    products: [
        .library(
            name: "NWCommonOC",
            targets: ["NWCommonOC"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NWCommonOC",
            dependencies: []),
        .testTarget(
            name: "NWCommonOCTests",
            dependencies: ["NWCommonOC"]),
    ]
)
