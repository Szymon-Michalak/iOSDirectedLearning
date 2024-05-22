
import SwiftUI

@main
struct iOSDirectedLearningApp: App {
    var body: some Scene {
        WindowGroup {
            CategoriesView()
                .environmentObject(ModelData())
        }
    }
}
