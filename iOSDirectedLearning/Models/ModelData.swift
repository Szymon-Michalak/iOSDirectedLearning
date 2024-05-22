
import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    @Published var categories: [Category] = CategoryInitializer.categories
    
    @Published var getRandomExamples = CategoryInitializer.categories.map { $0.concepts }.flatMap { $0 }.map { $0.examples }.flatMap { $0 }.map { AnyExample($0) }.shuffled().prefix(upTo: 5).map { $0 }
}
