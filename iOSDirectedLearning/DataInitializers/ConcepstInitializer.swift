
import SwiftUI

// MARK: - Text and Shapes
enum TextAndShapesConcept: String, CaseIterable, ExampleType {
    case textExample
    case shapesExample
    case maskExample
    case customShapesExample
    case customShapesWithArcsAndQuadCurves
    case animateCustomShapesWithAnimateableData

    var title: String {
        switch self {
        case .textExample:
            return "Text"
        case .shapesExample:
            return "Shapes"
        case .maskExample:
            return "Mask"
        case .customShapesExample:
            return "Custom Shapes"
        case .customShapesWithArcsAndQuadCurves:
            return "Arcs and Quad Curves"
        case .animateCustomShapesWithAnimateableData:
            return "Animating Custom Shapes"
        }
    }

    var description: String {
        switch self {
        case .textExample:
            return "A showcase of basic text modifiers"
        case .shapesExample:
            return "Exploring built in shapes"
        case .maskExample:
            return "Applying mask with animation."
        case .customShapesExample:
            return "Custom Shapes"
        case .customShapesWithArcsAndQuadCurves:
            return "Arcs and Quad Curves"
        case .animateCustomShapesWithAnimateableData:
            return "Animating Custom Shapes"
        }
    }
    
    var complexity: Complexity {
        switch self {
        case .textExample:
            return .beginner
        case .shapesExample:
            return .beginner
        case .maskExample:
            return .intermediate
        case .customShapesExample:
            return .beginner
        case .customShapesWithArcsAndQuadCurves:
            return .beginner
        case .animateCustomShapesWithAnimateableData:
            return .beginner
        }
    }

    func view() -> AnyView {
        switch self {
        case .textExample:
            return AnyView(TextExampleView())
        case .shapesExample:
            return AnyView(ShapesExampleView())
        case .maskExample:
            return AnyView(MaskExampleView())
        case .customShapesExample:
            return AnyView(Text("Coming Soon"))
        case .customShapesWithArcsAndQuadCurves:
            return AnyView(Text("Coming Soon"))
        case .animateCustomShapesWithAnimateableData:
            return AnyView(Text("Coming Soon"))
        }
    }

    var id: String { rawValue }
}

// MARK: - Colors and Gradients
enum ColorsAndGradientsConcept: String, CaseIterable, ExampleType {
    case colorsExample
    case gradientsExample
    case dynamicColorsExample
    case systemMaterialsAndBackgrounds

    var title: String {
        switch self {
        case .colorsExample:
            return "Colors"
        case .gradientsExample:
            return "Gradients"
        case .dynamicColorsExample:
            return "Dynamic Colors"
        case .systemMaterialsAndBackgrounds:
            return "System Materials and Backgrounds"
        }
    }

    var description: String {
        switch self {
        case .colorsExample:
            return "Colors"
        case .gradientsExample:
            return "Gradients"
        case .dynamicColorsExample:
            return "Dynamic Colors"
        case .systemMaterialsAndBackgrounds:
            return "System Materials and Backgrounds"
        }
    }
    
    var complexity: Complexity {
        switch self {
        case .colorsExample:
            return .beginner
        case .gradientsExample:
            return .beginner
        case .dynamicColorsExample:
            return .beginner
        case .systemMaterialsAndBackgrounds:
            return .beginner
        }
    }

    func view() -> AnyView {
        switch self {
        case .colorsExample:
            return AnyView(Text("Coming Soon"))
        case .gradientsExample:
            return AnyView(Text("Coming Soon"))
        case .dynamicColorsExample:
            return AnyView(Text("Coming Soon"))
        case .systemMaterialsAndBackgrounds:
            return AnyView(Text("Coming Soon"))
        }
    }

    var id: String { rawValue }
}
