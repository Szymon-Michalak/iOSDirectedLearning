
import SwiftUI

struct ShapesExampleView: View {
    private let grid = [GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)]
    
    var body: some View {
        LazyVGrid(columns: grid, spacing: 20) {
            //              MARK: - Circles
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
            
            //              MARK: - Elipses
            Ellipse()
                .frame(width: 50, height: 200)
            Ellipse()
                .frame(height: 100)
            Ellipse()
                .trim(from: 0.2, to: 1.0)
            
            Ellipse()
                .stroke(.blue, lineWidth: 10.0)
                .frame(height: 100)
            
            //                MARK: - Rectangles
            Rectangle()
                .fill(.green)
                .frame(height: 100)
            Rectangle()
                .foregroundColor(.pink)
                .frame(height: 300)
            
            //                MARK: - Capsules
            Capsule(style: .circular)
                .fill(.red)
                .frame(height: 100)
            Capsule(style: .continuous)
                .frame(height: 100)
            
            //                MARK: - RoundedRectangles
            RoundedRectangle(cornerRadius: 20)
                .fill(.green)
                .frame(height: 100)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.pink)
                .frame(height: 100)
        }
    }
}

#Preview {
    ShapesExampleView()
}
