import SwiftUI

struct CustomShapesWithArcsAndQuadCurvesConceptView: View {
    var body: some View {
        VStack(spacing: 40) {
                ArcSample()
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .butt))
                    .foregroundStyle(.red.gradient)
                    .frame(width: 300, height: 300)

                ShapeWithArc()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.blue.gradient)
                QuadSample()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.green.gradient)
                WaterShape()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.yellow.gradient)
            }
    }

    private struct ArcSample: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
                path.addArc(
                    center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.height / 2,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 40),
                    clockwise: true)
            }
        }
    }

    private struct ShapeWithArc: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: CGPoint(x: rect.minX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
                path.addArc(
                    center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.height / 2,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
                path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            }
        }
    }

    private struct QuadSample: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: .zero)
                path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.minX, y: rect.maxY))
            }
        }
    }

    private struct WaterShape: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: CGPoint(x: rect.minX, y: rect.midY))

                path.addQuadCurve(
                    to: CGPoint(x: rect.midX, y: rect.midY),
                    control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25))

                path.addQuadCurve(
                    to: CGPoint(x: rect.maxX, y: rect.midY),
                    control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.75))

                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            }
        }
    }
}

#Preview {
    CustomShapesWithArcsAndQuadCurvesConceptView()
}
