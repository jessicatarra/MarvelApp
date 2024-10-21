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
    private var cache: [Int: [Character]] = [:]

    public init(charactersDataSource: CharacterRemoteDataSourceProtocol) {
        self.charactersDataSource = charactersDataSource
    }

    public func getCharacters(from offset: Int, completion: @escaping (Result<[Character], AppFailure>) -> Void) {
        if let cachedCharacters = cache[offset] {
            completion(.success(cachedCharacters))
        }

        charactersDataSource.getCharacters(from: offset) { result in
            switch result {
            case .success(let paginationResponse):
                let characters = (paginationResponse.results ?? []).compactMap { $0 as Character }
                self.cache[offset] = characters
                completion(.success(characters))

            case .failure(let error):
                let appFailure = AppFailure.serverError(message: error.localizedDescription)
                completion(.failure(appFailure))
            }
        }
    }
}

extension CharacterModel: Character {
    public var description: String? {
        return characterDescription
    }

    public var isFavorite: Bool { false }
    public var thumbnailURL: URL? { thumbnail?.url }
}
