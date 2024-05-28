//
//  ListPresentable.swift
//  iOSDirectedLearning
//
//  Created by Szymon Michalak on 27/05/2024.
//

import Foundation

protocol ListPresentable {
    var title: String { get }
    var description: String? { get }
    var image: String? { get }
}
