// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BreezSDKDocs",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/breez/breez-sdk-swift", from:"0.2.14")
        // use a local version of breezsdk
        // .package(path: "<YOUR_PATH_TO_BREEZ_SDK>/libs/sdk-bidning/bindings-swift/")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "BreezSDKDocs",
            dependencies: [
                .product(name: "BreezSDK", package: "breez-sdk-swift"),
                // use a local version of breez-sdk
                // .product(name: "BreezSDK", package: "bindings-swift"),
            ],
            path: "Sources"),
    ]
)
