import Foundation

// MARK: - Categories
enum DataInitializer {
    static let categories: [Category] = [
        Category(title: "UI Components", topics: [
            AnyTopic(textAndShapesTopic),
            AnyTopic(colorsAndGradientsTopic)
            // Add other concepts...
        ])
        // Add other categories...
    ]
}

// MARK: - UI Components
extension DataInitializer {
    static let textAndShapesTopic: Topic<TextAndShapesTopic> = Topic(
        title: "Text and Shapes",
        concepts: TextAndShapesTopic.allCases.map { Concept(type: $0) }
    )

    static let colorsAndGradientsTopic: Topic<ColorsAndGradientsConcept> = Topic(
        title: "Colors and Gradients",
        concepts: ColorsAndGradientsConcept.allCases.map { Concept(type: $0) }
    )
}
