//
//  Styles.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 28/05/2024.
//

import SwiftUI

extension View {
    func primaryText() -> some View {
        modifier(PrimaryTextStyle())
    }

    func secondaryText() -> some View {
        modifier(SecondaryTextStyle())
    }
}

enum DomainStyles {
    static let backgroundGradient: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [
            .purple.opacity(0.15),
            .purple.opacity(0.55)
        ]),
        startPoint: .top,
        endPoint: .bottom)
}

struct PrimaryTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.headline)
            .foregroundStyle(.white)
            .fontWeight(.bold)
    }
}

struct SecondaryTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.subheadline)
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
    }
}
