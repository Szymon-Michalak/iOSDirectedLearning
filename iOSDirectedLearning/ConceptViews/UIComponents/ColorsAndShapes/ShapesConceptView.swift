import SwiftUI

struct ShapesConceptView: View {
    var body: some View {
        VStack(spacing: 20) {
            BasicShapesConceptView()
            CustomShapesConceptView()
            ArcsAndQuadCurvesConceptView()
        }
    }
}

#Preview {
    ScrollView {
        ShapesConceptView()
            .padding()
    }
}

struct BasicShapesConceptView: View {
    private let grid = [GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)]

    var body: some View {

        // MARK: - Circles
        VStack {
            VStackWithHeaderView(title: "Circles") {
                Text("Lorem ipsum delor")
            }
            LazyVGrid(columns: grid, spacing: 20) {
                Circle()
                    .fill(.green)
                Circle()
                    .foregroundColor(.pink)
                Circle()
                    .stroke()
                Circle()
                    .stroke(.red)
                Circle()
                    .stroke(.blue, lineWidth: 10.0)
                Circle()
                    .stroke(.orange,
                            style: StrokeStyle(
                                lineWidth: 20,
                                lineCap: .round,
                                dash: [20]))
                Circle()
                    .trim(from: 0.2, to: 1.0)
                Circle()
                    .trim(from: 0.2, to: 1.0)
                    .stroke(.purple, lineWidth: 12.0)
            }
        }
        // MARK: - Elipses
        VStack {
            VStackWithHeaderView(title: "Elipses") {
                Text("Lorem ipsum delor")
            }
            .padding(.top)
            LazyVGrid(columns: grid, spacing: 20) {
                Ellipse()
                    .frame(width: 50, height: 200)
                Ellipse()
                    .frame(height: 100)
                Ellipse()
                    .trim(from: 0.2, to: 1.0)

                Ellipse()
                    .stroke(.blue, lineWidth: 10.0)
                    .frame(height: 100)
            }
        }
        // MARK: - Rectangles
        VStack {
            VStackWithHeaderView(title: "Rectangles") {
                Text("Lorem ipsum delor")
            }
            .padding(.top)
            LazyVGrid(columns: grid, spacing: 20) {
                Rectangle()
                    .fill(.green)
                    .frame(height: 100)
                Rectangle()
                    .foregroundColor(.pink)
                    .frame(height: 300)
            }
        }

        // MARK: - Capsules
        VStack {
            VStackWithHeaderView(title: "Capsules") {
                Text("Lorem ipsum delor")
            }
            .padding(.top)
            LazyVGrid(columns: grid, spacing: 20) {
                Capsule(style: .circular)
                    .fill(.red)
                    .frame(height: 100)
                Capsule(style: .continuous)
                    .frame(height: 100)
            }
        }

        // MARK: - RoundedRectangles
        VStack {
            VStackWithHeaderView(title: "Rounded Rectangles") {
                Text("Lorem ipsum delor")
            }
            .padding(.top)
            LazyVGrid(columns: grid, spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .frame(height: 100)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.pink)
                    .frame(height: 100)
            }
        }
    }
}

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

struct ArcsAndQuadCurvesConceptView: View {
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

struct AnimatingCustomShapesConceptView: View {
    @State private var animate: Bool = false

    var body: some View {
        ZStack {
            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 50 : 0)
                .frame(width: 200, height: 200)
                .foregroundStyle(.red.gradient)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1.0).repeatForever()) {
                animate.toggle()
            }
        }
    }

    private struct RectangleWithSingleCornerAnimation: Shape {

        var cornerRadius: CGFloat

        var animatableData: CGFloat {
            get { cornerRadius }
            set { cornerRadius = newValue }
        }
        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))

                path.addArc(
                    center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 360),
                    clockwise: false)

                path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            }
        }
    }

}
