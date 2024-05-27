//
//  ConceptView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 22/05/2024.
//

import SwiftUI

struct ConceptView: View {

    let concept: Concept
    @State private var isFavorite: Bool

    init(concept: Concept) {
        self.concept = concept
        self.isFavorite = concept.isFavorite
    }

    var body: some View {
        ScrollView {
            concept.view
                .padding()
        }
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    toggleFavorite()
                } label: {
                    if isFavorite {
                        Label("Remove from Favorites", systemImage: "heart.fill")
                    } else {
                        Label("Add to Favorites", systemImage: "heart")
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Section("What would you like to do?") {
                        if let githubLinkURL = concept.githubLinkURL {
                            Link(destination: githubLinkURL) {
                                Label("See code on Github", systemImage: "swift")
                            }
                        } else {
                            Label("See code on Github", systemImage: "swift")
                                .disabled(true)
                        }

                        Button {
                            toggleFavorite()
                        } label: {
                            if isFavorite {
                                Label("Remove from Favorites", systemImage: "heart.fill")
                            } else {
                                Label("Add to Favorites", systemImage: "heart")
                            }
                        }
                    }
                } label: {
                    Label("Menu", systemImage: "ellipsis.circle")
                }
            }
        }
    }

    func toggleFavorite() {
        isFavorite.toggle()
    }
}

#Preview {
    NavigationStack {
        ConceptView(concept: TextAndShapesConcepts.all[0])
    }
}
