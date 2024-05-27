import SwiftUI

struct Topic: Identifiable {
    let id: UUID = .init()
    let title: String
    let concepts: [Concept]
}
