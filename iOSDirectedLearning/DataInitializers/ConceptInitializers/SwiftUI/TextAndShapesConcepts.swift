//
//  TextAndShapesConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {
    static let textAndShapesTopic: Topic = Topic(
        title: "Text and Shapes",
        concepts: TextAndShapesConcepts.all)

}

// MARK: - Text and Shapes Concepts

fileprivate struct TextAndShapesConcepts {
    static let textConcept = Concept(
        title: "Text",
        description: "A showcase of basic text modifiers.",
        complexity: .beginner,
        view: TextExampleView(),
        githubPath: "ConceptViews/UIComponents/TextAndShapes/TextExampleView.swift"
    )

    static let shapesConcept = Concept(
        title: "Shapes",
        description: "Exploring built in shapes.",
        complexity: .beginner,
        view: ShapesExampleView()
    )

    static let maskConcept = Concept(
        title: "Mask",
        description: "Applying mask with animation.",
        complexity: .intermediate,
        view: MaskExampleView()
    )

    static let customShapesConcept = Concept(
        title: "Custom Shapes",
        description: "Drawing custom shapes with straight lines.",
        complexity: .advanced,
        view: CustomShapesConceptView()
    )

    static let arcsAndQuadCurvesConcept = Concept(
        title: "Arcs and Quad Curves",
        description: "Drawing custom shapes with arcs and curves.",
        complexity: .advanced,
        view: ArcsAndQuadCurvesConceptView()
    )

    static let customShapesWithAnimateableDataConcept = Concept(
        title: "Animating Custom Shapes",
        description: "Animating custom shapes using animateable data.",
        complexity: .advanced,
        view: AnimatingCustomShapesConceptView()
    )

    static let all: [Concept] = [
        textConcept,
        shapesConcept,
        maskConcept,
        customShapesConcept,
        arcsAndQuadCurvesConcept,
        customShapesWithAnimateableDataConcept
    ]
}
