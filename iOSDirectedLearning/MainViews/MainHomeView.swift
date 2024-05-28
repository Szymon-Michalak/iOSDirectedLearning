//
//  MainHomeView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 28/05/2024.
//

import SwiftUI

struct MainHomeView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    MainHomeView()
        .environmentObject(ModelData())
}
