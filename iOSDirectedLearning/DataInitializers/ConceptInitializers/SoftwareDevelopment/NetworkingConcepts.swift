//
//  NetworkingConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let networkingTopic: Topic = Topic(
        title: "Networking",
        concepts: NetworkingConcepts.all)

}

// MARK: - Networking Concepts
fileprivate struct NetworkingConcepts {
    static let downloadJSONWithURLSessionConcept = Concept(
        title: "Download JSON with URLSession and Escaping Closures",
        description: "Download JSON with URLSession and Escaping Closures",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let downloadJSONWithCombineConcept = Concept(
        title: "Download JSON with Combine",
        description: "Download JSON with Combine",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        downloadJSONWithURLSessionConcept,
        downloadJSONWithCombineConcept
    ]
}
