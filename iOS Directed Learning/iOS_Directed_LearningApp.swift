
import SwiftUI

@main
struct iOS_Directed_LearningApp: App {
    var body: some Scene {
        WindowGroup {
            CategoriesView()
                .environmentObject(ModelData())
        }
    }
}
