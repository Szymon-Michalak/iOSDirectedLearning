
import XCTest
@testable import iOS_Directed_Learning

extension TextAndShapesConceptTests {

    func testTextAndShapesConceptConformance() {
        for concept in TextAndShapesConcept.allCases {
            XCTAssertFalse(concept.title.isEmpty)
            XCTAssertFalse(concept.description.isEmpty)
            XCTAssertNotNil(concept.view())
        }
    }
    
    func testTextAndShapesConceptExamples() {
            let concept = CategoryInitializer.textAndShapesConcept
            for example in concept.examples {
                XCTAssertTrue(TextAndShapesConcept.allCases.contains { $0.rawValue == example.type.id })
            }
        }
}

