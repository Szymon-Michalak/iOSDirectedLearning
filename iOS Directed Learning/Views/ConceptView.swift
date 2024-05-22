//
//  ConceptView.swift
//  iOS Directed Learning
//
//  Created by Szymon Michalak on 21/05/2024.
//

import SwiftUI

struct ConceptView: View {
    let concept: AnyConcept
    let examples: [AnyExample]

    init(concept: AnyConcept) {
        self.concept = concept
        examples = concept.examples.map { AnyExample($0) }
    }

    var body: some View {
        List {
            ForEach(examples, id: \.id) { example in
                NavigationLink(destination: example.innerExample.view()) {
                    ExampleRowView(example: example.innerExample)
                }
            }
        }
        .navigationTitle(concept.title)
    }
}

struct ExampleRowView: View {
    var example: any ExampleType

    var body: some View {
        VStack(alignment: .leading) {
            Text(example.title)
                .font(.headline)
            Text(example.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ConceptView(concept: CategoryInitializer.categories[0].concepts[0])
}
