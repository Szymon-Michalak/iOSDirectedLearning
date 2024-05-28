import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient:
                                            Gradient(colors: [
                                                .purple.opacity(0.15),
                                                .purple.opacity(0.55)
                                            ]), startPoint: .top, endPoint: .bottom))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack {
                    LazyVStack {
                        HeroPagingView(modelData: modelData)
                            .scrollTargetBehavior(.viewAligned)
                            .scrollIndicators(.hidden)
                            .frame(height: 220)
                            .safeAreaPadding(.vertical, 15)
                            .safeAreaPadding(.horizontal, 25)
                            .shadow(radius: 10)
                        ScrollView {
                            ForEach(modelData.categories) { category in
                                NavigationLink(destination: CategoryView(category: category)) {
                                    RowView(content: category)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
            .navigationTitle("iOS Directed Learning")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ModelData())
}
