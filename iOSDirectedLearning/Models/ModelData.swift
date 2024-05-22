
import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    @Published var categories: [Category] = DataInitializer.categories
    
    @Published var getRandomExamples = DataInitializer.categories.map { $0.topics }.flatMap { $0 }.map { $0.concepts }.flatMap { $0 }.map { AnyConcept($0) }.shuffled().prefix(upTo: 5).map { $0 }
    
}
