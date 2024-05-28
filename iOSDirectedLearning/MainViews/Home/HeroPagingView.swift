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
                        HStack {
                            Spacer()
                            VStack {
                                ribbon(for: concept.complexity)
                                Spacer()
                            }
                        }
                        .mask {
                            RoundedRectangle(cornerRadius: 25)
                            .padding(.horizontal, 5)
                            .containerRelativeFrame(.horizontal)
                        }
                        VStack(alignment: .center) {
                            Text(concept.title)
                                .font(.title2.bold())
                                .lineLimit(3)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            Text(concept.description)
                                .lineLimit(3)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                        }
//                        .frame(width: .infinity)
                        .padding()
                        .padding()
                        .containerRelativeFrame(.horizontal)
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

    func ribbon(for complexity: Complexity) -> some View {
        ZStack {
            Text(complexity.rawValue)
                .foregroundStyle(complexity.color)
                .frame(maxWidth: .infinity)
                .padding(5)
                .background(.white)
        }
        .frame(width: 200, height: 200)
//        .background(.pink)
        .rotationEffect(Angle(degrees: 45))
        .offset(x: 60, y: -60)
    }
}

#Preview {
    HeroPagingView(modelData: ModelData())
}
