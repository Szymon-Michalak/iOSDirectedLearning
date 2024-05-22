
import SwiftUI

struct CategoryView: View {
    let category: Category

    var body: some View {
        List(category.concepts) { concept in
            NavigationLink(destination: ConceptView(concept: concept)) {
                Text(concept.title)
            }
        }
    }
}

#Preview {
    CategoryView(category: CategoryInitializer.categories[0])
}
