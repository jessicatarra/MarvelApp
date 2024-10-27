//
//  CharacterItem.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 29/09/24.
//

import Entities
import Foundation

public struct CharacterItem: Equatable, Identifiable {
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

public struct DummyCharacter: Character {
    public var id: Int?
    public var name: String?
    public var description: String?
    public var modified: String?
    public var thumbnailURL: URL?
    public var isFavorite: Bool
}

extension CharacterItem {
    static func dummyCharacter() -> CharacterItem {
        let dummyCharacter = DummyCharacter(
            id: 1016181,
            name: "Spider Man",
            description: """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis nunc sed augue lacus viverra vitae congue. Arcu cursus euismod quis viverra nibh cras. Sapien eget mi proin sed. Interdum consectetur libero id faucibus nisl. Sed enim ut sem viverra aliquet eget sit amet. Elit sed vulputate mi sit. Libero volutpat sed cras ornare arcu dui. Orci a scelerisque purus semper eget duis at tellus. Ultrices sagittis orci a scelerisque. Tortor posuere ac ut consequat semper viverra nam libero. Tellus in hac habitasse platea. Nisl suscipit adipiscing bibendum est. Dignissim diam quis enim lobortis scelerisque fermentum dui faucibus. A erat nam at lectus urna duis convallis convallis. Enim neque volutpat ac tincidunt vitae semper quis. Facilisi nullam vehicula ipsum a arcu cursus. Sed augue lacus viverra vitae congue eu consequat ac felis.
            """,
            modified: "",
            thumbnailURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/9/03/5239b59f49020.jpg")!,
            isFavorite: false
        )

        return CharacterItem(character: dummyCharacter)
    }
}
