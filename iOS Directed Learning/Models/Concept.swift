
import SwiftUI

struct Concept<T: ExampleType>: Identifiable {
    let id: UUID = .init()
    let title: String
    let examples: [Example<T>]
}

struct AnyConcept: Identifiable {
    let id: UUID = .init()
    let title: String
    let examples: [any ExampleType]

    init<T: ExampleType>(_ concept: Concept<T>) {
        title = concept.title
        examples = concept.examples.map { $0.type }
    }
}
