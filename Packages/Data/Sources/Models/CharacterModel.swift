//
//  CharacterModel.swift
//  Data
//
//  Created by Jessica Tarra on 28/09/24.
//

public struct CharacterModel: Codable {
    public let id: Int?
    public let name: String?
    public let characterDescription: String?
    public let modified: String?
    public let thumbnail: ThumbnailModel?
}

extension CharacterModel {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case characterDescription = "description"
        case modified
        case thumbnail
    }
}
