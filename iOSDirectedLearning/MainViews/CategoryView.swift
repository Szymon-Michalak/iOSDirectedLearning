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
                LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                    ForEach(category.topics) { topic in
                        Section(header: SectionHeaderView(topic: topic)) {
                            ForEach(topic.concepts) { concept in
                                NavigationLink(destination: ConceptView(concept: concept)) {
                                    ConceptRowView(concept: concept)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
//                .padding()
            }
        }
    }
}

#Preview {
    CategoryView(category: CategoryInitializer.categories[0])
}

struct SectionHeaderView: View {
    var topic: Topic

    var body: some View {
        HStack {
            Text(topic.title)
                .font(.headline)
                .foregroundColor(.purple)
            Spacer()
        }
        .padding()
        .background(.regularMaterial)
    }
}
