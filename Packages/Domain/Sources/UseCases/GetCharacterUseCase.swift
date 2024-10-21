//
//  GetCharacterUseCase.swift
//  Domain
//
//  Created by Jessica Tarra on 28/09/24.
//
import Entities
import Failures
import RepositoryProtocol
import UseCaseProtocol

public class GetCharacterUseCase: GetCharacterUseCaseProtocol {
    private let repository: CharacterRepositoryProtocol

    public init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }

    public func execute(with params: GetCharactersParams, completion: @escaping (Result<[Character], AppFailure>) -> Void) {
        repository.getCharacters(from: params.offset, completion: completion)
    }
}
