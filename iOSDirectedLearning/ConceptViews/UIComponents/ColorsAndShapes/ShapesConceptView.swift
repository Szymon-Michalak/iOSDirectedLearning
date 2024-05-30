import SwiftUI

struct ShapesConceptView: View {
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

#Preview {
    ScrollView {
        ShapesConceptView()
            .padding()
    }
}
