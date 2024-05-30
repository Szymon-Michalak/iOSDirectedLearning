import SwiftUI

struct CustomShapesConceptView: View {
    var body: some View {
            VStack(spacing: 40) {
                Triangle()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.red.gradient)
                Diamond()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.blue.gradient)
                Trapezoid()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.green.gradient)
            }
    }

    private struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            }
        }
    }

    private struct Diamond: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                let horizontalOffset: CGFloat = rect.width * 0.2
                path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
                path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
                path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            }
        }
    }

    private struct Trapezoid: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                let horizontalOffset: CGFloat = rect.width * 0.2
                path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            }
        }
    }

}

#Preview {
    CustomShapesConceptView()
}
