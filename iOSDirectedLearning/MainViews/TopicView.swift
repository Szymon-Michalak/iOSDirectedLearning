import SwiftUI

struct TopicView: View {
    let topic: AnyTopic
    let concepts: [AnyConcept]

    init(topic: AnyTopic) {
        self.topic = topic
        concepts = topic.concepts.map { AnyConcept($0) }
    }

    var body: some View {
        List {
            ForEach(concepts, id: \.id) { example in
                NavigationLink(destination: ConceptView(content: example.innerExample.view())) {
                    ExampleRowView(example: example.innerExample)
                }
            }
        }
        .navigationTitle(topic.title)
    }
}

struct ExampleRowView: View {
    var example: any ConceptType

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(example.title)
                    .font(.headline)
                Text(example.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Circle()
                .fill(example.complexity.color)
                .frame(width: 20, height: 20)
        }
    }
}

#Preview {
    TopicView(topic: DataInitializer.categories[0].topics[0])
}
