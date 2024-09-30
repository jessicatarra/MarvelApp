//
//  CharacterItem.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 29/09/24.
//

import Entities
import Foundation

public struct CharacterItem: Equatable {
    public let id: Int?
    public let name, description: String?
    public let modified: String?
    public let thumbnailURL: URL?
    public var isFavorite: Bool?

    public var safeDescription: String {
        if let description, !description.isEmpty {
            return description
        } else {
            return "No Description Found"
        }
    }

    public init(character: Character) {
        self.id = character.id
        self.name = character.name
        self.description = character.description
        self.modified = character.modified
        self.thumbnailURL = character.thumbnailURL
    }
}
