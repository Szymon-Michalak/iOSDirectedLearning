//
//  ConcurrencyConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

// MARK: - Concurrency Concepts
struct ConcurrencyConcepts {
    static let swiftConcurrencyConcept = Concept(
        title: "Swift Concurrency (Async, Await, Actors)",
        description: "Swift Concurrency (Async, Await, Actors)",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let doTryCatchAndThrowsConcept = Concept(
        title: "Do, Try, Catch, and Throws",
        description: "Do, Try, Catch, and Throws",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let downloadImagesWithAsyncAwaitConcept = Concept(
        title: "Download Images with Async/Await, @escaping, and Combine",
        description: "Download Images with Async/Await, @escaping, and Combine",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let asyncAwaitKeywordsConcept = Concept(
        title: "Async/Await Keywords",
        description: "Async/Await Keywords",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let taskConcept = Concept(
        title: "Task and .task",
        description: "Task and .task",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let asyncLetConcept = Concept(
        title: "Async Let",
        description: "Async Let",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let taskGroupConcept = Concept(
        title: "TaskGroup",
        description: "TaskGroup",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let continuationsConcept = Concept(
        title: "Continuations (withCheckedThrowingContinuation)",
        description: "Continuations (withCheckedThrowingContinuation)",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let structVsClassVsActorConcept = Concept(
        title: "Struct vs Class vs Actor, Value vs Reference Types, Stack vs Heap",
        description: "Struct vs Class vs Actor, Value vs Reference Types, Stack vs Heap",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let actorsAndNonIsolatedConcept = Concept(
        title: "Actors and non-isolated",
        description: "Actors and non-isolated",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let globalActorsConcept = Concept(
        title: "Global Actors (@globalActor)",
        description: "Global Actors (@globalActor)",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let sendableProtocolConcept = Concept(
        title: "Sendable Protocol",
        description: "Sendable Protocol",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let asyncPublisherConcept = Concept(
        title: "AsyncPublisher",
        description: "AsyncPublisher",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let strongWeakReferencesWithAsyncAwaitConcept = Concept(
        title: "Strong & Weak References with Async/Await",
        description: "Strong & Weak References with Async/Await",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let mvvmWithAsyncAwaitConcept = Concept(
        title: "MVVM with Async/Await",
        description: "MVVM with Async/Await",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let asyncStreamConcept = Concept(
        title: "AsyncStream",
        description: "AsyncStream",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        swiftConcurrencyConcept,
        doTryCatchAndThrowsConcept,
        downloadImagesWithAsyncAwaitConcept,
        asyncAwaitKeywordsConcept,
        taskConcept,
        asyncLetConcept,
        taskGroupConcept,
        continuationsConcept,
        structVsClassVsActorConcept,
        actorsAndNonIsolatedConcept,
        globalActorsConcept,
        sendableProtocolConcept,
        asyncPublisherConcept,
        strongWeakReferencesWithAsyncAwaitConcept,
        mvvmWithAsyncAwaitConcept,
        asyncStreamConcept
    ]
}
