//
//  Favorites.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation

struct Favorites {
    static var favorites: Set<Favorite> = []
}
struct Favorite: Identifiable, Hashable {
    let id: UUID
}
