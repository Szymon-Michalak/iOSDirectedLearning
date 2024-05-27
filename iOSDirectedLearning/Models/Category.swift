import SwiftUI

struct Category: Identifiable {
    let id: UUID = .init()
    let title: String

    let topics: [AnyTopic]
}
