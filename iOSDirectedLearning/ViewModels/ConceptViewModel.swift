//
//  ConceptViewModel.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Combine
import SwiftUI

class ConceptViewModel: ObservableObject {
    @Published var concept: Concept
    @Published var isFavorite: Bool

    init(concept: Concept) {
        self.concept = concept
        self.isFavorite = false
        loadFavoriteStatus()
    }

    func toggleFavorite() {
        isFavorite.toggle()
        saveFavoriteStatus()
    }

    private func saveFavoriteStatus() {
        let favoriteIDsKey = "favoriteConceptIDs"
        var favoriteIDs = UserDefaults.standard.stringArray(forKey: favoriteIDsKey) ?? []

        if isFavorite {
            favoriteIDs.append(concept.id.uuidString)
        } else {
            favoriteIDs.removeAll { $0 == concept.id.uuidString }
        }

        UserDefaults.standard.set(favoriteIDs, forKey: favoriteIDsKey)
    }

    func loadFavoriteStatus() {
        let favoriteIDsKey = "favoriteConceptIDs"
        let favoriteIDs = UserDefaults.standard.stringArray(forKey: favoriteIDsKey) ?? []
        isFavorite = favoriteIDs.contains(concept.id.uuidString)
    }
}
