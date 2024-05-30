//
//  SectionHeaderView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 30/05/2024.
//

import SwiftUI

struct VStackWithHeaderView<Content: View>: View {
    var title: String
    var description: String?
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(description ?? "")
            content()
        }
    }
}
