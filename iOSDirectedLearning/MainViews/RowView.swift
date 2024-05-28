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
                if let description = content.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            if let image = content.image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
//                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .clipShape(Circle())
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    VStack {
        RowView(content: CategoryInitializer.categories[0])
        RowView(content: CategoryInitializer.categories[1])
        RowView(content: CategoryInitializer.categories[2])
    }
}
