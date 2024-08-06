// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "CashInOut",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CashInOut",
            targets: ["CashInOut"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CashInOut"),
        .testTarget(
            name: "CashInOutTests",
            dependencies: ["CashInOut"]),
    ],
    swiftLanguageVersions: [.v5]
)