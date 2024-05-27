import SwiftUI

// MARK: - Concept
protocol ConceptType {
    var id: UUID { get }
    var title: String { get }
    var description: String { get }
    var complexity: Complexity { get }
    var githubLink: String? { get }
    var view: AnyView { get }
}

struct Concept: ConceptType, Identifiable {
    var id: UUID = .init()
    var title: String
    var description: String

    var complexity: Complexity

    var view: AnyView

    var githubLink: String?
    var githubLinkURL: URL? {
        guard let link = githubLink else { return nil }
        guard let url = URL(string: link) else { return nil }
        return url
    }
}

// MARK: - Enums
enum Complexity {
    case beginner
    case intermediate
    case advanced

    var color: Color {
        switch self {
        case .beginner:
            return .green
        case .intermediate:
            return .orange
        case .advanced:
            return .red
        }
    }
}
