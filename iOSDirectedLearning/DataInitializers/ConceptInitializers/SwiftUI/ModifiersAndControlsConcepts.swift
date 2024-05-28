//
//  ModifiersAndControlsConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let modifiersAndControlsTopic: Topic = Topic(
        title: "Modifiers and Controls",
        concepts: ModifiersAndControlsConcepts.all)

}

// MARK: - Modifiers and Controls Concepts
fileprivate struct ModifiersAndControlsConcepts {
    static let animationsConcept = Concept(
        title: "Animations",
        description: "Animations",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let animationTimingConcept = Concept(
        title: "Animation Timing",
        description: "Animation Timing",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let animationWithValueConcept = Concept(
        title: "Animation with Value",
        description: "Animation with Value",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let transitionsConcept = Concept(
        title: "Transitions",
        description: "Transitions",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let customViewModifiersConcept = Concept(
        title: "Custom ViewModifiers",
        description: "Custom ViewModifiers",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let customButtonStylesConcept = Concept(
        title: "Custom ButtonStyles",
        description: "Custom ButtonStyles",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let customTransitionsConcept = Concept(
        title: "Custom Transitions",
        description: "Custom Transitions",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let buttonsConcept = Concept(
        title: "Buttons",
        description: "Buttons",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let keyboardCustomizationConcept = Concept(
        title: "Keyboard Customization",
        description: "Keyboard Customization",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let controlGroupConcept = Concept(
        title: "ControlGroup",
        description: "ControlGroup",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let visualEffectViewModifierConcept = Concept(
        title: "VisualEffect ViewModifier",
        description: "VisualEffect ViewModifier",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let customBindingsConcept = Concept(
        title: "Custom Bindings",
        description: "Custom Bindings",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let refreshableModifierConcept = Concept(
        title: "Refreshable Modifier",
        description: "Refreshable Modifier",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let buttonStylesConcept = Concept(
        title: "Button Styles, Border Shapes, and Control Sizes",
        description: "Button Styles, Border Shapes, and Control Sizes",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        animationsConcept,
        animationTimingConcept,
        animationWithValueConcept,
        transitionsConcept,
        customViewModifiersConcept,
        customButtonStylesConcept,
        customTransitionsConcept,
        buttonsConcept,
        keyboardCustomizationConcept,
        controlGroupConcept,
        visualEffectViewModifierConcept,
        customBindingsConcept,
        refreshableModifierConcept,
        buttonStylesConcept
    ]
}
