// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shell",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "Shell", targets: ["Shell"]),
    ],
    targets: [
        .target(
            name: "Shell"
        ),
        .testTarget(name: "ShellTests", dependencies: ["Shell"]),
    ]
)

//for target in package.targets {
//    target.swiftSettings = target.swiftSettings ?? []
//    target.swiftSettings?.append(
//        .unsafeFlags([
//            "-Xfrontend", "-warn-long-expression-type-checking=100",
//            "-Xfrontend", "-warn-long-function-bodies=100",
//            "-Xfrontend", "-warn-concurrency",
//            "-Xfrontend", "-enable-actor-data-race-checks",
//            "-enable-library-evolution",
//            "-enable-testing"
//        ])
//    )
//}
