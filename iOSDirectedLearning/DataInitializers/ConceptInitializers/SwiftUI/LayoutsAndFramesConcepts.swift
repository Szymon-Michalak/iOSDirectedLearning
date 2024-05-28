//
//  LayoutsAndFramesConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let layoutsAndFramesTopic: Topic = Topic(
        title: "Layouts and Frames",
        concepts: LayoutsAndFramesConcepts.all)

}

// MARK: - Layouts and Frames Concepts
fileprivate struct LayoutsAndFramesConcepts {
    static let framesAndAlignmentsConcept = Concept(
        title: "Frames and Alignments",
        description: "Frames and Alignments",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let backgroundsAndOverlaysConcept = Concept(
        title: "Backgrounds and Overlays",
        description: "Backgrounds and Overlays",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let stacksConcept = Concept(
        title: "Stacks (VStack, HStack, ZStack)",
        description: "Stacks (VStack, HStack, ZStack)",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let paddingConcept = Concept(
        title: "Padding",
        description: "Padding",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let spacerConcept = Concept(
        title: "Spacer",
        description: "Spacer",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let lazyGridsConcept = Concept(
        title: "Lazy Grids",
        description: "Lazy Grids",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let geometryReaderConcept = Concept(
        title: "GeometryReader",
        description: "GeometryReader",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let safeAreaInsetsConcept = Concept(
        title: "SafeAreaInsets",
        description: "SafeAreaInsets",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let groupConcept = Concept(
        title: "Group",
        description: "Group",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let alignmentGuidesConcept = Concept(
        title: "Alignment Guides",
        description: "Alignment Guides",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let anyLayoutConcept = Concept(
        title: "AnyLayout",
        description: "AnyLayout",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let viewThatFitsConcept = Concept(
        title: "ViewThatFits",
        description: "ViewThatFits",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let extractingSubviewsConcept = Concept(
        title: "Extracting Subviews",
        description: "Extracting Subviews",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let lazyStacksConcept = Concept(
        title: "Lazy Stacks",
        description: "Lazy Stacks",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        framesAndAlignmentsConcept,
        backgroundsAndOverlaysConcept,
        stacksConcept,
        paddingConcept,
        spacerConcept,
        lazyGridsConcept,
        geometryReaderConcept,
        safeAreaInsetsConcept,
        groupConcept,
        alignmentGuidesConcept,
        anyLayoutConcept,
        viewThatFitsConcept,
        extractingSubviewsConcept,
        lazyStacksConcept
    ]
}
