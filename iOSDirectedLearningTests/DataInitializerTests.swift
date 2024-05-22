
import XCTest
@testable import iOSDirectedLearning

class DataInitializerTests: XCTestCase {
    
    func testTextAndShapesConceptInitialization() {
        let concept = DataInitializer.textAndShapesTopic
        XCTAssertEqual(concept.title, "Text and Shapes")
        XCTAssertEqual(concept.examples.count, TextAndShapesTopic.allCases.count)
        
        let firstExample = concept.examples.first
        XCTAssertEqual(firstExample?.title, TextAndShapesTopic.textConcept.title)
        XCTAssertEqual(firstExample?.description, TextAndShapesTopic.textConcept.description)

        for example in concept.examples {
            XCTAssertTrue(TextAndShapesTopic.allCases.contains { $0.rawValue == example.type.id })
            XCTAssertFalse(example.title.isEmpty)
            XCTAssertFalse(example.description.isEmpty)
        }
    }

    func testColorsAndGradientsConceptInitialization() {
        let concept = DataInitializer.colorsAndGradientsTopic
        XCTAssertEqual(concept.title, "Colors and Gradients")
        XCTAssertEqual(concept.examples.count, ColorsAndGradientsConcept.allCases.count)

        let firstExample = concept.examples.first
        XCTAssertEqual(firstExample?.title, ColorsAndGradientsConcept.colorsConcept.title)
        XCTAssertEqual(firstExample?.description, ColorsAndGradientsConcept.colorsConcept.description)
        
        for example in concept.examples {
            XCTAssertTrue(ColorsAndGradientsConcept.allCases.contains { $0.rawValue == example.type.id })
            XCTAssertFalse(example.title.isEmpty)
            XCTAssertFalse(example.description.isEmpty)
        }
    }
}

class CategoriesInitializationTests: XCTestCase {

    func testCategoriesInitialization() {
        let categories = DataInitializer.categories
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
