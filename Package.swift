// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Permissions",
    defaultLocalization: "en",
    platforms: [.iOS(.v10), .macOS(.v10_14), .tvOS(.v11), .watchOS(.v3)],
    products: [
        .library(name: "AuthenticationPermision", targets: ["AuthenticationPermision"]),
        .library(name: "BluetoothPermission", targets: ["BluetoothPermission"]),
        .library(name: "CalendarPermission", targets: ["CalendarPermission"]),
        .library(name: "CameraPermission", targets: ["CameraPermission"]),
        .library(name: "ContactsPermission", targets: ["ContactsPermission"]),
        .library(name: "HealthPermission", targets: ["HealthPermission"]),
        .library(name: "LocationAlwaysPermission", targets: ["LocationAlwaysPermission"]),
        .library(name: "LocationWhenInUsePermission", targets: ["LocationWhenInUsePermission"]),
        .library(name: "MicrophonePermission", targets: ["MicrophonePermission"]),
        .library(name: "MotionPermission", targets: ["MotionPermission"]),
        .library(name: "MusicPermission", targets: ["MusicPermission"]),
        .library(name: "NotificationPermission", targets: ["NotificationPermission"]),
        .library(name: "PhotosPermission", targets: ["PhotosPermission"]),
        .library(name: "RemindersPermission", targets: ["RemindersPermission"]),
        .library(name: "SiriPermission", targets: ["SiriPermission"]),
        .library(name: "SpeechPermission", targets: ["SpeechPermission"]),
        .library(name: "TrackingPermission", targets: ["TrackingPermission"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Permissions", dependencies: [],
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
