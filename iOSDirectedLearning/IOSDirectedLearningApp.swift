import SwiftUI

@main
struct IOSDirectedLearningApp: App {
    var body: some Scene {
        WindowGroup {
            MainHomeView()
                .environmentObject(ModelData())
                .preferredColorScheme(.dark)
        }
    }
}
