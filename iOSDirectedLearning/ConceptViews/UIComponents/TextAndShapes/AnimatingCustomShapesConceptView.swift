
import SwiftUI

struct AnimatingCustomShapesConceptView: View {
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 50 : 0)
                .frame(width: 200, height: 200)
                .foregroundStyle(.red.gradient)
        }
        .onAppear() {
            withAnimation(Animation.linear(duration: 1.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    AnimatingCustomShapesConceptView()
}


fileprivate struct RectangleWithSingleCornerAnimation: Shape {
    
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
