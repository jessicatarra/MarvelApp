//
//  CharacterRepository.swift
//  Data
//
//  Created by Jessica Tarra on 28/09/24.
//

import DataSource
import Entities
import Failures
import Foundation
import Models
import RepositoryProtocol

public class CharacterRepository: CharacterRepositoryProtocol {
    private let charactersDataSource: CharacterRemoteDataSourceProtocol

    public init(charactersDataSource: CharacterRemoteDataSourceProtocol) {
        self.charactersDataSource = charactersDataSource
    }

    public func getCharacters(from offset: Int) async -> Result<[Character], AppFailure> {
        let result = await charactersDataSource.getCharacters(from: offset)
        switch result {
        case .success(let data):
            let characters = data.results.map { $0 as Character }
            return .success(characters)

        case .failure(let error):
            return .failure(AppFailure.serverError(message: error.localizedDescription))
        }
    }
}

extension CharacterModel: Character {
    public var description: String? {
        return self.characterDescription
    }

    public var isFavorite: Bool { false }
    public var thumbnailURL: URL? { thumbnail?.url }
}
