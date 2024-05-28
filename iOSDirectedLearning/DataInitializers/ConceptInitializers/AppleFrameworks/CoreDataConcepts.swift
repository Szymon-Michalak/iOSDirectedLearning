//
//  CoreDataConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

// MARK: - Core Data Concepts
struct CoreDataConcepts {
    static let FetchRequestConcept = Concept(
        title: "Core Data with @FetchRequest",
        description: "Core Data with @FetchRequest",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let coreDataWithMVVMConcept = Concept(
        title: "Core Data with MVVM Architecture",
        description: "Core Data with MVVM Architecture",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let RelationshipsPredicatesAndDeleteRulesConcept = Concept(
        title: "Core Data Relationships, Predicates, and Delete Rules",
        description: "Core Data Relationships, Predicates, and Delete Rules",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        FetchRequestConcept,
        coreDataWithMVVMConcept,
        RelationshipsPredicatesAndDeleteRulesConcept
    ]
}
