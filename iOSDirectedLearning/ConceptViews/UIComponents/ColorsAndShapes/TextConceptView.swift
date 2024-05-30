import SwiftUI

struct TextConceptView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStackWithHeaderView(title: "Text Modifiers") {
                TextModifiers()
            }
            VStackWithHeaderView(title: "Markdown in Text") {
                MarkdownInTextView()
            }
            VStackWithHeaderView(title: "Styling Links") {
                CustomizeStyleOfLinksView()
            }

        }
        .padding()
    }
}

#Preview {
    ScrollView {
        TextConceptView()
    }
}

// MARK: - Text Modifiers
struct TextModifiers: View {
    var body: some View {
        LabeledTextView(
            labelText: "Innterpolation with text modiefiers") {
            Text("The market days are \(Text("Wednesday").bold()) and \(Text("Sunday").bold()).")
        }

        LabeledTextView(
            labelText: "Styling links") {
                Text("For more information visit our \(Text("[website](https://example.com)").underline()).")
        }

        LabeledTextView(
            labelText: "Styling portions of text combined by text concatenation") {
                Text(verbatim: "Nil Coalescing").foregroundColor(.purple) + Text(verbatim: " Limited")
        }

        LabeledTextView(
            labelText: "Using extensions to combine multiple modifiers into one") {
                Text("The party is \(Text("tomorrow").boldItalic())")
        }
    }
}

fileprivate extension Text {
    func boldItalic() -> Text {
        self.bold().italic()
    }
}

// MARK: - Markdown in Text
struct MarkdownInTextView: View {

    let regularString = "Markdown string with *emphasized* text."
    let attributedString = try? AttributedString(
        markdown: "Markdown string with *emphasized* text.")
    var body: some View {
        LabeledTextView(
            labelText: "Using markdown inside Text") {
                Text("Markdown string with *emphasized* text.")
        }
        LabeledTextView(
            labelText: "Passing markdown in property of type String won't work") {
                    Text(regularString)
        }
        LabeledTextView(
            labelText: "For markdown to work property has to be of type `AttributedString`") {
                    Text(attributedString ?? "")
        }
    }
}

// MARK: - Styling Links
struct CustomizeStyleOfLinksView: View {
    var attributedString: AttributedString {
        var result = AttributedString("Visit our website.")

        // We can force unwrap the link range,
        // because we are sure in this case,
        // that `website` string is present.
        let linkRange = result.range(of: "website")!

        result[linkRange].link = URL(string: "https://example.com")
        result[linkRange].underlineStyle = Text.LineStyle(pattern: .dash)
        result[linkRange].foregroundColor = .purple

        return result
    }

    var body: some View {
        LabeledTextView(
            labelText: "Using `tint()` modifier.") {
                Text("Visit our [website](https://example.com).")
                    .tint(.purple)
        }
        LabeledTextView(
            labelText: "Using string interpolation") {
                Text("Visit our \(Text("[website](https://example.com)").underline()).")
        }
        LabeledTextView(
            labelText: "Using `AttributedString`") {
                Text(attributedString)
        }
    }
}
