// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MatrixSDK",
    products: [
        .library(name: "MatrixSDK", targets: ["MatrixSDK"])
    ],
    targets: [
        .binaryTarget(name: "MatrixSDK", url: "https://github.com/pixlwave/MatrixSDK/releases/download/v0.19.0/MatrixSDK.xcframework.zip", checksum: "da1010a112be7fb43aaf1e3d82b86812affc211b0ff0b60e66ae55429e448684")
    ]
)
