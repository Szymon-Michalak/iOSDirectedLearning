//
//  RowView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import SwiftUI

struct RowView: View {
    var content: ListPresentable

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(content.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                if let description = content.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            if let image = content.image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(.thickMaterial.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 25)
    }
}

#Preview {
    VStack {
        RowView(content: CategoryInitializer.categories[0])
        RowView(content: CategoryInitializer.categories[1])
        RowView(content: CategoryInitializer.categories[2])
    }
}
