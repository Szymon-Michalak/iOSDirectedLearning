//
//  FileManagementConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let fileManagementTopic: Topic = Topic(
        title: "File Management",
        concepts: FileManagementConcepts.all)

}

// MARK: - File Management Concepts
fileprivate struct FileManagementConcepts {
    static let saveDataAndImagesToFileManagerConcept = Concept(
        title: "Save Data and Images to FileManager",
        description: "Save Data and Images to FileManager",
        complexity: .intermediate,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        saveDataAndImagesToFileManagerConcept
    ]
}
