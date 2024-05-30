//
//  Styles.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 30/05/2024.
//

import Foundation
import SwiftUI

enum ConceptStyle {
    enum Columns {
        static let threeColumnLayout = [
            GridItem(.flexible(), spacing: 20, alignment: .top),
            GridItem(.flexible(), spacing: 20, alignment: .top),
            GridItem(.flexible(), spacing: 20, alignment: .top)]

        static let twoColumnLayout = [
            GridItem(.flexible(), spacing: 20, alignment: .top),
            GridItem(.flexible(), spacing: 20, alignment: .top)]
    }

    enum CornerRadius {
        static let small: CGFloat = 10
        static let large: CGFloat = 20
    }

    enum Padding {
        static let small: CGFloat = 10
        static let large: CGFloat = 20
    }
}

struct ConceptButtonStyle<S: ShapeStyle>: ButtonStyle {
    let style: S

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(style, in: RoundedRectangle(cornerRadius: ConceptStyle.CornerRadius.large))
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
