// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MatrixSDK",
    products: [
        .library(name: "MatrixSDK", targets: ["MatrixSDK"])
    ],
    targets: [
        .binaryTarget(name: "MatrixSDK", url: "https://github.com/pixlwave/MatrixSDK/releases/download/v0.18.9/MatrixSDK.xcframework.zip", checksum: "a38d56ece3d3d7acadba8ef4db8ec81c2a250ab4e28ffe61192fac81b6c601a1")
    ]
)
