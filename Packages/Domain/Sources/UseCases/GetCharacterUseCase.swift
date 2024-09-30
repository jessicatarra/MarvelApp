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

    public func execute(with params: GetCharactersParams) async -> Result<[Character], AppFailure> {
        await repository.getCharacters(from: params.offset)
    }
}
