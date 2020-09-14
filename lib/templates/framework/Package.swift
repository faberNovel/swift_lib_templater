// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "TEMPLATE",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "TEMPLATE",
            targets: ["TEMPLATE"]
        ),
    ],
    targets: [
        .target(
            name: "TEMPLATE",
            path: "Source/Classes"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
