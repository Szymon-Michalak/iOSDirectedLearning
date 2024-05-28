import SwiftUI

struct HomeView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(DomainStyles.backgroundGradient)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack {
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
