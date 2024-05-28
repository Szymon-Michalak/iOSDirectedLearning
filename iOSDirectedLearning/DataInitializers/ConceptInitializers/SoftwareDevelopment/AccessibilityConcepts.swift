//
//  AccessibilityConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

// MARK: - Accessibility Concepts
struct AccessibilityConcepts {
    static let dynamicTextConcept = Concept(
        title: "Dynamic Text",
        description: "Dynamic Text",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let dynamicColorsConcept = Concept(
        title: "Dynamic Colors",
        description: "Dynamic Colors",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let voiceOverConcept = Concept(
        title: "Voice Over",
        description: "Voice Over",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        dynamicTextConcept,
        dynamicColorsConcept,
        voiceOverConcept
    ]
}
