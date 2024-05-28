//
//  NavigationConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

// MARK: - Navigation Concepts
struct NavigationConcepts {
    static let navigationViewAndNavigationLinkConcept = Concept(
        title: "NavigationView and NavigationLink",
        description: "NavigationView and NavigationLink",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let navigationStackConcept = Concept(
        title: "NavigationStack",
        description: "NavigationStack",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let navigationSplitViewConcept = Concept(
        title: "NavigationSplitView",
        description: "NavigationSplitView",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let customNavigationBarConcept = Concept(
        title: "Custom Navigation Bar",
        description: "Custom Navigation Bar",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let pagingScrollViewConcept = Concept(
        title: "Paging ScrollView",
        description: "Paging ScrollView",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        navigationViewAndNavigationLinkConcept,
        navigationStackConcept,
        navigationSplitViewConcept,
        customNavigationBarConcept,
        pagingScrollViewConcept
    ]
}
