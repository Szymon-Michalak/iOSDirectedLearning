import Foundation

// MARK: - Categories
enum CategoryInitializer {
    static let categories: [Category] = [
        Category(title: "SwiftUI",
                 description: "Declarative UI",
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
                 topics: [

        ]),
        Category(title: "Apple Frameworks",
                 description: "Concepts from all around the developer",
                 topics: [
                    coreDataTopic,
                    combineTopic,
                    cloudKitTopic
        ]),
        Category(title: "Swift Packages",
                 description: "Swift Packages",
                 topics: [
                    firebaseTopic,
                    packageManagerTopic,
                    uiPackageManagerTopic,
                    securityPackagesTopic

        ]),
        Category(title: "Software Development",
                 description: "Common concepts from iOS",
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
