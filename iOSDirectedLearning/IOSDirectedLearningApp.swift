import SwiftUI

@main
struct IOSDirectedLearningApp: App {
    var body: some Scene {
        WindowGroup {
            CategoriesView()
                .environmentObject(ModelData())
        }
    }
}
