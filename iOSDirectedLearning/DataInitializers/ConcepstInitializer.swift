
import SwiftUI

// MARK: - Text and Shapes
enum TextAndShapesTopic: String, CaseIterable, ConceptType {
    case textConcept
    case shapesConcept
    case maskConcept
    case customShapesConcept
    case customShapesWithArcsAndQuadCurvesConcept
    case animateCustomShapesWithAnimateableDataConcept

    var title: String {
        switch self {
        case .textConcept:
            return "Text"
        case .shapesConcept:
            return "Shapes"
        case .maskConcept:
            return "Mask"
        case .customShapesConcept:
            return "Custom Shapes"
        case .customShapesWithArcsAndQuadCurvesConcept:
            return "Arcs and Quad Curves"
        case .animateCustomShapesWithAnimateableDataConcept:
            return "Animating Custom Shapes"
        }
    }

    var description: String {
        switch self {
        case .textConcept:
            return "A showcase of basic text modifiers"
        case .shapesConcept:
            return "Exploring built in shapes"
        case .maskConcept:
            return "Applying mask with animation."
        case .customShapesConcept:
            return "Drawing custom shapes with straight lines."
        case .customShapesWithArcsAndQuadCurvesConcept:
            return "Drawing custom shapes with arcs and curves."
        case .animateCustomShapesWithAnimateableDataConcept:
            return "Animating Custom Shapes"
        }
    }
    
    var complexity: Complexity {
        switch self {
        case .textConcept:
            return .beginner
        case .shapesConcept:
            return .beginner
        case .maskConcept:
            return .intermediate
        case .customShapesConcept:
            return .advanced
        case .customShapesWithArcsAndQuadCurvesConcept:
            return .advanced
        case .animateCustomShapesWithAnimateableDataConcept:
            return .beginner
        }
    }

    func view() -> AnyView {
        switch self {
        case .textConcept:
            return AnyView(TextExampleView())
        case .shapesConcept:
            return AnyView(ShapesExampleView())
        case .maskConcept:
            return AnyView(MaskExampleView())
        case .customShapesConcept:
            return AnyView(CustomShapesConceptView())
        case .customShapesWithArcsAndQuadCurvesConcept:
            return AnyView(CustomShapesWithArcsAndQuadCurvesConceptView())
        case .animateCustomShapesWithAnimateableDataConcept:
            return AnyView(Text("Coming Soon"))
        }
    }

    var id: String { rawValue }
}

// MARK: - Colors and Gradients
enum ColorsAndGradientsConcept: String, CaseIterable, ConceptType {
    case colorsConcept
    case gradientsConcept
    case dynamicColorsConcept
    case systemMaterialsAndBackgroundsConcept

    var title: String {
        switch self {
        case .colorsConcept:
            return "Colors"
        case .gradientsConcept:
            return "Gradients"
        case .dynamicColorsConcept:
            return "Dynamic Colors"
        case .systemMaterialsAndBackgroundsConcept:
            return "System Materials and Backgrounds"
        }
    }

    var description: String {
        switch self {
        case .colorsConcept:
            return "Colors"
        case .gradientsConcept:
            return "Gradients"
        case .dynamicColorsConcept:
            return "Dynamic Colors"
        case .systemMaterialsAndBackgroundsConcept:
            return "System Materials and Backgrounds"
        }
    }
    
    var complexity: Complexity {
        switch self {
        case .colorsConcept:
            return .beginner
        case .gradientsConcept:
            return .beginner
        case .dynamicColorsConcept:
            return .beginner
        case .systemMaterialsAndBackgroundsConcept:
            return .beginner
        }
    }

    func view() -> AnyView {
        switch self {
        case .colorsConcept:
            return AnyView(Text("Coming Soon"))
        case .gradientsConcept:
            return AnyView(Text("Coming Soon"))
        case .dynamicColorsConcept:
            return AnyView(Text("Coming Soon"))
        case .systemMaterialsAndBackgroundsConcept:
            return AnyView(Text("Coming Soon"))
        }
    }

    var id: String { rawValue }
}
