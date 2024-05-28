import SwiftUI

struct Topic: Identifiable, ListPresentable {
    let id: UUID = .init()
    let title: String
    let description: String?
    let image: String?

    let concepts: [Concept]

    init(title: String, description: String, image: String, concepts: [Concept]) {
        self.title = title
        self.description = description
        self.image = image
        self.concepts = concepts
    }

    init(title: String, concepts: [Concept]) {
        self.title = title
        self.description = nil
        self.image = nil
        self.concepts = concepts
    }
}
