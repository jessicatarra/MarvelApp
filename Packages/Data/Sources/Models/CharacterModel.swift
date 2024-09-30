//
//  CharacterModel.swift
//  Data
//
//  Created by Jessica Tarra on 28/09/24.
//

public struct CharacterModel: Decodable, Equatable {
    public let id: Int?
    public let name: String?
    public let characterDescription: String?
    public let modified: String?
    public let thumbnail: ThumbnailModel?
}
