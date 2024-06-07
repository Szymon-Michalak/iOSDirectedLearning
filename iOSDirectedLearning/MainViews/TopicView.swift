import SwiftUI

struct TopicView: View {
    let topic: Topic
    let concepts: [Concept]

    init(topic: Topic) {
        self.topic = topic
        concepts = topic.concepts
    }

    var body: some View {
        ForEach(concepts, id: \.id) { concept in
            NavigationLink(destination: ConceptView(concept: concept)) {
                ConceptRowView(concept: concept)
            }
        }
        .padding(.horizontal)
        .navigationTitle(topic.title)
    }
}

struct ConceptRowView: View {
    var concept: any ConceptType

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(concept.title)
                    .primaryText()
                Text(concept.description)
                    .secondaryText()
            }
            Spacer()
            Circle()
                .fill(concept.complexity.color)
                .frame(width: 20, height: 20)
        }
        .padding()
        .background(.thinMaterial.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TopicView(topic: CategoryInitializer.categories[0].topics[0])
}
