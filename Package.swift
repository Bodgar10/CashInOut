// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "CashInOut",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CashInOut",
            targets: ["CashInOut"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Bodgar10/DesignSystem.git", .upToNextMajor(from: "1.0.7")),
        .package(url: "https://github.com/Bodgar10/Common.git", .upToNextMajor(from: "1.0.4")),
        .package(url: "https://github.com/Bodgar10/CashSwitchboard.git", .upToNextMajor(from: "1.0.4"))
    ],
    targets: [
        .target(
            name: "CashInOut", 
            dependencies:
                [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "Common", package: "Common"),
                .product(name: "CashSwitchboard", package: "CashSwitchboard")
                ]
        ),
        .testTarget(
            name: "CashInOutTests",
            dependencies: ["CashInOut"]),
    ],
    swiftLanguageVersions: [.v5]
)
