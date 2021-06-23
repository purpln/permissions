// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Permissions",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_14),
        .tvOS(.v11),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "NotificationPermission", type: .dynamic, targets: ["NotificationPermission"]),
        .library(name: "BluetoothPermission", type: .dynamic, targets: ["BluetoothPermission"])
    ],
    dependencies: [],
    targets: [
        .target(name: "Permissions", dependencies: [],
                resources: [.process("Resources")],
                swiftSettings: [.define("PERMISSIONS_SPM")]),
        .target(name: "NotificationPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_NOTIFICATION"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "BluetoothPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_BLUETOOTH"),
                    .define("PERMISSIONS_SPM")
                ])
    ],
    swiftLanguageVersions: [.v5]
)
