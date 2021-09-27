// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Permissions",
    defaultLocalization: "en",
    platforms: [.iOS(.v10), .macOS(.v10_14), .tvOS(.v11), .watchOS(.v3)],
    products: [
        .library(name: "PermissionAuthentication", targets: ["PermissionAuthentication"]),
        .library(name: "PermissionBluetooth", targets: ["PermissionBluetooth"]),
        .library(name: "PermissionCalendar", targets: ["PermissionCalendar"]),
        .library(name: "PermissionCamera", targets: ["PermissionCamera"]),
        .library(name: "PermissionContacts", targets: ["PermissionContacts"]),
        .library(name: "PermissionHealth", targets: ["PermissionHealth"]),
        .library(name: "PermissionLocationAlways", targets: ["PermissionLocationAlways"]),
        .library(name: "PermissionLocationWhenInUse", targets: ["PermissionLocationWhenInUse"]),
        .library(name: "PermissionMicrophone", targets: ["PermissionMicrophone"]),
        .library(name: "PermissionMotion", targets: ["PermissionMotion"]),
        .library(name: "PermissionMusic", targets: ["PermissionMusic"]),
        .library(name: "PermissionNotification", targets: ["PermissionNotification"]),
        .library(name: "PermissionPhotos", targets: ["PermissionPhotos"]),
        .library(name: "PermissionReminders", targets: ["PermissionReminders"]),
        .library(name: "PermissionSiri", targets: ["PermissionSiri"]),
        .library(name: "PermissionSpeech", targets: ["PermissionSpeech"]),
        .library(name: "PermissionTracking", targets: ["PermissionTracking"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Permissions", dependencies: [],
                swiftSettings: [.define("PERMISSIONS_SPM")]),
        .target(name: "PermissionAuthentication", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_AUTHENTICATION"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionBluetooth", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_BLUETOOTH"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionCalendar", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_CALENDAR"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionCamera", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_CAMERA"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionContacts", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_CONTACTS"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionHealth", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_HEALTH"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionLocationAlways", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_LOCATION_ALWAYS"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionLocationWhenInUse", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_LOCATION_WHENINUSE"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionMicrophone", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_MICROPHONE"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionMotion", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_MOTION"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionMusic", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_MUSIC"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionNotification", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_NOTIFICATION"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionPhotos", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_PHOTOS"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionReminders", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_REMINDERS"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionSiri", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_SIRI"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionSpeech", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_SPEECH"),
                    .define("PERMISSIONS_SPM")
                ]),
        .target(name: "PermissionTracking", dependencies: [.target(name: "Permissions")],
                swiftSettings: [
                    .define("PERMISSIONS_TRACKING"),
                    .define("PERMISSIONS_SPM")
                ]),
    ],
    swiftLanguageVersions: [.v5]
)
