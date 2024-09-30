// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataSource",
            targets: ["DataSource"]
        ),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "Repositories", targets: ["Repositories"])
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataSource",
            dependencies: [
                "Models",
                .product(name: "ReactiveMoya", package: "Moya")
            ]
        ),
        .target(name: "Models"),
        .target(name: "Repositories", dependencies: [
            "DataSource",
            .product(name: "Entities", package: "Domain"),
            .product(name: "RepositoryProtocol", package: "Domain")
        ]),
        .testTarget(name: "RepositoriesTests", dependencies: ["Repositories"])
    ]
)
