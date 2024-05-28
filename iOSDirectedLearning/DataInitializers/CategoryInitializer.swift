import Foundation

// MARK: - Categories
enum CategoryInitializer {
    static let categories: [Category] = [
        Category(title: "SwiftUI",
                 description: "Declarative UI",
                 image: "category/swiftui",
                 topics: [
                    textAndShapesTopic,
                    colorsAndGradientsTopic,
                    imagesAndIconsTopic,
                    layoutsAndFramesTopic,
                    modifiersAndControlsTopic,
                    navigationTopic,
                    dataHandlingTopic,
                    interactionsTopic,
                    advancedTechniquesTopic
        ]),
        Category(title: "UIKit",
                 description: "Imperative UI",
                 image: "category/uikit",
                 topics: [

        ]),
        Category(title: "Apple Frameworks",
                 description: "Apple Frameworks",
                 image: "category/apple",
                 topics: [
                    coreDataTopic,
                    combineTopic,
                    cloudKitTopic
        ]),
        Category(title: "Swift Packages",
                 description: "Swift Packages",
                 image: "category/swift",
                 topics: [
                    firebaseTopic,
                    packageManagerTopic,
                    uiPackageManagerTopic,
                    securityPackagesTopic

        ]),
        Category(title: "Software Development",
                 description: "Common concepts from iOS",
                 image: "category/ios",
                 topics: [
                    accessibilityTopic,
                    gitAndSourceControlTopic,
                    dataStructuresAndAlgorithmsTopic,
                    swiftLanguageFeaturesTopic,
                    networkingTopic,
                    fileManagementTopic,
                    concurrencyTopic,
                    testingTopic
        ])
    ]
}
