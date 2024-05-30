//
//  ColorsAndGradients.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 29/05/2024.
//

import SwiftUI

struct ColorsAndGradientsConceptView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                BasicColorView()
                SystemColorView()
                CustomColorView()
                GradientView()
                MaterialView()
                ConditionalColorView()
            }
            .padding()
        }
    }
}

#Preview {
    ColorsAndGradientsConceptView()
}

struct BasicColorView: View {

    let red: Color = .red
    let green: Color = .green
    let blue: Color = .blue

    var body: some View {
        VStackWithHeaderView(title: "Basic Colors", description: "You can use predefined colors.") {
            LazyVGrid(columns: ConceptStyle.Columns.threeColumnLayout) {
                            LabeledCircleView(labelText: "Red", style: red)
                            LabeledCircleView(labelText: "Green", style: green)
                            LabeledCircleView(labelText: "Blue", style: blue)
                        }
        }
    }
}

struct SystemColorView: View {

    let primary: Color = .primary
    let secondary: Color = .secondary
    let accentColor: Color = .accentColor

    var body: some View {
        VStackWithHeaderView(title: "System Colors", description: "You can use system colors.") {
            LazyVGrid(columns: ConceptStyle.Columns.threeColumnLayout) {
                LabeledCircleView(labelText: "Primary", style: primary)
                LabeledCircleView(labelText: "Secondary", style: secondary)
                LabeledCircleView(labelText: "Accent", style: accentColor)
            }
        }
    }
}

struct CustomColorView: View {

    let customRed: Color = Color(red: 0.9, green: 0.1, blue: 0.1)
    let customBlue: Color = Color(hex: "#3498db")
    var body: some View {
        VStackWithHeaderView(title: "Custom Colors", description: "You can use custom colors.") {
            LazyVGrid(columns: ConceptStyle.Columns.twoColumnLayout) {
                LabeledCircleView(labelText: "From RGB", style: customRed)
                LabeledCircleView(
                    labelText:
                        """
                        From Hex
                        (using extension)
                        """,
                    style: customBlue)
            }
        }
    }
}

fileprivate extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3:
            (alpha, red, green, blue) = (255, (int >> 8 * 4) * 17, (int >> 4 * 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }
}

struct GradientView: View {

    let linearGradient: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [.red, .blue]),
        startPoint: .leading,
        endPoint: .trailing)

    let radialGradient: RadialGradient = RadialGradient(
        gradient: Gradient(colors: [.yellow, .green]),
        center: .center,
        startRadius: 5,
        endRadius: 30)

    let angularGradient: AngularGradient = AngularGradient(
        gradient: Gradient(colors: [.pink, .purple]),
        center: .center)

    var body: some View {
        VStackWithHeaderView(title: "Gradients", description: "You create your own gradients.") {
            LazyVGrid(columns: ConceptStyle.Columns.threeColumnLayout) {
                LabeledCircleView(labelText: "Linear", style: linearGradient)
                LabeledCircleView(labelText: "Radial", style: radialGradient)
                LabeledCircleView(labelText: "Angular", style: angularGradient)
            }
        }
    }
}

struct MaterialView: View {

    let regularMaterial: Material = .regularMaterial
    let ultraThinMaterial: Material = .ultraThinMaterial
    let thickMaterial: Material = .ultraThickMaterial

    var body: some View {
        VStackWithHeaderView(title: "Materials", description: "Predefined semi-translusent materials") {
            LazyVGrid(columns: ConceptStyle.Columns.threeColumnLayout) {
                LabeledCircleView(labelText: "Regular", style: regularMaterial)
                LabeledCircleView(labelText: "Ultra Thin", style: ultraThinMaterial)
                LabeledCircleView(labelText: "Thick", style: thickMaterial)
            }
        }
    }
}

struct ConditionalColorView: View {

    @Environment(\.colorScheme) var colorScheme
    @State private var isActive = false

    var body: some View {
        VStackWithHeaderView(title: "Conditional Colors", description: "You can use conditional colors.") {
            LazyVGrid(columns: ConceptStyle.Columns.twoColumnLayout) {
                LabeledCircleView(labelText: "Based on Theme", style: colorScheme == .dark ? .white : .black)

                LabeledCircleView(labelText: "Tap to change", style: isActive ? Color.green : Color.red)
                    .onTapGesture {
                        isActive.toggle()
                    }
            }
        }
    }
}
