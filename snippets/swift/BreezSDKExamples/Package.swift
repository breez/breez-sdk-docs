// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BreezSDKDocs",
    platforms: [.macOS(.v12)],
    dependencies: [
        .package(url:"https://github.com/apple/example-package-figlet", branch: "main"),
        .package(url: "https://github.com/breez/breez-sdk-swift", from:"0.2.9")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "BreezSDKDocs",
            dependencies: [
                .product(name: "Figlet", package: "example-package-figlet"),
                .product(name: "BreezSDK", package: "breez-sdk-swift"),
            ],
            path: "Sources"),
    ]
)
