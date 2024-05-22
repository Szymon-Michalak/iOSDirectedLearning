import Foundation

// MARK: - Categories
enum CategoryInitializer {
    static let categories: [Category] = [
        Category(title: "UI Components", concepts: [
            AnyConcept(textAndShapesConcept),
            AnyConcept(colorsAndGradientsConcept),
            // Add other concepts...
        ]),
        // Add other categories...
    ]
}

// MARK: - UI Components
extension CategoryInitializer {
    static let textAndShapesConcept: Concept<TextAndShapesConcept> = Concept(
        title: "Text and Shapes",
        examples: TextAndShapesConcept.allCases.map { Example(type: $0) }
    )

    static let colorsAndGradientsConcept: Concept<ColorsAndGradientsConcept> = Concept(
        title: "Colors and Gradients",
        examples: ColorsAndGradientsConcept.allCases.map { Example(type: $0) }
    )
}
