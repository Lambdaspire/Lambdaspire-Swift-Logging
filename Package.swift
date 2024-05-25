// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LambdaspireLogging",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "LambdaspireLogging",
            targets: ["LambdaspireLogging"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Lambdaspire/Lambdaspire-Swift-Abstractions",
            from: .init(stringLiteral: "0.0.1"))
    ],
    targets: [
        .target(
            name: "LambdaspireLogging",
            dependencies: [
                .product(name: "LambdaspireAbstractions", package: "Lambdaspire-Swift-Abstractions")
            ]),
        .testTarget(
            name: "LambdaspireLoggingTests",
            dependencies: ["LambdaspireLogging"]),
    ]
)
