import SwiftUI

struct Category: Identifiable, ListPresentable {
    let id: UUID = .init()
    let title: String
    let description: String

    let topics: [Topic]
}
