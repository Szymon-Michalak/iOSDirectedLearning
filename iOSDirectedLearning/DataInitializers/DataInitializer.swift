import Foundation

// MARK: - Categories

enum DataInitializer {
    static let categories: [Category] = [
        Category(title: "UI Components", topics: [
            textAndShapesTopic,
            colorsAndGradientsTopic
        ])
    ]
}

extension DataInitializer {
    static let textAndShapesTopic: Topic = Topic(title: "Text and Shapes", concepts: TextAndShapesConcepts.all)
    static let colorsAndGradientsTopic: Topic = Topic(title: "Colors and Gradients", concepts: ColorsAndGradientsConcepts.all)
}
