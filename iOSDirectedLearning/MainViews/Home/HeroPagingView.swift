//
//  HeroPagingView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import SwiftUI

struct HeroPagingView: View {
    let modelData: ModelData

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(modelData.getRandomExamples, id: \.id) { concept in
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(concept.complexity.color.gradient)
                            .padding(.horizontal, 5)
                            .containerRelativeFrame(.horizontal)
                        VStack(alignment: .leading) {
                            Text(concept.title)
                                .font(.title2.bold())
                                .lineLimit(3)
                                .foregroundStyle(.white)
                            Text(concept.description)
                                .lineLimit(0)
                                .foregroundStyle(.white)
                        }
                        .containerRelativeFrame(.horizontal)
                        .padding(.horizontal, 5)
                    }
                }
            }
            .scrollTargetLayout()
            .overlay(alignment: .bottom) {
                PagingIndicator(
                    activeTint: .white,
                    inActiveTint: .black.opacity(0.25)
                )
            }
        }
    }
}

#Preview {
    HeroPagingView(modelData: ModelData())
}
