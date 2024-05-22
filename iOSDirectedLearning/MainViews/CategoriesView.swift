

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationStack {
            List(modelData.categories) { category in
                NavigationLink(destination: CategoryView(category: category)) {
                    Text(category.title)
                }
            }
        }
    }
}

#Preview {
    CategoriesView()
}
