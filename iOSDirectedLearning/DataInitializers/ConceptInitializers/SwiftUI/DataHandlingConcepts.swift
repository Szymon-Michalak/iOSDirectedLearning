//
//  DataHandlingConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let dataHandlingTopic: Topic = Topic(
        title: "Data Handling",
        concepts: DataHandlingConcepts.all)

}

// MARK: - Data Handling Concepts
fileprivate struct DataHandlingConcepts {
    static let textFieldConcept = Concept(
        title: "TextField",
        description: "TextField",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let textEditorConcept = Concept(
        title: "TextEditor",
        description: "TextEditor",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let datePickerConcept = Concept(
        title: "DatePicker",
        description: "DatePicker",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let stepperConcept = Concept(
        title: "Stepper",
        description: "Stepper",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let sliderConcept = Concept(
        title: "Slider",
        description: "Slider",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let tabViewConcept = Concept(
        title: "TabView",
        description: "TabView",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let customTabBarConcept = Concept(
        title: "Custom Tab Bar",
        description: "Custom Tab Bar",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let observableObjectAndStateObjectConcept = Concept(
        title: "@ObservableObject and @StateObject",
        description: "@ObservableObject and @StateObject",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let environmentObjectConcept = Concept(
        title: "@EnvironmentObject",
        description: "@EnvironmentObject",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let appStorageConcept = Concept(
        title: "@AppStorage",
        description: "@AppStorage",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        textFieldConcept,
        textEditorConcept,
        datePickerConcept,
        stepperConcept,
        sliderConcept,
        tabViewConcept,
        customTabBarConcept,
        observableObjectAndStateObjectConcept,
        environmentObjectConcept,
        appStorageConcept
    ]
}
