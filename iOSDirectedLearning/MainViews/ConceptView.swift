//
//  ConceptView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 22/05/2024.
//

import SwiftUI

struct ConceptView: View {
    let content: AnyView
    
    var body: some View {
        ScrollView {
            content
                .padding()
        }
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // TODO: - Add this item to a list of favorites.
                    } label: {
                        Label("Add to Favorites", systemImage: "heart")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Section("What would you like to do?") {
                            Button {
                                // TODO: - View Code on Github
                            } label: {
                                Label("See code on Github", systemImage: "swift")
                            }
                            Button {
                                // TODO: - Add this item to a list of favorites.
                            } label: {
                                Label("Add to Favorites", systemImage: "heart")
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
        ConceptView(content: AnyView(Text("lol")))
    }
}
