//
//  AdvancedTechniquesConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let advancedTechniquesTopic: Topic = Topic(
        title: "Advanced Techniques",
        concepts: AdvancedTechniquesConcepts.all)

}

// MARK: - Advanced Techniques Concepts
fileprivate struct AdvancedTechniquesConcepts {
    static let onAppearAndOnDisappearConcept = Concept(
        title: "onAppear and onDisappear",
        description: "onAppear and onDisappear",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let multipleSheetsConcept = Concept(
        title: "Multiple Sheets",
        description: "Multiple Sheets",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let popoversAndSheetsConcept = Concept(
        title: "Popovers and Sheets",
        description: "Popovers and Sheets",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let viewBuilderConcept = Concept(
        title: "@ViewBuilder",
        description: "@ViewBuilder",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let preferenceKeyConcept = Concept(
        title: "PreferenceKey",
        description: "PreferenceKey",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let dependencyInjectionConcept = Concept(
        title: "Dependency Injection",
        description: "Dependency Injection",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let uiViewRepresentableConcept = Concept(
        title: "UIViewRepresentable",
        description: "UIViewRepresentable",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let uiViewControllerRepresentableConcept = Concept(
        title: "UIViewControllerRepresentable",
        description: "UIViewControllerRepresentable",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let timelineViewConcept = Concept(
        title: "TimelineView",
        description: "TimelineView",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let mainActorWithObservableMacroConcept = Concept(
        title: "MainActor with Observable Macro",
        description: "MainActor with Observable Macro",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        onAppearAndOnDisappearConcept,
        multipleSheetsConcept,
        popoversAndSheetsConcept,
        viewBuilderConcept,
        preferenceKeyConcept,
        dependencyInjectionConcept,
        uiViewRepresentableConcept,
        uiViewControllerRepresentableConcept,
        timelineViewConcept,
        mainActorWithObservableMacroConcept
    ]
}
