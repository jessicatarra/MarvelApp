// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Entities",
            targets: ["Entities"]
        ),
        .library(name: "Failures", targets: ["Failures"]),
        .library(name: "RepositoryProtocol", targets: ["RepositoryProtocol"]),
        .library(name: "UseCaseProtocol", targets: ["UseCaseProtocol"]),
        .library(name: "UseCases", targets: ["UseCases"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Entities",
            dependencies: []
        ),
        .target(
            name: "Failures",
            dependencies: []
        ),
        .target(name: "RepositoryProtocol", dependencies: ["Entities", "Failures"]),
        .target(name: "UseCaseProtocol", dependencies: ["Entities", "Failures", "RepositoryProtocol"]),
        .target(name: "UseCases", dependencies: ["Entities", "Failures", "UseCaseProtocol"])
    ]
)
