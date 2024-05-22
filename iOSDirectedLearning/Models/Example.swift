
import SwiftUI

protocol ExampleType: Identifiable {
    var id: String { get }
    var title: String { get }
    var description: String { get }
    func view() -> AnyView
}

struct Example<T: ExampleType>: Identifiable {
    let id: UUID = .init()
    let type: T

    var title: String {
        type.title
    }

    var description: String {
        type.description
    }

    func view() -> AnyView {
        type.view()
    }
}

struct AnyExample: Identifiable {
    var innerExample: any ExampleType

    init(_ example: any ExampleType) {
        innerExample = example
    }

    var id: String { innerExample.id }
}
