import SwiftUI

struct CategoryView: View {
    let category: Category

    var body: some View {
            if category.topics.isEmpty {
                ContentUnavailableView {
                    Label {
                        Text("No Concepts Yet")
                            .font(.body)
                            .foregroundColor(.primary)
                    } icon: {
                        Image(category.image ?? "category/swift")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(Circle())
                    }
                } description: {
                    Text("Stay tuned for updates. We will be adding more concepts soon!")
                }
            } else {
                ScrollView {
                VStack {
                    ForEach(category.topics) { topic in
                        DisclosureGroup(topic.title) {
                            ForEach(topic.concepts, id: \.id) { concept in
                                NavigationLink(destination: ConceptView(concept: concept)) {
                                    ConceptRowView(concept: concept)
                                }
                            }
                        }
//                        NavigationLink(destination: TopicView(topic: topic)) {
//                            RowView(content: topic)
//                        }
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    CategoryView(category: CategoryInitializer.categories[0])
}
