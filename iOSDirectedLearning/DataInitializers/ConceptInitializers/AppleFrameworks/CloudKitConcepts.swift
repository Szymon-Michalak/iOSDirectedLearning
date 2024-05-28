//
//  CloudKitConcepts.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation
import SwiftUI

extension CategoryInitializer {

    static let cloudKitTopic: Topic = Topic(
        title: "CloudKit",
        concepts: CloudKitConcepts.all)

}

// MARK: - CloudKit Concepts
fileprivate struct CloudKitConcepts {
    static let setupCloudKitAndGetUserInfoConcept = Concept(
        title: "Setup CloudKit and Get User Info",
        description: "Setup CloudKit and Get User Info",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let cloudKitCRUDFunctionsConcept = Concept(
        title: "CloudKit CRUD Functions",
        description: "CloudKit CRUD Functions",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let uploadImagesToCloudKitConcept = Concept(
        title: "Upload Images to CloudKit",
        description: "Upload Images to CloudKit",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let sendPushNotificationsConcept = Concept(
        title: "Send Push Notifications using CloudKit",
        description: "Send Push Notifications using CloudKit",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let reusableUtilityClassForCloudKitConcept = Concept(
        title: "Reusable Utility Class for CloudKit",
        description: "Reusable Utility Class for CloudKit",
        complexity: .advanced,
        view: Text("Coming Soon")
    )

    static let all: [Concept] = [
        setupCloudKitAndGetUserInfoConcept,
        cloudKitCRUDFunctionsConcept,
        uploadImagesToCloudKitConcept,
        sendPushNotificationsConcept,
        reusableUtilityClassForCloudKitConcept
    ]
}
