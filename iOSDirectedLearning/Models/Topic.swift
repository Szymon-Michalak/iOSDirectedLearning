
import SwiftUI

struct Topic<T: ConceptType>: Identifiable {
    let id: UUID = .init()
    let title: String
    let concepts: [Concept<T>]
}

struct AnyTopic: Identifiable {
    let id: UUID = .init()
    let title: String
    let concepts: [any ConceptType]

    init<T: ConceptType>(_ topic: Topic<T>) {
        title = topic.title
        concepts = topic.concepts.map { $0.type }
    }
}
