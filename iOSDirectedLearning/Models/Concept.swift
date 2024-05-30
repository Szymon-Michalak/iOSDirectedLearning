import SwiftUI

// MARK: - Concept
protocol ConceptType {
    var id: UUID { get }
    var title: String { get }
    var description: String { get }
    var complexity: Complexity { get }
    var githubPath: String? { get }
    var view: AnyView { get }
}

struct Concept: ConceptType, Identifiable {
    var id: UUID = .init()
    var title: String
    var description: String

    var complexity: Complexity

    var view: AnyView

    var githubPath: String?
    var githubLinkURL: URL? {
        guard let path = githubPath else { return nil }
        let basePath = "https://github.com/Szymon-Michalak/iOS-Directed-Learning/blob/main/"
        let repositoryPath = "iOSDirectedLearning/ConceptViews/"
        let link = "\(basePath)\(repositoryPath)\(path)"
        guard let url = URL(string: link) else { return nil }
        return url
    }

    init(title: String, description: String, complexity: Complexity, view: some View, githubPath: String? = nil) {
        self.title = title
        self.description = description
        self.complexity = complexity
        self.view = AnyView(view)
        self.githubPath = githubPath
    }
}

// MARK: - Enums
enum Complexity: String {
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
