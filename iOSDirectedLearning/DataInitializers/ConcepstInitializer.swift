import SwiftUI

// MARK: - Text and Shapes Concepts
struct TextAndShapesConcepts {
    static let textConcept = Concept(
        title: "Text",
        description: "A showcase of basic text modifiers.",
        complexity: .beginner,
        view: AnyView(TextExampleView()),
        githubLink: "https://github.com/Szymon-Michalak/iOS-Directed-Learning/blob/main/iOSDirectedLearning/ConceptViews/UIComponents/TextAndShapes/TextExampleView.swift"
    )

    static let shapesConcept = Concept(
        title: "Shapes",
        description: "Exploring built in shapes.",
        complexity: .beginner,
        view: AnyView(ShapesExampleView())
    )

    static let maskConcept = Concept(
        title: "Mask",
        description: "Applying mask with animation.",
        complexity: .intermediate,
        view: AnyView(MaskExampleView())
    )

    static let customShapesConcept = Concept(
        title: "Custom Shapes",
        description: "Drawing custom shapes with straight lines.",
        complexity: .advanced,
        view: AnyView(CustomShapesConceptView())
    )

    static let customShapesWithArcsAndQuadCurvesConcept = Concept(
        title: "Arcs and Quad Curves",
        description: "Drawing custom shapes with arcs and curves.",
        complexity: .advanced,
        view: AnyView(CustomShapesWithArcsAndQuadCurvesConceptView())
    )

    static let customShapesWithAnimateableDataConcept = Concept(
        title: "Animating Custom Shapes",
        description: "Animating custom shapes using animateable data.",
        complexity: .advanced,
        view: AnyView(AnimatingCustomShapesConceptView())
    )

    static let all: [Concept] = [
        textConcept,
        shapesConcept,
        maskConcept,
        customShapesConcept,
        customShapesWithArcsAndQuadCurvesConcept,
        customShapesWithAnimateableDataConcept
    ]
}

// MARK: - Colors and Gradients Concepts
struct ColorsAndGradientsConcepts {
    static let colorsConcept = Concept(
        title: "Colors",
        description: "Colors",
        complexity: .beginner,
        view: AnyView(Text("Coming Soon"))
    )

    static let gradientsConcept = Concept(
        title: "Gradients",
        description: "Gradients",
        complexity: .beginner,
        view: AnyView(Text("Coming Soon"))
    )

    static let dynamicColorsConcept = Concept(
        title: "Dynamic Colors",
        description: "Dynamic Colors",
        complexity: .beginner,
        view: AnyView(Text("Coming Soon"))
    )

    static let systemMaterialsAndBackgroundsConcept = Concept(
        title: "System Materials and Backgrounds",
        description: "System Materials and Backgrounds",
        complexity: .beginner,
        view: AnyView(Text("Coming Soon"))
    )

    static let all: [Concept] = [
        colorsConcept,
        gradientsConcept,
        dynamicColorsConcept,
        systemMaterialsAndBackgroundsConcept
    ]
}
