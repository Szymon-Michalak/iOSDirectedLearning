//
//  ConceptView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 22/05/2024.
//

import SwiftUI

struct ConceptView: View {

    @StateObject private var vm: ConceptViewModel

    init(concept: Concept) {
        _vm = StateObject(wrappedValue: ConceptViewModel(concept: concept))
    }

    var body: some View {
        ScrollView {
            vm.concept.view
                .padding()
        }
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    vm.toggleFavorite()
                } label: {
                    if vm.isFavorite {
                        Label("Remove from Favorites", systemImage: "heart.fill")
                    } else {
                        Label("Add to Favorites", systemImage: "heart")
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Section("What would you like to do?") {
                        if let githubLinkURL = vm.concept.githubLinkURL {
                            Link(destination: githubLinkURL) {
                                Label("See code on Github", systemImage: "swift")
                            }
                        } else {
                            Label("See code on Github", systemImage: "swift")
                                .disabled(true)
                        }

                        Button {
                            vm.toggleFavorite()
                        } label: {
                            if vm.isFavorite {
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
        ConceptView(concept: TextAndShapesConcepts.all[0])
    }
}
