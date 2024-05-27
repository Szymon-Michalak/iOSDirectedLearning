import SwiftUI

@main
struct IOSDirectedLearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ModelData())
        }
    }
}
