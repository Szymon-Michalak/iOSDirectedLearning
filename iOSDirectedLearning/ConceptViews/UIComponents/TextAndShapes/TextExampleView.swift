
import SwiftUI

struct TextExampleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Default Text")
                .padding()
            
            Text("Font: Large Title")
                .font(.largeTitle)
            
            Text("Foreground Color: Red")
                .foregroundColor(.red)
            
            Text("Bold Text")
                .bold()
            
            Text("Italic Text")
                .italic()
            
            Text("Underlined Text")
                .underline()
            
            Text("Strikethrough Text")
                .strikethrough()
            
            Text("Kerning: 5")
                .kerning(5)
            
            Text("Tracking: 5")
                .tracking(5)
            
            Text("Line Limit 1")
                .lineLimit(1)
            
            Text("Line Spacing: 10")
                .lineSpacing(10)
            
            Text("Padded Text")
                .padding()
            
            Text("Background Color: Yellow")
                .background(Color.yellow)
            
            Text("Shadow")
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
        .padding()
    }
}


#Preview {
    TextExampleView()
}
