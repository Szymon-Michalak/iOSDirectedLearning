
import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    @Published var categories: [Category] = CategoryInitializer.categories
}
