//
//  ConceptView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 22/05/2024.
//

import SwiftUI

struct ConceptView: View {

    @StateObject private var viewModel: ConceptViewModel

    init(concept: Concept) {
        _viewModel = StateObject(wrappedValue: ConceptViewModel(concept: concept))
    }

    var body: some View {
        ScrollView {
            viewModel.concept.view
                .padding()
        }
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.toggleFavorite()
                } label: {
                    if viewModel.isFavorite {
                        Label("Remove from Favorites", systemImage: "heart.fill")
                    } else {
                        Label("Add to Favorites", systemImage: "heart")
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Section("What would you like to do?") {
                        if let githubLinkURL = viewModel.concept.githubLinkURL {
                            Link(destination: githubLinkURL) {
                                Label("See code on Github", systemImage: "swift")
                            }
                        } else {
                            Label("See code on Github", systemImage: "swift")
                                .disabled(true)
                        }

                        Button {
                            viewModel.toggleFavorite()
                        } label: {
                            if viewModel.isFavorite {
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
}

#Preview {
    NavigationStack {
        ConceptView(concept: CategoryInitializer.textAndShapesTopic.concepts[0])
    }
}
