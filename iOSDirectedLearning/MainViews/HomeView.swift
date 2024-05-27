import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData

    @State private var colors: [Color] = [.red, .blue, .green, .yellow]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    HeroPagingView(modelData: modelData)
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                        .frame(height: 220)
                        .safeAreaPadding(.vertical, 15)
                        .safeAreaPadding(.horizontal, 25)

                    ForEach(modelData.categories) { category in
                        NavigationLink(destination: CategoryView(category: category)) {
                            RowView(content: category)
                        }
                    }
                    .padding(.horizontal, 20)

                    List(modelData.categories) { category in
                        NavigationLink(destination: CategoryView(category: category)) {
                            Text(category.title)
                        }
                        Text("Coming Soon...")
                    }
                    .listStyle(.plain)
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(15)
                    .navigationTitle("Explore iOS Concepts")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ModelData())
}
