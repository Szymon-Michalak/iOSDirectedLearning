//
//  TimersAndCombineConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let combineTopic: Topic = Topic(
        title: "Combine",
        concepts: CombineConcepts.all)

}

// MARK: - Combine Concepts
fileprivate struct CombineConcepts {
    static let timerAndOnReceiveConcept = Concept(
        title: "Timer and onReceive",
        description: "Timer and onReceive",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let publishersAndSubscribersConcept = Concept(
        title: "Publishers and Subscribers with Combine",
        description: "Publishers and Subscribers with Combine",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let advancedPublishersAndSubscribersConcept = Concept(
        title: "Advanced Combine Publishers and Subscribers",
        description: "Advanced Combine Publishers and Subscribers",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let futuresAndPromisesConcept = Concept(
        title: "Futures and Promises in Combine",
        description: "Futures and Promises in Combine",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let asyncPublisherConcept = Concept(
        title: "AsyncPublisher",
        description: "AsyncPublisher",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        timerAndOnReceiveConcept,
        publishersAndSubscribersConcept,
        advancedPublishersAndSubscribersConcept,
        futuresAndPromisesConcept,
        asyncPublisherConcept
    ]
}
