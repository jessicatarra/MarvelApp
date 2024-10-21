//
//  CharacterRemoteDataSource.swift
//  Data
//
//  Created by Jessica Tarra on 28/09/24.
//

import Foundation
import Models
import Moya

typealias CharactersResponse = BaseResponseModel<PaginationResponseModel<CharacterModel>>

public protocol CharacterRemoteDataSourceProtocol {
    func getCharacters(from offset: Int, completion: @escaping (Result<PaginationResponseModel<CharacterModel>, Error>) -> ())
}

public class CharacterRemoteDataSource: CharacterRemoteDataSourceProtocol {
    private let marvelProvider: MoyaProvider<MarvelRoute>

    public init(marvelProvider: MoyaProvider<MarvelRoute>) {
        self.marvelProvider = marvelProvider
    }

    public func getCharacters(from offset: Int, completion: @escaping (Result<PaginationResponseModel<CharacterModel>, Error>) -> ()) {
        request(target: .getCharacters(offset: offset)) { (result: Result<CharactersResponse, Error>) in
            switch result {
            case let .success(charactersResponse):
                completion(.success(charactersResponse.data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

private extension CharacterRemoteDataSource {
    private func request<T: Decodable>(target: MarvelRoute, completion: @escaping (Result<T, Error>) -> ()) {
        marvelProvider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
