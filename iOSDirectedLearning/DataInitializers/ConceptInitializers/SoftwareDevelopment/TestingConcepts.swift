//
//  TestingConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

// MARK: - Testing Concepts
struct TestingConcepts {
    static let unitTestingConcept = Concept(
        title: "Unit Testing",
        description: "Unit Testing",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let uiTestingConcept = Concept(
        title: "UI Testing",
        description: "UI Testing",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        unitTestingConcept,
        uiTestingConcept
    ]
}
