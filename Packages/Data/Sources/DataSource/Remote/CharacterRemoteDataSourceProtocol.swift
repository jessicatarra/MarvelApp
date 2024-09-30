//
//  CharacterRemoteDataSource.swift
//  Data
//
//  Created by Jessica Tarra on 28/09/24.
//

import Foundation
import Models
import Moya

public protocol CharacterRemoteDataSourceProtocol {
    func getCharacters(from offset: Int) async -> Result<PaginationResponseModel<CharacterModel>, Error>
}

public class CharacterRemoteDataSource: CharacterRemoteDataSourceProtocol {
    private let marvelProvider: MoyaProvider<MarvelRoute>

    public init(marvelProvider: MoyaProvider<MarvelRoute>) {
        self.marvelProvider = marvelProvider
    }

    public func getCharacters(from offset: Int) async -> Result<PaginationResponseModel<CharacterModel>, Error> {
        return await request(target: .getCharacters(offset: offset))
    }
}

private extension CharacterRemoteDataSource {
    private func request<T: Decodable>(target: MarvelRoute) async -> Result<T, Error> {
        await withCheckedContinuation { continuation in
            marvelProvider.request(target) { result in
                switch result {
                case let .success(response):
                    do {
                        let results = try JSONDecoder().decode(T.self, from: response.data)
                        continuation.resume(returning: .success(results))
                    } catch {
                        continuation.resume(returning: .failure(error))
                    }
                case let .failure(error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
}
