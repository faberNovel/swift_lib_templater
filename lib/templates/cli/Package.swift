// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TEMPLATE",
    platforms: [
        .macOS(.v10_14),
    ],
    products: [
        .executable(name: "TEMPLATE-CLI", targets: ["TEMPLATE-CLI"]),
        .library(name: "TEMPLATE", targets: ["TEMPLATE"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.1")
    ],
    targets: [
        .target(name: "TEMPLATE", dependencies: [], path: "Sources/TEMPLATE"),
        .target(
            name: "TEMPLATE-CLI",
            dependencies: [
                "TEMPLATE",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "Sources/CLI"
        ),
        .testTarget(
            name: "TEMPLATETests",
            dependencies: ["TEMPLATE"]
        ),
    ]
)
