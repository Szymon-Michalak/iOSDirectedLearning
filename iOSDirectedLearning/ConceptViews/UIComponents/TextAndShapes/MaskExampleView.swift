//
//  MaskExampleView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 22/05/2024.
//

import SwiftUI

struct MaskExampleView: View {

    @State var rating: Int = 3

    var body: some View {
        ZStack {
            starsView
                .overlay(
                    overlayView.mask(starsView)
                )
        }
    }

    private var overlayView: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .frame(width: CGFloat(rating) / 5 * geo.size.width)
                    .foregroundStyle(.yellow)
            }
            .allowsHitTesting(false)
    }

    }
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskExampleView()
}
