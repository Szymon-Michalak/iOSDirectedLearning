//
//  TextAndShapesConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {
    static let colorsAndShapesTopic: Topic = Topic(
        title: "Colors and Shapes",
        concepts: ColorsAndShapesConcepts.all)

}

// MARK: - Text and Shapes Concepts

fileprivate struct ColorsAndShapesConcepts {
    static let textConcept = Concept(
        title: "Text",
        description: "A showcase of basic text modifiers.",
        complexity: .beginner,
        view: TextConceptView(),
        githubPath: "UIComponents/ColorsAndShapes/TextConceptView.swift"
    )

    static let colorsConcept = Concept(
        title: "Colors",
        description: "A showcase of colors, materials and gradients",
        complexity: .beginner,
        view: ColorsAndGradientsConceptView(),
        githubPath: "UIComponents/ColorsAndShapes/ColorsAndGradientsConceptView.swift"
    )

    static let shapesConcept = Concept(
        title: "Shapes",
        description: "Exploring built in shapes.",
        complexity: .beginner,
        view: ShapesConceptView(),
        githubPath: "UIComponents/ColorsAndShapes/ShapesConceptView.swift"
    )

    static let maskConcept = Concept(
        title: "Mask",
        description: "Applying mask with animation.",
        complexity: .intermediate,
        view: MaskConceptView(),
        githubPath: "UIComponents/ColorsAndShapes/MaskConceptView.swift"
    )

    static let customShapesConcept = Concept(
        title: "Custom Shapes",
        description: "Drawing custom shapes with straight lines.",
        complexity: .advanced,
        view: CustomShapesConceptView(),
        githubPath: "UIComponents/ColorsAndShapes/CustomShapesConceptView.swift"
    )

    static let arcsAndQuadCurvesConcept = Concept(
        title: "Arcs and Quad Curves",
        description: "Drawing custom shapes with arcs and curves.",
        complexity: .advanced,
        view: ArcsAndQuadCurvesConceptView(),
        githubPath: "UIComponents/ColorsAndShapes/ArcsAndQuadCurvesConceptView.swift"
    )

    static let customShapesWithAnimateableDataConcept = Concept(
        title: "Animating Custom Shapes",
        description: "Animating custom shapes using animateable data.",
        complexity: .advanced,
        view: AnimatingCustomShapesConceptView(),
        githubPath: "UIComponents/ColorsAndShapes/AnimatingCustomShapesConceptView.swift"
    )

    static let all: [Concept] = [
        textConcept,
        colorsConcept,
        shapesConcept,
        maskConcept,
        customShapesConcept,
        arcsAndQuadCurvesConcept,
        customShapesWithAnimateableDataConcept
    ]
}
