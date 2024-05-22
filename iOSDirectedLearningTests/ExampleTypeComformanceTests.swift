
import XCTest
@testable import iOSDirectedLearning

extension TextAndShapesConceptTests {

    func testTextAndShapesConceptConformance() {
        for concept in TextAndShapesTopic.allCases {
            XCTAssertFalse(concept.title.isEmpty)
            XCTAssertFalse(concept.description.isEmpty)
            XCTAssertNotNil(concept.view())
        }
    }
    
    func testTextAndShapesConceptExamples() {
            let concept = DataInitializer.textAndShapesTopic
            for example in concept.examples {
                XCTAssertTrue(TextAndShapesTopic.allCases.contains { $0.rawValue == example.type.id })
            }
        }
}

