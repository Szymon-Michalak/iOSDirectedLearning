
import XCTest
@testable import iOS_Directed_Learning

class DataInitializerTests: XCTestCase {
    
    func testTextAndShapesConceptInitialization() {
        let concept = CategoryInitializer.textAndShapesConcept
        XCTAssertEqual(concept.title, "Text and Shapes")
        XCTAssertEqual(concept.examples.count, TextAndShapesConcept.allCases.count)
        
        let firstExample = concept.examples.first
        XCTAssertEqual(firstExample?.title, TextAndShapesConcept.textExample.title)
        XCTAssertEqual(firstExample?.description, TextAndShapesConcept.textExample.description)

        for example in concept.examples {
            XCTAssertTrue(TextAndShapesConcept.allCases.contains { $0.rawValue == example.type.id })
            XCTAssertFalse(example.title.isEmpty)
            XCTAssertFalse(example.description.isEmpty)
        }
    }

    func testColorsAndGradientsConceptInitialization() {
        let concept = CategoryInitializer.colorsAndGradientsConcept
        XCTAssertEqual(concept.title, "Colors and Gradients")
        XCTAssertEqual(concept.examples.count, ColorsAndGradientsConcept.allCases.count)

        let firstExample = concept.examples.first
        XCTAssertEqual(firstExample?.title, ColorsAndGradientsConcept.colorsExample.title)
        XCTAssertEqual(firstExample?.description, ColorsAndGradientsConcept.colorsExample.description)
        
        for example in concept.examples {
            XCTAssertTrue(ColorsAndGradientsConcept.allCases.contains { $0.rawValue == example.type.id })
            XCTAssertFalse(example.title.isEmpty)
            XCTAssertFalse(example.description.isEmpty)
        }
    }
}

class CategoriesInitializationTests: XCTestCase {

    func testCategoriesInitialization() {
        let categories = CategoryInitializer.categories
        XCTAssertGreaterThan(categories.count, 0)

        for category in categories {
            XCTAssertFalse(category.title.isEmpty)
            XCTAssertGreaterThan(category.concepts.count, 0)

            for concept in category.concepts {
                XCTAssertFalse(concept.title.isEmpty)
                XCTAssertGreaterThan(concept.examples.count, 0)
            }
        }
    }
}
