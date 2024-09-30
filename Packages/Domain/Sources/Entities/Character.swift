//
//  Character.swift
//  Domain
//
//  Created by Jessica Tarra on 28/09/24.
//

import Foundation

public protocol Character {
    var id: Int? { get }
    var name: String? { get }
    var description: String? { get }
    var modified: String? { get }
    var thumbnailURL: URL? { get }
    var isFavorite: Bool { get }
}
