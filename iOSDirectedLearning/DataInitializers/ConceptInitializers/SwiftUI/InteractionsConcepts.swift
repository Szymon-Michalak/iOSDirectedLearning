//
//  InteractionsConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let interactionsTopic: Topic = Topic(
        title: "Interactions",
        concepts: InteractionsConcepts.all)

}

// MARK: - Interactions Concepts
fileprivate struct InteractionsConcepts {
    static let tapGestureConcept = Concept(
        title: "Tap Gesture",
        description: "Tap Gesture",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let longPressGestureConcept = Concept(
        title: "LongPressGesture",
        description: "LongPressGesture",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let magnificationGestureConcept = Concept(
        title: "MagnificationGesture",
        description: "MagnificationGesture",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let rotationGestureConcept = Concept(
        title: "RotationGesture",
        description: "RotationGesture",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let dragGestureConcept = Concept(
        title: "DragGesture",
        description: "DragGesture",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let alertsConcept = Concept(
        title: "Alerts",
        description: "Alerts",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let contextMenuConcept = Concept(
        title: "ContextMenu",
        description: "ContextMenu",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let actionSheetConcept = Concept(
        title: "ActionSheet",
        description: "ActionSheet",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let customListSwipeActionsConcept = Concept(
        title: "Custom List Swipe Actions",
        description: "Custom List Swipe Actions",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let customErrorsAndAlertsConcept = Concept(
        title: "Custom Errors and Alerts",
        description: "Custom Errors and Alerts",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let searchableConcept = Concept(
        title: "Searchable, Search Suggestions, Search Scopes",
        description: "Searchable, Search Suggestions, Search Scopes",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let listItemsManipulationConcept = Concept(
        title: "Add, Edit, Move, and Delete Items in a List",
        description: "Add, Edit, Move, and Delete Items in a List",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        tapGestureConcept,
        longPressGestureConcept,
        magnificationGestureConcept,
        rotationGestureConcept,
        dragGestureConcept,
        alertsConcept,
        contextMenuConcept,
        actionSheetConcept,
        customListSwipeActionsConcept,
        customErrorsAndAlertsConcept,
        searchableConcept,
        listItemsManipulationConcept
    ]
}
