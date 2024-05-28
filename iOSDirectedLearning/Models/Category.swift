import SwiftUI

struct Category: Identifiable, ListPresentable {
    let id: UUID = .init()
    let title: String
    let description: String
    let image: String

    let topics: [Topic]

    init(title: String, description: String, image: String, topics: [Topic]) {
        self.title = title
        self.description = description
        self.image = image
        self.topics = topics
    }

    init(title: String, description: String, topics: [Topic]) {
        self.title = title
        self.description = description
        self.image = "category/swift"
        self.topics = topics
    }
}
