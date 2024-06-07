import SwiftUI

struct CategoryView: View {
    let category: Category

    var body: some View {
        ZStack {
            ParticlesViewRepresentable()
                .ignoresSafeArea()
            if category.topics.isEmpty {
                ContentUnavailableView {
                    Label {
                        Text("No Concepts Yet")
                            .font(.body)
                            .foregroundColor(.white)
                    } icon: {
                        Image(category.image ?? "category/swift")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(Circle())
                    }
                } description: {
                    Text("Stay tuned for updates. We will be adding more concepts soon!")
                        .foregroundStyle(.white)
                }
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                        ForEach(category.topics) { topic in
                            Section(header: CategoryHeaderView(title: topic.title)) {
                                ForEach(topic.concepts) { concept in
                                    NavigationLink(destination: ConceptView(concept: concept)) {
                                        ConceptRowView(concept: concept)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryView(category: CategoryInitializer.categories[0])
}

struct CategoryHeaderView: View {
    var title: String

    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(.regularMaterial.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
