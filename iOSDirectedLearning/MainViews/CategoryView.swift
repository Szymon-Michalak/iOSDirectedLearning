import SwiftUI

struct CategoryView: View {
    let category: Category

    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient:
                                        Gradient(colors: [
                                            .purple.opacity(0.15),
                                            .purple.opacity(0.55)
                                        ]), startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
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
                            Section(header: SectionHeaderView(title: topic.title)) {
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
}

#Preview {
    CategoryView(category: CategoryInitializer.categories[0])
}

struct SectionHeaderView: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
