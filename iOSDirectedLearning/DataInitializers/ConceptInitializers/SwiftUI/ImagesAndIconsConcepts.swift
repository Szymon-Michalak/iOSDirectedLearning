//
//  ImagesAndIconsConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

// MARK: - Images and Icons Concepts
struct ImagesAndIconsConcepts {
    static let iconsAndSymbolsConcept = Concept(
        title: "Icons and Symbols",
        description: "Icons and Symbols",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let imagesConcept = Concept(
        title: "Images",
        description: "Images",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let asyncImageConcept = Concept(
        title: "Async Image",
        description: "Async Image",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let saveAndCacheImagesConcept = Concept(
        title: "Save and Cache Images",
        description: "Save and Cache Images",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let downloadAndSaveImagesConcept = Concept(
        title: "Download and Save Images",
        description: "Download and Save Images",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let photosPickerConcept = Concept(
        title: "PhotosPicker in SwiftUI & PhotosUI",
        description: "PhotosPicker in SwiftUI & PhotosUI",
        complexity: .beginner,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        iconsAndSymbolsConcept,
        imagesConcept,
        asyncImageConcept,
        saveAndCacheImagesConcept,
        downloadAndSaveImagesConcept,
        photosPickerConcept
    ]
}
