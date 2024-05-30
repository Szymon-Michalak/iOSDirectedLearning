//
//  HeaderView.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 30/05/2024.
//

import SwiftUI

struct LabeledViewBuilder<Content: View>: View {
    let labelText: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack {
            content()
            Text(labelText)
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
    }
}

struct LabeledCircleView<S: ShapeStyle>: View {
    let labelText: String
    let style: S

    var body: some View {
        LabeledViewBuilder(labelText: labelText) {
            Circle()
                .fill(style)
                .frame(width: 50, height: 50)
        }
    }
}

struct LabeledButtonView<S: ShapeStyle>: View {
    let labelText: String
    let action: () -> Void
    var buttonText: String = "Tap me"
    let style: S

    var body: some View {
        LabeledViewBuilder(labelText: labelText) {
            Button(action: action) {
                Text(buttonText)
            }
            .buttonStyle(ConceptButtonStyle(style: style))
        }
    }
}
/// Intended to be used with `Text()`
struct LabeledTextView<Content: View>: View {
    let labelText: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        LabeledViewBuilder(labelText: labelText) {
            content()
                .frame(maxWidth: .infinity)
                .padding(ConceptStyle.Padding.large)
                .background(
                    RoundedRectangle(cornerRadius: ConceptStyle.CornerRadius.large)
                    .stroke(style: StrokeStyle(lineWidth: 2)))
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        LabeledTextView(labelText: "Text") {
            Text("Ohaio gosaimasta")
        }
        LabeledButtonView(labelText: "Button", action: {}, style: .ultraThinMaterial)
        LabeledCircleView(labelText: "Label", style: .red.gradient)
    }
}
