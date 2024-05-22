# Workflows for Adding New Categories, Concepts, and Examples

## Adding Concepts

Adding new Concept consists of 2 steps:

1. Creating a Concept Enum
2. Adding the Concept to the CategoryInitializer

### Exact Steps:

1. **Create a New Enum Conforming to `ExampleType`**:
   - Define a new enum for the concept, ensuring it conforms to `ExampleType`.

```swift
import SwiftUI

enum NewConcept: String, CaseIterable, ExampleType {
    case example1
    case example2
    // Add more cases as needed

    var id: String { rawValue }

    var title: String {
        switch self {
        case .example1:
            return "Example 1 Title"
        case .example2:
            return "Example 2 Title"
        }
    }

    var description: String {
        switch self {
        case .example1:
            return "Example 1 Description"
        case .example2:
            return "Example 2 Description"
        }
    }

    func view() -> AnyView {
        switch self {
        case .example1:
            return AnyView(Example1View())
        case .example2:
            return AnyView(Example2View())
        }
    }
}
```

2. **Add the New Concept to `CategoryInitializer`**:
   - Add the new concept to the `CategoryInitializer` to ensure it’s included in the data initialization process.

```swift
enum CategoryInitializer {
    static let newConcept: Concept<NewConcept> = Concept(
        title: "New Concept Title",
        examples: NewConcept.allCases.map { Example(type: $0) }
    )

    static let categories: [ConceptCategory] = [
        ConceptCategory(title: "New Category", concepts: [
            AnyConcept(newConcept),
            // Add other concepts as needed
        ]),
        // Add other categories as needed
    ]
}
```

## Adding Categories

Adding new Categories consists of 1 step:

1. Adding the Category to the CategoryInitializer

### 1. Add a New Category

- Add the new category to the `CategoryInitializer` to ensure it’s included in the data initialization process.

```swift
enum DataInitializer {
    static let newConcept: Concept<NewConcept> = Concept(
        title: "New Concept Title",
        examples: NewConcept.allCases.map { Example(type: $0) }
    )

    static let categories: [ConceptCategory] = [
        ConceptCategory(title: "UI Components", concepts: [
            AnyConcept(textAndShapesConcept),
            AnyConcept(colorsAndGradientsConcept),
            // Other concepts...
        ]),
        ConceptCategory(title: "New Category", concepts: [
            AnyConcept(newConcept),
            // Add other concepts as needed
        ]),
        // Add other categories as needed
    ]
}
```

## Adding Tests

1. **Write Tests for the New Concept**:
   - Create NewConceptTests file and class inside [iOSDirectedLearningTests directory](iOSDirectedLearningTests).
   - Create tests to ensure the new concept is initialized correctly.

```swift
import XCTest
@testable import iOSDirectedLearning

class NewConceptTests: XCTestCase {

    func testNewConceptInitialization() {
        let concept = DataInitializer.newConcept
        XCTAssertEqual(concept.title, "New Concept Title")
        XCTAssertEqual(concept.examples.count, NewConcept.allCases.count)

        for example in concept.examples {
            XCTAssertTrue(NewConcept.allCases.contains { $0.rawValue == example.type.id })
            XCTAssertFalse(example.title.isEmpty)
            XCTAssertFalse(example.description.isEmpty)
        }
    }

    func testNewConceptCategoryInitialization() {
        let categories = DataInitializer.categories
        let newCategory = categories.first { $0.title == "New Category" }
        XCTAssertNotNil(newCategory)
        XCTAssertEqual(newCategory?.concepts.count, 1)

        let firstConcept = newCategory?.concepts.first
        XCTAssertEqual(firstConcept?.title, "New Concept Title")
    }
}
```
