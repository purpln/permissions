// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Permissions",
    defaultLocalization: "en",
    platforms: [.iOS(.v10), .macOS(.v10_14), .tvOS(.v11), .watchOS(.v3)],
    products: [//HealthPermission
        .library(name: "AuthenticationPermision",     type: .dynamic, targets: ["AuthenticationPermision"    ]),
        .library(name: "BluetoothPermission",         type: .dynamic, targets: ["BluetoothPermission"        ]),
        .library(name: "CalendarPermission",          type: .dynamic, targets: ["CalendarPermission"         ]),
        .library(name: "CameraPermission",            type: .dynamic, targets: ["CameraPermission"           ]),
        .library(name: "ContactsPermission",          type: .dynamic, targets: ["ContactsPermission"         ]),
        .library(name: "HealthPermission",            type: .dynamic, targets: ["HealthPermission"           ]),
        .library(name: "LocationAlwaysPermission",    type: .dynamic, targets: ["LocationAlwaysPermission"   ]),
        .library(name: "LocationWhenInUsePermission", type: .dynamic, targets: ["LocationWhenInUsePermission"]),
        .library(name: "MicrophonePermission",        type: .dynamic, targets: ["MicrophonePermission"       ]),
        .library(name: "MotionPermission",            type: .dynamic, targets: ["MotionPermission"           ]),
        .library(name: "MusicPermission",             type: .dynamic, targets: ["MusicPermission"            ]),
        .library(name: "NotificationPermission",      type: .dynamic, targets: ["NotificationPermission"     ]),
        .library(name: "PhotosPermission",            type: .dynamic, targets: ["PhotosPermission"           ]),
        .library(name: "RemindersPermission",         type: .dynamic, targets: ["RemindersPermission"        ]),
        .library(name: "SiriPermission",              type: .dynamic, targets: ["SiriPermission"             ]),
        .library(name: "SpeechPermission",            type: .dynamic, targets: ["SpeechPermission"           ]),
        .library(name: "TrackingPermission",          type: .dynamic, targets: ["TrackingPermission"         ]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Permissions", dependencies: [],
                resources: [.process("Resources")],
                swiftSettings: [.define("PERMISSIONS_SPM")]),
        .target(name: "AuthenticationPermision", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_AUTHENTICATION"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "BluetoothPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_BLUETOOTH"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "CalendarPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_CALENDAR"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "CameraPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_CAMERA"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "ContactsPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_CONTACTS"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "HealthPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_HEALTH"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "LocationAlwaysPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_LOCATION_ALWAYS"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "LocationWhenInUsePermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_LOCATION_WHENINUSE"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "MicrophonePermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_MICROPHONE"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "MotionPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_MOTION"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "MusicPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_MUSIC"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "NotificationPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_NOTIFICATION"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PhotosPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_PHOTOS"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "RemindersPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_REMINDERS"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "SiriPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_SIRI"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "SpeechPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_SPEECH"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "TrackingPermission", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_TRACKING"),
                    .define("PERMISSIONS_SPM")
                ]),
    ],
    swiftLanguageVersions: [.v5]
)
