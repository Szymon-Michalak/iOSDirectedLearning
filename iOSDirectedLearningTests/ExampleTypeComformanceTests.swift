
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
            let topic = DataInitializer.textAndShapesTopic
            for concept in topic.concepts {
                XCTAssertTrue(TextAndShapesTopic.allCases.contains { $0.rawValue == concept.type.id })
            }
        }
}

