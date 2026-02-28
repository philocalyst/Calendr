// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Calendr",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", from: "6.10.1"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.3.0"),
        .package(url: "https://github.com/pointfreeco/swift-clocks", from: "1.0.6"),
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.58.0"),
        .package(url: "https://github.com/sindresorhus/KeyboardShortcuts", exact: "2.4.0"),
        .package(url: "https://github.com/weichsel/ZIPFoundation", from: "0.9.20")
    ],
    targets: [
        .target(
            name: "CalendrObjC",
            path: "Calendr/ObjC",
            publicHeadersPath: "."
        ),
        .executableTarget(
            name: "Calendr",
            dependencies: [
                "CalendrObjC",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "Clocks", package: "swift-clocks"),
                .product(name: "Sentry", package: "sentry-cocoa"),
                .product(name: "KeyboardShortcuts", package: "KeyboardShortcuts"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ],
            path: "Calendr",
            exclude: [
                "Config/Info.plist",
                "Config/Calendr.entitlements",
                "Config/swiftgen.yml",
                "Config/Calendr-Bridging-Header.h",
                "ObjC",
                "Assets/SyncLocalizations.swift"
            ],
            resources: [
                .process("Assets/Images.xcassets"),
                .process("Assets/en.lproj"),
                .process("Assets/pt.lproj"),
                .process("Assets/nl.lproj"),
                .process("Assets/fr.lproj"),
                .process("Assets/ru.lproj"),
                .process("Assets/pl.lproj"),
                .process("Assets/tr.lproj"),
                .process("Assets/ko.lproj"),
                .process("Assets/cs.lproj"),
                .process("Assets/sv.lproj"),
                .process("Assets/sk.lproj"),
                .process("Assets/it.lproj"),
                .process("Assets/es.lproj"),
                .process("Assets/uk.lproj"),
                .process("Assets/sq.lproj"),
                .process("Assets/ja.lproj"),
                .process("Assets/zh-Hans.lproj"),
                .process("Assets/el.lproj"),
                .process("Assets/zh-Hant-TW.lproj"),
                .process("Assets/he.lproj"),
                .process("Assets/de.lproj")
            ]
        ),
        .testTarget(
            name: "CalendrTests",
            dependencies: [
                "Calendr",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxTest", package: "RxSwift"),
                .product(name: "Clocks", package: "swift-clocks")
            ],
            path: "CalendrTests",
            exclude: [
                "Info.plist",
                "UnitTests.xctestplan"
            ]
        )
    ]
)
