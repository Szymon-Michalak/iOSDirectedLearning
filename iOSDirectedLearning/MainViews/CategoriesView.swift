import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var modelData: ModelData

    @State private var colors: [Color] = [.red, .blue, .green, .yellow]

    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(modelData.getRandomExamples, id: \.id) { concept in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(concept.complexity.color)
                                .padding(.horizontal, 5)
                                .containerRelativeFrame(.horizontal)
                            VStack(alignment: .leading) {
                                Text(concept.title)
                                    .font(.title2.bold())
                                    .lineLimit(3)
                                    .foregroundStyle(.white)
                                Text(concept.description)
                                    .lineLimit(0)
                                    .foregroundStyle(.white)
                            }
                            .containerRelativeFrame(.horizontal)
                            .padding(.horizontal, 5)
                        }
                    }
                }
                .scrollTargetLayout()
                .overlay(alignment: .bottom) {
                    PagingIndicator(
                        activeTint: .white,
                        inActiveTint: .black.opacity(0.25)
                    )
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .frame(height: 220)
            .safeAreaPadding(.vertical, 15)
            .safeAreaPadding(.horizontal, 25)

            List(modelData.categories) { category in
                NavigationLink(destination: CategoryView(category: category)) {
                    Text(category.title)
                }
            }
            .clipShape(.rect(cornerRadius: 15))
            .padding(15)
            .navigationTitle("Explore Random Concepts")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CategoriesView()
        .environmentObject(ModelData())
}

struct Home: View {
    /// View Properties
    @State private var colors: [Color] = [.red, .blue, .green, .yellow]
    @State private var opacityEffect: Bool = false
    @State private var clipEdges: Bool = false
    var body: some View {
        VStack {
            /// Paging View
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(color.gradient)
                            .padding(.horizontal, 5)
                            .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
                .overlay(alignment: .bottom) {
                    PagingIndicator(
                        activeTint: .white,
                        inActiveTint: .black.opacity(0.25),
                        opacityEffect: opacityEffect,
                        clipEdges: clipEdges
                    )
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .frame(height: 220)
            .safeAreaPadding(.vertical, 15)
            .safeAreaPadding(.horizontal, 25)

            List {
                Section("Options") {
                    Toggle("Opacity Effect", isOn: $opacityEffect)
                    Toggle("Clip Edges", isOn: $clipEdges)

                    Button("Add Item") {
                        colors.append(.purple)
                    }
                }
            }
            .clipShape(.rect(cornerRadius: 15))
            .padding(15)
        }
    }
}
