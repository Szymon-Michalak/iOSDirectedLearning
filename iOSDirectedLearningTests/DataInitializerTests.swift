
import XCTest
@testable import iOSDirectedLearning

class DataInitializerTests: XCTestCase {
    
    func testTextAndShapesConceptInitialization() {
        let topic = DataInitializer.textAndShapesTopic
        XCTAssertEqual(topic.title, "Text and Shapes")
        XCTAssertEqual(topic.concepts.count, TextAndShapesTopic.allCases.count)
        
        let firstConcept = topic.concepts.first
        XCTAssertEqual(firstConcept?.title, TextAndShapesTopic.textConcept.title)
        XCTAssertEqual(firstConcept?.description, TextAndShapesTopic.textConcept.description)

        for example in topic.concepts {
            XCTAssertTrue(TextAndShapesTopic.allCases.contains { $0.rawValue == example.type.id })
            XCTAssertFalse(example.title.isEmpty)
            XCTAssertFalse(example.description.isEmpty)
        }
    }

    func testColorsAndGradientsConceptInitialization() {
        let topic = DataInitializer.colorsAndGradientsTopic
        XCTAssertEqual(topic.title, "Colors and Gradients")
        XCTAssertEqual(topic.concepts.count, ColorsAndGradientsConcept.allCases.count)

        let firstConcept = topic.concepts.first
        XCTAssertEqual(firstConcept?.title, ColorsAndGradientsConcept.colorsConcept.title)
        XCTAssertEqual(firstConcept?.description, ColorsAndGradientsConcept.colorsConcept.description)
        
        for concept in topic.concepts {
            XCTAssertTrue(ColorsAndGradientsConcept.allCases.contains { $0.rawValue == concept.type.id })
            XCTAssertFalse(concept.title.isEmpty)
            XCTAssertFalse(concept.description.isEmpty)
        }
    }
}

class CategoriesInitializationTests: XCTestCase {

    func testCategoriesInitialization() {
        let categories = DataInitializer.categories
        XCTAssertGreaterThan(categories.count, 0)

        for category in categories {
            XCTAssertFalse(category.title.isEmpty)
            XCTAssertGreaterThan(category.topics.count, 0)

            for topic in category.topics {
                XCTAssertFalse(topic.title.isEmpty)
                XCTAssertGreaterThan(topic.concepts.count, 0)
            }
        }
    }
}
