
import SwiftUI

struct CategoryView: View {
    let category: Category

    var body: some View {
        List(category.topics) { topic in
            NavigationLink(destination: TopicView(topic: topic)) {
                Text(topic.title)
            }
        }
    }
}

#Preview {
    CategoryView(category: DataInitializer.categories[0])
}
