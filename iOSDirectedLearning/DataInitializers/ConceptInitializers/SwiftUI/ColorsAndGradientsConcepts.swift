//
//  ColorsAndGradientsConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let colorsAndGradientsTopic: Topic = Topic(
        title: "Colors and Gradients",
        concepts: ColorsAndGradientsConcepts.all)

}

// MARK: - Colors and Gradients Concepts
fileprivate struct ColorsAndGradientsConcepts {
    static let colorsConcept = Concept(
        title: "Colors",
        description: "Colors",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let gradientsConcept = Concept(
        title: "Gradients",
        description: "Gradients",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let dynamicColorsConcept = Concept(
        title: "Dynamic Colors",
        description: "Dynamic Colors",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let systemMaterialsAndBackgroundsConcept = Concept(
        title: "System Materials and Backgrounds",
        description: "System Materials and Backgrounds",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        colorsConcept,
        gradientsConcept,
        dynamicColorsConcept,
        systemMaterialsAndBackgroundsConcept
    ]
}
