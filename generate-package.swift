import Foundation

func packageString(url: String, checksum: String) -> String {
    """
    // swift-tools-version:5.3
    import PackageDescription
    let package = Package(
        name: "MatrixSDK",
        products: [
            .library(name: "MatrixSDK", targets: ["MatrixSDK"])
        ],
        dependencies: [
            .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver", .exact("\(swiftyBeaverVersion())"))
        ],
        targets: [
            .binaryTarget(name: "MatrixSDK", url: "\(url)", checksum: "\(checksum)")
        ]
    )
    
    """
}

func swiftyBeaverVersion() -> String {
    // load Podfile.lock
    let lockFileURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        .appendingPathComponent("matrix-ios-sdk")
        .appendingPathComponent("Podfile.lock")
    
    guard let lockFile = try? String(contentsOf: lockFileURL) else {
        fatalError("Unable to read Podfile.lock")
    }
    
    // find the first occurance of SwiftyBeaver
    // this should be in the PODS: section in the format
    // - SwiftyBeaver (x.x.x)
    guard let swiftyBeaverLock = lockFile.components(separatedBy: .newlines).first(where: { $0.contains("- SwiftyBeaver") }) else {
        fatalError("Unable to find SwiftyBeaver in Podfile.lock")
    }
    
    // match the version in the brackets
    guard let range = swiftyBeaverLock.range(of: #"(?<=\().*?(?=\))"#, options: .regularExpression) else {
        fatalError("Unable to detect SwiftyBeaver's version from Podfile.lock")
    }
    
    let version = swiftyBeaverLock[range]
    print("SwiftyBeaver dependency version: \(version)\n")
    
    return String(version)
}

guard CommandLine.arguments.count == 3 else {
    fatalError("Usage: swiftc generate-package.swift url checksum")
}

print("Generating binary package")
print("• URL: \(CommandLine.arguments[1])")
print("• Checksum: \(CommandLine.arguments[2]) \n")

guard let data = packageString(url: CommandLine.arguments[1], checksum: CommandLine.arguments[2]).data(using: .utf8) else {
    fatalError("Error creating data.")
}

do {
    try data.write(to: URL(fileURLWithPath: "./Package.swift"))
} catch {
    fatalError("Error writing package manifest to disk.")
}

print("Package manifest succesfully written to disk.")
