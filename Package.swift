// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "MatrixSDK",
    products: [
        .library(name: "MatrixSDK", targets: ["MatrixSDK"])
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver", .exact("1.9.5"))
    ],
    targets: [
        .binaryTarget(name: "MatrixSDK", url: "https://github.com/pixlwave/MatrixSDK/releases/download/v0.19.0/MatrixSDK.xcframework.zip", checksum: "71879ff9f3d209241ac40d8f1cc8345c84c42de563d08fd41b82de7ffa36d114")
    ]
)
